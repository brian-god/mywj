package com.hugo.Interceptor;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by lxs on 2019/4/1.
 */
public class UserLoginInterceptor extends HandlerInterceptorAdapter {
    // 在业务处理器处理请求之前被调用
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
        // equalsIgnoreCase 与 equals的区别？
        if("POST".equalsIgnoreCase(request.getMethod())){
            //RequestUtil.saveRequest();
        }
        System.out.println("preHandle...");
        String username = (String) request.getSession().getAttribute("user");
        if(null == username){
            // 跳转到登录页面
            request.getRequestDispatcher("/WEB-INF/views/login/login.jsp").forward(request, response);
            return false;
        }
        else{
            return true;
        }
    }
    // 在业务处理器处理请求完成之后，生成视图之前执行
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception{
        System.out.println("postHandle...");
        if(modelAndView != null){
            Map<String, String> map = new HashMap<String, String>();
            modelAndView.addAllObjects(map);
        }
    }
    // 在DispatcherServlet完全处理完请求之后被调用，可用于清理资源
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception{
    }

}
