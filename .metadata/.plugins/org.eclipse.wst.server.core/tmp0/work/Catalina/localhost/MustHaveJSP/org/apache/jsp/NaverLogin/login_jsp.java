/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/10.1.40
 * Generated at: 2025-05-19 06:22:13 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.NaverLogin;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports,
                 org.apache.jasper.runtime.JspSourceDirectives {

  private static final jakarta.servlet.jsp.JspFactory _jspxFactory =
          jakarta.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.LinkedHashSet<>(4);
    _jspx_imports_packages.add("jakarta.servlet");
    _jspx_imports_packages.add("jakarta.servlet.http");
    _jspx_imports_packages.add("jakarta.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile jakarta.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public boolean getErrorOnELNotFound() {
    return false;
  }

  public jakarta.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final jakarta.servlet.http.HttpServletRequest request, final jakarta.servlet.http.HttpServletResponse response)
      throws java.io.IOException, jakarta.servlet.ServletException {

    if (!jakarta.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final jakarta.servlet.jsp.PageContext pageContext;
    jakarta.servlet.http.HttpSession session = null;
    final jakarta.servlet.ServletContext application;
    final jakarta.servlet.ServletConfig config;
    jakarta.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    jakarta.servlet.jsp.JspWriter _jspx_out = null;
    jakarta.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("   <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("   <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("   <title>NaverLoginSDK Test whit BootStrap</title>\r\n");
      out.write("    <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js\"></script>\r\n");
      out.write("    <script src=\"naveridlogin_js_sdk_2.0.2.js\"></script>\r\n");
      out.write("</head>\r\n");
      out.write("   <body>\r\n");
      out.write("      <a id=\"gnbLogin\" href=\"#\">Login</a>\r\n");
      out.write("      \r\n");
      out.write("      <div id=\"naverIdLogin\">\r\n");
      out.write("      </div>\r\n");
      out.write("      <script>\r\n");
      out.write("         var naverLogin = new naver.LoginWithNaverId({\r\n");
      out.write("               clientId : \"VGueyLh0lh_q1Cx1XVmi\",\r\n");
      out.write("               callbackUrl : \"http://localhost:8081/MustHaveJSP/NaverLogin/login.jsp\",\r\n");
      out.write("               isPopup : false,\r\n");
      out.write("               loginButton : {color: \"green\", type : 3, height : 60}\r\n");
      out.write("         });\r\n");
      out.write("         \r\n");
      out.write("         naverLogin.init();\r\n");
      out.write("         \r\n");
      out.write("         $(\"#gnbLogin\").attr(\"href\", naverLogin.generateAuthorizeUrl());\r\n");
      out.write("         \r\n");
      out.write("         window.addEventListener('load', function () {\r\n");
      out.write("            naverLogin.getLoginStatus(function (status) {\r\n");
      out.write("               if (status) {\r\n");
      out.write("                  setLoginStatus();\r\n");
      out.write("               }\r\n");
      out.write("            });\r\n");
      out.write("         });\r\n");
      out.write("         \r\n");
      out.write("         function setLoginStatus() {\r\n");
      out.write("            console.log(naverLogin.user);\r\n");
      out.write("            var uid = naverLogin.user.getId();\r\n");
      out.write("            var profileImage = naverLogin.user.getProfileImage();\r\n");
      out.write("            var uName = naverLogin.user.getName();\r\n");
      out.write("            var nickName = naverLogin.user.getNickName();\r\n");
      out.write("            var eMail = naverLogin.user.getEmail();\r\n");
      out.write("\r\n");
      out.write("            $(\"#naverIdLogin\").html(\r\n");
      out.write("                  '<br><br><img src=\"' + profileImage + \r\n");
      out.write("                  '\" height=50 /> <p>' + uid + \"-\" + uName + '님 반갑습니다.</p>');\r\n");
      out.write("\r\n");
      out.write("            $(\"#gnbLogin\").html(\"Logout\");\r\n");
      out.write("            $(\"#gnbLogin\").attr(\"href\", \"#\");\r\n");
      out.write("            $(\"#gnbLogin\").click(function () {\r\n");
      out.write("               naverLogin.logout();\r\n");
      out.write("               window.location.replace(\"login.jsp\");\r\n");
      out.write("            });\r\n");
      out.write("         }\r\n");
      out.write("\r\n");
      out.write("      </script>\r\n");
      out.write("   </body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof jakarta.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
