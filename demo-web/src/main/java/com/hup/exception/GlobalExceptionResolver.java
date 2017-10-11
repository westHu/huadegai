package com.hup.exception;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.hup.context.XContext;
import com.hup.output.Result;
import com.hup.util.RegexUtils;
import com.hup.util.ResponseUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.validation.BindException;
import org.springframework.validation.ObjectError;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ValidationException;
import java.io.IOException;
import java.util.Properties;

/**
 * Created by nt on 2015-09-06.
 */
public class GlobalExceptionResolver extends SimpleMappingExceptionResolver {

    private String defaultPath;

    private Properties exceptionMappings;

    public void setDefaultPath(String defaultPath) {
        this.defaultPath = defaultPath;
    }

    public void setExceptionMappings(Properties exceptionMappings) {
        this.exceptionMappings = exceptionMappings;
    }

    protected ModelAndView doResolveException(HttpServletRequest request,
                                              HttpServletResponse response, Object handler, Exception ex) {
        boolean isAjax = isJsonRequest(handler, request);
        if (isAjax) {
            return jsonExceptionHandler(response, ex);
        }
        return generalExceptionHandler(request, response, ex);
    }

    private ModelAndView generalExceptionHandler(HttpServletRequest request,
                                                 HttpServletResponse response, Exception ex) {
        ModelAndView mav = new ModelAndView();
        String name = ex.getClass().getName();
        String path = this.exceptionMappings.getProperty(name);
        String wrapperPath = StringUtils.isEmpty(path) ? this.defaultPath : path;
        mav.setViewName(wrapperPath);
        //dubbo异常 -- 由于加上校验
        optimizationExceprionLog(ex);
        Result result = getExceptionResult(response, ex);
        mav.addObject("result", result);
        return mav;
    }


    /**
     * 优化log输出
     * @param ex
     */
    private void optimizationExceprionLog(Exception ex){
        //dubbo异常 -- 由于加上校验,优化异常输出
        if(!logger.isDebugEnabled() /*&& ex instanceof RpcException*/){
            logger.error(ex.fillInStackTrace());
            Throwable cause = ex.getCause();
            if(cause == null){
                return ;
            }
            StackTraceElement[] stackTrace = cause.getStackTrace();
            if(stackTrace == null){
                return ;
            }
            for (StackTraceElement trace :  stackTrace) {
                String className = trace.getClassName();
                if(StringUtils.contains(className,"hup")){
                    logger.error(trace.toString());
                }
            }
        }else{
            logger.error(ex);
        }
    }

    public ModelAndView jsonExceptionHandler(HttpServletResponse response, Exception e) {
        //dubbo异常 -- 由于加上校验
        optimizationExceprionLog(e);
        Result result = getExceptionResult(response, e);
        ServletOutputStream stream = null;
        try {
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.setHeader("Cache-Control", "no-cache, must-revalidate");
            stream = response.getOutputStream();
            stream.write(JSON.toJSONBytes(result, SerializerFeature.QuoteFieldNames));
        } catch (Exception e1) {
        } finally {
            if (stream != null) {
                try {
                    stream.close();
                } catch (IOException e1) {
                    e1.printStackTrace();
                }
            }
        }
        XContext.clearCurrentContext();
        return new ModelAndView();
    }

    private Result getExceptionResult(HttpServletResponse response, Exception e) {
        Exception ex = e;
        if ((e instanceof MethodArgumentNotValidException)) {
            ObjectError objectError = ((MethodArgumentNotValidException) e)
                    .getBindingResult().getAllErrors().get(0);
            String validationMsg = objectError.getDefaultMessage();
            ex = handleErrorMessage(validationMsg);
        } else if ((e instanceof BindException)) {
            ObjectError objectError = ((BindException) e)
                    .getBindingResult().getAllErrors().get(0);
            String validationMsg = objectError.getDefaultMessage();
            ex = handleErrorMessage(validationMsg);
        } else if ((e instanceof HttpRequestMethodNotSupportedException)) {
            HttpRequestMethodNotSupportedException exception = (HttpRequestMethodNotSupportedException) e;
            response.setStatus(405);
            ex = new XBusinessException("X00405", "接口不允许".concat(
                    exception.getMethod()).concat("请求"), exception);
        } else if ((e instanceof XEmptyRequestBodyException)) {
            ex = new XBusinessException("-2", "请求的json参数不能为空");
        } else if ((e instanceof JSONException)) {
            ex = new XBusinessException("-3", StringUtils.join("请求参数格式错误", e.getMessage().replace("\"", "")));
        }
        return getFaultResponse(ex);
    }

    private boolean isJsonRequest(Object handler, HttpServletRequest request) {
        if ( handler != null && ((HandlerMethod) handler).getMethodAnnotation(ResponseBody.class)  instanceof ResponseBody) {
            return true;
        }
        return  isAjaxRequest(request);
    }

    /**判断是否未 ajax请求*/
    private boolean isAjaxRequest(HttpServletRequest request) {
        return StringUtils.equalsIgnoreCase("XMLHttpRequest", request.getHeader("X-Requested-With"));
    }

    private XBusinessException handleErrorMessage(String validationMsg) {
        if (RegexUtils.isErrorCode(validationMsg)) {
            return XExceptionFactory.create(validationMsg);
        }

        String code = "-1";
        String errMsg = validationMsg;
        return new XBusinessException(code, errMsg);
    }

    private Result getFaultResponse(Exception e) {
        if ((e instanceof XBusinessException)) {
            return ResponseUtils.getXBusinessResult(e);
        }
        if ((e instanceof ValidationException)) {
            if ((e.getCause() instanceof XBusinessException)) {
                return ResponseUtils.getXBusinessResult((XBusinessException) e
                        .getCause());
            }
            return ResponseUtils.getFaultResult();
        }

        if ((e instanceof Exception)) {
            return ResponseUtils.getFaultResult();
        }
        return ResponseUtils.getUnknownResult();
    }
}

