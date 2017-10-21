package com.hup.response;

/**
 * Created by hup
 */
public class BaseResponse {

    private String status; //状态
    private String description; //描述
    private Object result;


    public BaseResponse(String status, String description, Object result) {
        this.status = status;
        this.description = description;
        this.result = result;
    }

    public BaseResponse(String status, String description) {
        this.status = status;
        this.description = description;
        this.result = null;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Object getResult() {
        return result;
    }

    public void setResult(Object result) {
        this.result = result;
    }
}
