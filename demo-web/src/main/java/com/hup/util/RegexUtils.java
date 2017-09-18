//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package com.hup.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegexUtils {
    private static final String ERROR_PATTERN = "^(?!_)(?!.*?_$)[a-zA-Z0-9_]+$";

    public RegexUtils() {
    }

    public static boolean isMatched(String str, String pattern) {
        Pattern p = Pattern.compile(pattern);
        Matcher matcher = p.matcher(str);
        return matcher.matches();
    }

    public static boolean isErrorCode(String errorCode) {
        return isMatched(errorCode, "^(?!_)(?!.*?_$)[a-zA-Z0-9_]+$");
    }
}
