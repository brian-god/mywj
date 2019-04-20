package com.hugo.utils.myjstl;

import com.alibaba.fastjson.JSONArray;

/**
 * 自定义jstl
 */
public class ElFunctions {
    /**
     * 将字符串转json数组
     * @param jsonStr
     * @return
     */
    public static JSONArray toJsonArray(String jsonStr){
        // 将字符串转json数组
        JSONArray json = JSONArray.parseArray(jsonStr);
        return json;
    }
    /**
     * 是否是单选
     * @param str
     * @return
     */
    public static Boolean singleElection(String str){
        //是否单选
        if("单选".equals(str)){
            return true;
        }
        return false;
    }
    /**
     * 是否是多选
     * @param str
     * @return
     */
    public static Boolean multipleElection(String str){
        //是否单选
        if("多选".equals(str)){
            return true;
        }
        return false;
    }
}
