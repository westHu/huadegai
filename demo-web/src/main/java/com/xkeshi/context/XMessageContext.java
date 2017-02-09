package com.xkeshi.context;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.parser.Feature;
import com.xkeshi.util.MapUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.http.HttpMethod;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Map;
import java.util.Set;

/**
 * Created by hpj on 2015/5/21.
 * <p/>
 * This class should be initialized in interceptor
 */
public class XMessageContext {

    protected static final ThreadLocal<XMessageContext> THREAD_LOCAL = new ThreadLocal<XMessageContext>() {
        @Override
        protected XMessageContext initialValue() {
            return new XMessageContext();
        }
    };

    protected HttpServletRequest request;
    private JSONObject postJsonBody;
    private String postJsonBodyStr;
    private Map<String, String> requestParamMap;
    private boolean skipCheckSignature = false;

    private boolean isInited = false;

    protected XMessageContext() {

    }

    /**
     * 创建context
     *
     * @return
     */
    public static XMessageContext createContext() {
        XMessageContext xContext = new XMessageContext();
        THREAD_LOCAL.set(xContext);

        return xContext;
    }

    /**
     * 获取当前Context
     *
     * @return
     */
    public static XMessageContext getCurrentContext() {
        return THREAD_LOCAL.get();
    }


    /**
     * 在Interceptor中使用，初始化参数
     */
    public void init(HttpServletRequest request) {
        this.request = request;
        this.isInited = true;
        if (isPostRequest()) {
            this.postJsonBody = parse(request);
        }
    }

    /**
     * 获取请求对应的URL
     */
    public String getServiceUrl() {
        String queryString = request.getQueryString();
        if(StringUtils.isNotEmpty(queryString)) {
            return request.getServletPath() + "?" + queryString;
        } else {
            return request.getServletPath();
        }
    }

    /**
     * 获取Request中所有参数的HashCode
     *
     * @return HashCode
     */
    public int getRequestHashCode() {
        if (isPostRequest()) {
            return this.postJsonBody.hashCode();
        }
        return request.getParameterMap().hashCode();
    }

    /**
     * 将参数序列化成字符串
     *
     * @return
     */
    public String getParamsString() {
        Map<String, String> paramMap = getParameterMap();
        Set<String> keySets = paramMap.keySet();

        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append("hashcode=").append(getRequestHashCode());
        for (String key : keySets) {
            /** 过滤upYun开头的参数 */
            if(key.startsWith("upYun")){
                continue;
            }
            if (key.contains("password")) {
                stringBuffer.append(",").append(key).append("=").append("******");
            } else {
                String value = paramMap.get(key);
                stringBuffer.append(",").append(key).append("=").append(value);
            }
        }
        return stringBuffer.toString();
    }

    /**
     * 获取参数列表
     *
     * @return
     */
    public Map<String, String> getParameterMap() {
        if (requestParamMap == null) {
            if (isPostRequest()) {
                requestParamMap = MapUtils.convertValueToString(this.postJsonBody);
            } else {
                requestParamMap = MapUtils.convertValueToString(request.getParameterMap());
            }
        }
        return requestParamMap;

    }


    /**
     * 获取参数
     *
     * @return
     */
    public String getParameter(String key) {
        return getParameterMap().get(key);
    }

    /**
     * Method 为POST时候以JSON方式传递参数
     *
     * @return
     */
    public String getPostJsonBodyStr() {
        if (StringUtils.isEmpty(postJsonBodyStr)) {
            throw new RuntimeException();
        }

        return postJsonBodyStr;
    }

    /**
     * 判断请求类型是否为Post
     *
     * @return 是否为Post请求
     */
    public boolean isPostRequest() {
        if (request == null) {
            throw new RuntimeException();
        }

        boolean isPost = request.getMethod().equals(HttpMethod.POST.name()) || request.getMethod().equals(HttpMethod.PUT.name());
        return isPost && isJsonRequest();
    }

    /**
     * 判断请求类型是否为Json
     *
     * @return 是否为Json请求
     */
    public boolean isJsonRequest(){
        if (request == null) {
            throw new RuntimeException();
        }

        String contentType = request.getContentType();
        if (contentType.contains("application/json") || contentType.contains("text/json")){
            return true;
        }
        return false;
    }

    public boolean isOpenApiRequest(){
        return getServiceUrl().indexOf("/api") == 0;
    }

    /**
     * 将request中inputStream 解析为JSONObject
     *
     * @param request
     * @return 解析RequestBody中的Json字符串
     */
    private JSONObject parse(HttpServletRequest request) {
        try {
            postJsonBodyStr = IOUtils.toString(request.getInputStream(), "UTF-8");
            //subString 去掉"data="前缀
            if (postJsonBodyStr.contains("{\"data\":")) {
                postJsonBodyStr = (String) JSON.parseObject(postJsonBodyStr).get("data");
                return JSON.parseObject(postJsonBodyStr, Feature.SupportArrayToBean);
            }
            return JSON.parseObject(postJsonBodyStr, Feature.SupportArrayToBean);
        } catch (IOException ex) {
            throw new RuntimeException();
        }
    }

 /*   public SignType getSignType(){
        String signTypeStr = request.getHeader("signType");
        Ensure.that(SignType.isSignType(signTypeStr)).isTrue("F_WEBKITS_SIGN_1007");
        return SignType.valueOf(signTypeStr);
    }*/

    //主要是为了解决老框架中，区分ajax与OpenApi接口
    public boolean isInited() {
        return isInited;
    }

    public boolean isSkipCheckSignature() {
        return skipCheckSignature;
    }

    public void setSkipCheckSignature(boolean skipCheckSignature) {
        this.skipCheckSignature = skipCheckSignature;
    }

    /**
     * 清理当前线程中的数据
     */
    public void clear() {
        request = null;
        postJsonBody = null;
        postJsonBodyStr = null;
        requestParamMap = null;
        isInited = false;
    }

    public static void clearCurrentContext() {
        XMessageContext context = getCurrentContext();
        if(context != null){
            context.clear();
        }
        THREAD_LOCAL.remove();
    }
}