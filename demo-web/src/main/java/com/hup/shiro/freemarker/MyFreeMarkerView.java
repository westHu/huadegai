package com.hup.shiro.freemarker;

import org.springframework.web.servlet.view.freemarker.FreeMarkerView;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

public class MyFreeMarkerView extends FreeMarkerView {

    private static final String CONTEXT_PATH = "absolutePath";

	@Override
	protected void exposeHelpers(Map<String, Object> model,
			HttpServletRequest request) throws Exception {
		/**
		 * 通过继承freemarker视图解析类org.springframework.web.servlet.view.freemarker.FreeMarkerView，
		重写exposeHelpers方法，
		 在spring里配置自己的freemarker的视图解析器，在模板中就可以通过${base}获取。
		 */
		String scheme = request.getScheme();
		String serverName = request.getServerName();
		int port = request.getServerPort();
		String path = request.getContextPath();
		String basePath = scheme + "://" + serverName + ":" + port + path;
		model.put(CONTEXT_PATH, basePath);
		super.exposeHelpers(model, request);
	}

}