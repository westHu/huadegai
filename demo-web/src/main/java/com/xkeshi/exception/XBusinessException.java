//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package com.xkeshi.exception;


public class XBusinessException extends XRuntimeException {
    public static final String DEFAULT_FAULT_CODE = "X0001";
    private String xCode;
    private String message;

    public XBusinessException(String message) {
        this("X0001", message);
    }

    public XBusinessException(String xCode, String message) {
        this(xCode, message, new Throwable());
    }

    public XBusinessException(String xCode, String message, String internalMessage) {
        this(xCode, message, internalMessage, (Throwable)null);
    }

    public XBusinessException(String code, String message, Throwable throwable) {
        this(code, message, throwable.getMessage(), throwable);
    }

    public XBusinessException(String xCode, String message, String internalMessage, Throwable throwable) {
        this.message = message;
        this.xCode = xCode;
    }

    public String getXCode() {
        return this.xCode;
    }

    public void setXCode(String xCode) {
        this.xCode = xCode;
    }

    public String getMessageWithoutCode() {
        return this.message;
    }

    public String getMessage() {
        return "[" + this.xCode + "]" + " - " + this.message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
