package com.tlv8.flw.expression;

import java.util.List;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;
import javax.servlet.http.HttpServletRequest;

import org.openjdk.nashorn.api.scripting.NashornScriptEngineFactory;

import com.tlv8.common.base.Sys;
import com.tlv8.common.utils.CodeUtils;
import com.tlv8.flw.bean.ExpressionBean;
import com.tlv8.flw.helper.ExpressionTreeHelper;

public class BooleanExpression {
	/**
	 * 表达式值:true或false
	 */
	public static boolean verdict(String express) {
		ScriptEngineManager engineManager = new ScriptEngineManager();
		engineManager.registerEngineName("customScriptEngineFactory", new NashornScriptEngineFactory());
		ScriptEngine engine = engineManager.getEngineByName("JavaScript"); // 得到脚本引擎
		try {
			express = express.toLowerCase().replace(" or ", " || ");
			express = express.toLowerCase().replace(" and ", " && ");
			String result = String.valueOf(engine.eval(express));
			if ("true".equals(result)) {
				return true;
			}
			if ("false".equals(result)) {
				return false;
			}
			if (Float.valueOf(result) > 0) {
				return true;
			}
		} catch (ScriptException e) {
		}
		return false;
	}

	/**
	 * 执行JS表达式
	 */
	public static String getScriptExpressionVal(String expression) {
		ScriptEngineManager engineManager = new ScriptEngineManager();
		engineManager.registerEngineName("customScriptEngineFactory", new NashornScriptEngineFactory());
		ScriptEngine engine = engineManager.getEngineByName("JavaScript"); // 得到脚本引擎
		try {
			expression = expression.replace("\n", "");
			return String.valueOf(engine.eval(expression));
		} catch (ScriptException e) {
		}
		return expression;
	}

	/**
	 * 执行JS表达式
	 * 
	 * @param resolutionExpression
	 * @return
	 */
	public static String getScriptExpressionVal(Object resolutionExpression) {
		ScriptEngineManager engineManager = new ScriptEngineManager();
		engineManager.registerEngineName("customScriptEngineFactory", new NashornScriptEngineFactory());
		ScriptEngine engine = engineManager.getEngineByName("JavaScript"); // 得到脚本引擎
		try {
			resolutionExpression = resolutionExpression.toString().replace("\n", "");
			return String.valueOf(engine.eval(resolutionExpression.toString()));
		} catch (ScriptException e) {
		}
		return (String) resolutionExpression;
	}

	/**
	 * 解析表达式
	 */
	public static Object resolutionExpression(String expression, HttpServletRequest request) {
		Object result = CodeUtils.decodeSpechars(expression);
		List<String> funcIDs = ExpressionResolution.getExpressId(result.toString(), request);
		for (int i = funcIDs.size() - 1; i >= 0; i--) {
			String ExpressId = funcIDs.get(i);
			ExpressionBean express = new ExpressionTreeHelper().getExpression(ExpressId);
			if (express != null) {
				Object re = Sys.invoke(express.getJavacode(),
						(Object[]) ExpressionResolution.getExpreesionParam(result.toString(), ExpressId, request))
						.toString();
				String func = ExpressionResolution.getFuncExpress(result.toString(), ExpressId);
				re = re.toString().replace("(", "&rlt;");
				re = re.toString().replace(")", "&rgt;");
				re = re.toString().replace("\"", "&amp;");
				result = result.toString().replace(func, "\"" + re + "\"");
			}
		}
		result = result.toString().replace("&rlt;", "(");
		result = result.toString().replace("&rgt;", ")");
		result = result.toString().replace("&amp;", "\"");
		return result;
	}

}
