package com.example.web;

import java.io.IOException;
import javax.servlet.*;

public class PodAndVersionFilter implements Filter {
    public void init(FilterConfig filterConfig) throws ServletException {}

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        // Get pod name from Kubernetes
        String podName = System.getenv("HOSTNAME");
        request.setAttribute("podName", podName);

        // Set app version (adjust as needed)
        String versionName = "v1.0.0";
        request.setAttribute("versionName", versionName);

        chain.doFilter(request, response);
    }

    public void destroy() {}
}
