package com.tlv8.system.service;

import com.tlv8.common.constant.CacheConstants;
import com.tlv8.common.constant.Constants;
import com.tlv8.common.redis.RedisCache;
import com.tlv8.common.utils.IDUtils;
import com.tlv8.common.utils.StringUtils;
import com.tlv8.system.bean.ContextBean;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

public class TokenService {
    // 令牌自定义标识
    @Value("${token.header}")
    private String header;

    // 令牌秘钥
    @Value("${token.secret}")
    private String secret;

    // 令牌有效期（默认30分钟）
    @Value("${token.expireTime}")
    private int expireTime;

    protected static final long MILLIS_SECOND = 1000;

    protected static final long MILLIS_MINUTE = 60 * MILLIS_SECOND;

    private static final Long MILLIS_MINUTE_TEN = 20 * 60 * 1000L;

    @Autowired
    private RedisCache redisCache;

    /**
     * 获取用户身份信息
     *
     * @return 用户信息
     */
    public ContextBean getContextBean(HttpServletRequest request) {
        // 获取请求携带的令牌
        String token = getToken(request);
        if (StringUtils.isNotEmpty(token)) {
            try {
                Claims claims = parseToken(token);
                // 解析对应的权限以及用户信息
                String uuid = (String) claims.get(Constants.LOGIN_USER_KEY);
                String userKey = getTokenKey(uuid);
                ContextBean user = redisCache.getCacheObject(userKey);
                return user;
            } catch (Exception e) {
            }
        }
        return new ContextBean();
    }

    /**
     * 设置用户身份信息
     */
    public void setContextBean(ContextBean contextBean) {
        if (StringUtils.isNotNull(contextBean) && StringUtils.isNotEmpty(contextBean.getToken())) {
            refreshToken(contextBean);
        }
    }

    public void deleteContextBean(String token) {
        if (StringUtils.isNotEmpty(token)) {
            String userKey = getTokenKey(token);
            redisCache.deleteObject(userKey);
        }
    }

    /**
     * 创建令牌
     *
     * @param contextBean 用户信息
     * @return 令牌
     */
    public String createToken(ContextBean contextBean) {
        String token = IDUtils.fastUUID();
        contextBean.setToken(token);
        refreshToken(contextBean);
        Map<String, Object> claims = new HashMap<>();
        claims.put(Constants.LOGIN_USER_KEY, token);
        return createToken(claims);
    }

    /**
     * 从数据声明生成令牌
     *
     * @param claims 数据声明
     * @return 令牌
     */
    private String createToken(Map<String, Object> claims) {
        String token = Jwts.builder()
                .setClaims(claims)
                .signWith(SignatureAlgorithm.HS512, secret).compact();
        return token;
    }

    /**
     * 从令牌中获取数据声明
     *
     * @param token 令牌
     * @return 数据声明
     */
    private Claims parseToken(String token) {
        return Jwts.parser()
                .setSigningKey(secret)
                .parseClaimsJws(token)
                .getBody();
    }

    /**
     * 验证令牌有效期，相差不足20分钟，自动刷新缓存
     *
     * @param contextBean
     * @return 令牌
     */
    public void verifyToken(ContextBean contextBean) {
        long expireTime = contextBean.getExpireTime();
        long currentTime = System.currentTimeMillis();
        if (expireTime - currentTime <= MILLIS_MINUTE_TEN) {
            refreshToken(contextBean);
        }
    }

    /**
     * 刷新令牌有效期
     *
     * @param contextBean 登录信息
     */
    public void refreshToken(ContextBean contextBean) {
        contextBean.setLoginTime(System.currentTimeMillis());
        contextBean.setExpireTime(contextBean.getLoginTime() + expireTime * MILLIS_MINUTE);
        // 根据uuid将loginUser缓存
        String userKey = getTokenKey(contextBean.getToken());
        redisCache.setCacheObject(userKey, contextBean, expireTime, TimeUnit.MINUTES);
    }


    /**
     * 获取请求token
     *
     * @param request
     * @return token
     */
    private String getToken(HttpServletRequest request) {
        try {
            String token = request.getHeader(header);
            if (token != null && StringUtils.isNotEmpty(token) && token.startsWith(Constants.TOKEN_PREFIX)) {
                token = token.replace(Constants.TOKEN_PREFIX, "");
            }
            return token;
        }catch (Exception e){
        }
        return null;
    }

    private String getTokenKey(String uuid) {
        return CacheConstants.LOGIN_TOKEN_KEY + uuid;
    }

}