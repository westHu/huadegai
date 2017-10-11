//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package com.hup.util;

public enum SignType {
    MD5("MD5"),
    RSA("RSA"),
    DSA("DSA");

    private String value;

    SignType(String value) {
        this.value = value;
    }

    public String getValue() {
        return this.value;
    }

    public static boolean isSignType(String name) {
        SignType[] arr$ = values();
        int len$ = arr$.length;

        for(int i$ = 0; i$ < len$; ++i$) {
            SignType signType = arr$[i$];
            if(signType.getValue().equals(name)) {
                return true;
            }
        }

        return false;
    }
}
