package com.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

@WebFilter(filterName = "EncodingFilter")
public class EncodingFilter implements Filter {
    String encoding;
    public void init(FilterConfig filterConfig) throws ServletException {
        String coding = filterConfig.getInitParameter("encoding");
        if (coding != null) {
            encoding = coding;
        } else {
            encoding = "GB2312";
        }
    }
    public void destroy() {
    }
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {
        request.setCharacterEncoding(encoding); //处理请求字符集
        response.setContentType("text/html;charset=" + encoding); //处理响应字符集
        chain.doFilter(request, response); //传递给下一个过滤器
    }
}
