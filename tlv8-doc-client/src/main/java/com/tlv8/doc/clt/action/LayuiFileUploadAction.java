package com.tlv8.doc.clt.action;

import java.io.InputStream;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.tlv8.common.db.DBUtils;
import com.tlv8.doc.clt.doc.AbstractDoc;
import com.tlv8.doc.clt.doc.Doc;
import com.tlv8.doc.clt.doc.DocDBHelper;
import com.tlv8.doc.clt.doc.DocUtils;
import com.tlv8.doc.clt.doc.Docs;
import com.tlv8.doc.clt.pojo.SaDocnode;
import com.tlv8.doc.clt.service.SaDocnodeService;

/**
 * layui 文件上传 通用接口
 *
 * @author 陈乾
 *
 */
@Controller
@RequestMapping("/utils")
public class LayuiFileUploadAction {
    @Autowired
    SaDocnodeService saDocnodeService;
    @Autowired
    DocDBHelper docDBHelper;
    @Autowired
    Docs docs;

    @ResponseBody
    @RequestMapping(value = "/layuiFileUploadAction", method = RequestMethod.POST)
    public Object execute(@RequestParam("file") MultipartFile file, String docPath, String dbkey, String rowid,
                          String tablename, String cellname) throws Exception {
        JSONObject res = new JSONObject();
        if (docPath == null || "".equals(docPath)) {
            docPath = "/root";
        } else {
            try {
                docPath = URLDecoder.decode(docPath, "UTF-8");
            } catch (Exception e) {
            }
        }
        try {
            String fileName = file.getOriginalFilename();
            Map<String, String> m = upLoadFiletoDaisy("/", fileName, file.getInputStream());
            String docID = docDBHelper.addDocData(docPath, fileName, file.getContentType(),
                    String.valueOf(m.get("Size")), m.get("cacheName"));
            String fileID = m.get("cacheName");
            Doc doc = docs.queryDocById(docID);
            doc.commitFile();
            DocUtils.saveDocFlag(docDBHelper.getHost(), docPath, doc.getSkind(), doc.getScachename(),
                    doc.getScachename(), false);
            fileID = doc.getSfileid();
            SaDocnode docnode = saDocnodeService.selectByPrimaryKey(docID);
            docnode.setSfileid(fileID);
            saDocnodeService.updateByPrimaryKey(docnode);
            if (rowid != null && !"".equals(rowid) && !"undefined".equals(rowid)) {
                String keyfield = "fid";
                if ("system".equals(dbkey)) {
                    keyfield = "sid";
                }
                SQL query = new SQL().SELECT(cellname).FROM(tablename).WHERE(keyfield + "=?");
                SQL upsql = new SQL().UPDATE(tablename).SET(cellname + "=?").WHERE(keyfield + "=?");
                SqlSession session = DBUtils.getSqlSession();
                Connection conn = null;
                PreparedStatement ps = null;
                PreparedStatement ps1 = null;
                ResultSet rs = null;
                try {
                    conn = session.getConnection();
                    JSONArray jsona = new JSONArray();
                    ps1 = conn.prepareStatement(query.toString());
                    ps1.setString(1, rowid);
                    rs = ps1.executeQuery();
                    if (rs.next()) {
                        String fileinfo = rs.getString(1);
                        try {
                            jsona = JSON.parseArray(fileinfo);
                        } catch (Exception e) {
                            try {
                                jsona = JSON.parseArray(transeJson(fileinfo));
                            } catch (Exception er) {
                            }
                        }
                    }
                    if (jsona == null) {
                        jsona = new JSONArray();
                    }
                    JSONObject jsono = new JSONObject();
                    jsono.put("fileID", fileID);
                    jsono.put("filename", doc.getSdocname());
                    jsono.put("filesize", doc.getSsize());
                    jsono.put("md5", DigestUtils.md5Hex(file.getBytes()));
                    jsona.add(jsono);
                    ps = conn.prepareStatement(upsql.toString());
                    ps.setString(1, jsona.toString());
                    ps.setString(2, rowid);
                    ps.executeUpdate();
                    session.commit(true);
                } catch (Exception e) {
                    session.rollback(true);
                    e.printStackTrace();
                } finally {
                    DBUtils.closeConn(null, null, ps1, rs);
                    DBUtils.closeConn(session, conn, ps, null);
                }
            }
            res.put("code", 0);
            res.put("fileID", fileID);
            res.put("msg", "上传成功！");
        } catch (Exception e) {
            res.put("code", -1);
            res.put("msg", "上传失败！");
            e.printStackTrace();
        }
        return res;
    }

    public static String transeJson(String str) {
        str = str.replace(":", ":\"");
        str = str.replace(",", "\",");
        str = str.replace("}", "\"}");
        str = str.replace("}{", "},{");
        str = str.replace(";", "\",");
        return str;
    };

    private Map<String, String> upLoadFiletoDaisy(String DocPath, String DocName, InputStream file) throws Exception {
        AbstractDoc doca = new AbstractDoc(docDBHelper);
        doca.setSdocpath(DocPath);
        doca.setSdocname(DocName);
        doca.upload(false, file);
        DocUtils.saveDocFlag(docDBHelper.getHost(), DocPath, doca.getSkind(), doca.getScachename(),
                doca.getScachename(), false);
        Map<String, String> rem = new HashMap<>();
        rem.put("Kind", doca.getSkind());
        rem.put("cacheName", doca.getScachename());
        rem.put("Size", String.valueOf(doca.getSsize()));
        rem.put("sDocName", DocName);
        return rem;
    }

}
