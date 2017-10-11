//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package com.hup.exception;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Properties;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.ResourcePatternResolver;

public class ExceptionDefinitions {
    private Logger logger = LoggerFactory.getLogger(ExceptionDefinitions.class);
    @Autowired
    private ResourcePatternResolver resourcePatternResolver;
    private Properties exceptionDefinitionProps;

    public ExceptionDefinitions() {
    }

    private Properties getDefinitions() throws IOException {
        if(this.exceptionDefinitionProps == null) {
            Resource[] resources = this.resourcePatternResolver.getResources("classpath*:/props/error.properties");
            this.exceptionDefinitionProps = new Properties();
            Resource[] var2 = resources;
            int var3 = resources.length;

            for(int var4 = 0; var4 < var3; ++var4) {
                Resource resource = var2[var4];
                InputStream stream = resource.getInputStream();

                try {
                    InputStreamReader reader = new InputStreamReader(stream, "UTF-8");

                    try {
                        this.exceptionDefinitionProps.load(reader);
                    } finally {
                        reader.close();
                    }
                } finally {
                    stream.close();
                }
            }
        }

        return this.exceptionDefinitionProps;
    }

    public String getExceptionMessage(String errorCode) {
        String CANNOT_FOUND_ERROR_CODE_MESSAGE_PATTERN = "系统错误[ErrorType = ERROR_MESSAGE_DEFINITION, ErrorCode=%s]";
        String message = "";

        try {
            message = (String)this.getDefinitions().get(errorCode);
        } catch (IOException var5) {
            this.logger.error(String.format("Error message for [code=%s] is not defined", errorCode));
        }

        if(StringUtils.isEmpty(message)) {
            message = String.format("系统错误[ErrorType = ERROR_MESSAGE_DEFINITION, ErrorCode=%s]", errorCode);
        }

        return message;
    }
}
