//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package com.xkeshi.exception;


import com.xkeshi.context.ApplicationContextHelper;

public class XExceptionFactory {
    private static ExceptionDefinitions exceptionDefinitions;

    public XExceptionFactory() {
    }

    public static XBusinessException create(String errorCode, String... args) {
        String exceptionPattern = getExceptionDefinitions().getExceptionMessage(errorCode);
        if(args.length > 0) {
            String errorMsg = String.format(exceptionPattern, args);
            return new XBusinessException(errorCode, errorMsg);
        } else {
            return new XBusinessException(errorCode, exceptionPattern);
        }
    }

    private static ExceptionDefinitions getExceptionDefinitions() {
        if(exceptionDefinitions == null) {
            exceptionDefinitions = (ExceptionDefinitions) ApplicationContextHelper.getContext().getBean(ExceptionDefinitions.class);
        }

        return exceptionDefinitions;
    }
}
