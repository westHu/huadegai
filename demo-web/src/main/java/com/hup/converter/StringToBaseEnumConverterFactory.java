package com.hup.converter;

import com.hup.enums.IBaseEnum;
import org.springframework.core.convert.converter.Converter;
import org.springframework.core.convert.converter.ConverterFactory;

/**
 * Description： 将String转换为枚举类型
 */
public class StringToBaseEnumConverterFactory implements ConverterFactory<String, IBaseEnum> {
    @Override
    public <T extends IBaseEnum> Converter<String, T> getConverter(Class<T> targetType) {
        System.out.println("==== 将String转换为枚举类型 ======");
        if (!targetType.isEnum()) {
            throw new UnsupportedOperationException("只支持转换到枚举类型");
        }
        return new StringToBaseEnumConverter(targetType);
    }

    private class StringToBaseEnumConverter<T extends IBaseEnum> implements Converter<String, T> {
        private final Class<T> enumType;

        public StringToBaseEnumConverter(Class<T> enumType) {
            this.enumType = enumType;
        }

        @Override
        public T convert(String s) {
            for (T t : enumType.getEnumConstants()) {
                if (s.equals(t.getValue())) {
                    return t;
                }
            }
            return null;
        }
    }
}