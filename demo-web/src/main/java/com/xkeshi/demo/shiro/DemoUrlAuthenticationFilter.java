package com.xkeshi.demo.shiro;

import com.xkeshi.webkits.shiro.XUrlAuthenticationFilter;

/**
 * 需要做url权限判断的时候重写此类，不需要的话，可以不写
 *
 * Created by nt on 2016-12-16.
 */
public class DemoUrlAuthenticationFilter extends XUrlAuthenticationFilter {

    /**
     * 用户自定义部分，检测这个url是否有访问权限，true为有，false为没有
     *
     * @param s
     * @return
     */
    @Override
    public boolean isAccessAllowedUrl(String s) {
        return true;
    }
}
