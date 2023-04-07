package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Connection;
import db_connection.db_connection;

public final class deposit_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/usernav.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css\\main.css\">\n");
      out.write("\n");
      out.write("    <!--<link rel=\"stylesheet\" href=\"bootstrap\\css\\bootstrap.min.css\">-->\n");
      out.write("    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC\" crossorigin=\"anonymous\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    \n");
      out.write("        \n");
      out.write("        <body style=\"background-color: #DFF6FF;\">\n");
      out.write("    <div class=\"col-md-12\">\n");
      out.write("    <div class=\"nav-bar\">\n");
      out.write("<div id=\"main-title\">\n");
      out.write("\n");
      out.write("<a href=\"index.html\">MYSORE BANK</a>\n");
      out.write("    \n");
      out.write("</div>\n");
      out.write("        <ul><li> <a href=\"balance.jsp\">Balance</a>\n");
      out.write("        <li><a href=\"deposit.jsp\">Deposit</a></li>\n");
      out.write("        <li><a href=\"withdraw.jsp\">Withdraw</a></li>\n");
      out.write("        <li><a href=\"transfer.jsp\">Transfer</a></li>\n");
      out.write("        <li><a id=\"btn1\" style=\"border: 2px; border-radius: 10%; background-color: green;\n");
      out.write("    border-color:#25316D;\" href=\"logout.jsp\">Logout</a></li>\n");
      out.write("        </ul>\n");
      out.write("    </div>\n");
      out.write("    </div> <!--\n");
      out.write("    <centre>\n");
      out.write("<div class=\"row justify-content-md-center\" id=\"balancerow\">\n");
      out.write("    <div class=\"col-md-8 justify-content-md-center\" id=\"balance\" style=\"height: 200px;\">\n");
      out.write("    </div>\n");
      out.write("    </div>\n");
      out.write("</centre>\n");
      out.write("\n");
      out.write("<centre>\n");
      out.write("    <div class=\"row justify-content-md-center\">\n");
      out.write("<div class=\"col-md-10\" id=\"mainscreen\" style=\"height: 100px;\">\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("</centre>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write(" The Modal \n");
      out.write("\n");
      out.write("<div class=\"row justify-content-md-center\"> \n");
      out.write("  <div class=\"row1\" style='background-color: black;\n");
      out.write("  height: 100px;z-index: 1;top: 0;'>\n");
      out.write("  </div>\n");
      out.write("  </div>\n");
      out.write("\n");
      out.write("     The Modal \n");
      out.write("    <div class=\"container\" id=\"top\">\n");
      out.write("      <centre>\n");
      out.write("    <div class=\"row justify-content-md-center\">\n");
      out.write("      <div class=\"col-md-5\">\n");
      out.write("    <div id=\"myModal\" style=\"display:block;\" class=\"myModal\">\n");
      out.write("    \n");
      out.write("    \n");
      out.write("       Modal content \n");
      out.write("      <div class=\"modalcontent\">\n");
      out.write("        <h1>Hello</h1>\n");
      out.write("        <span class=\"close\" onclick=\"closeModal()\">&times;</span>\n");
      out.write("        <p>Some text in the Modal..</p>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("    </div>\n");
      out.write("    </div>\n");
      out.write("    </centre>\n");
      out.write("    </div>\n");
      out.write("    <button id=\"myBtn\" onclick=\"openModal()\">Open Modal</button>\n");
      out.write("\n");
      out.write(" <centre>\n");
      out.write("    <button id=\"myBtn\">Open Modal</button>\n");
      out.write("<div id=\"myModal\" class=\"modal\">\n");
      out.write("\n");
      out.write("   Modal content \n");
      out.write("  <div class=\"modal-content\">\n");
      out.write("    <span class=\"close\">&times;</span>\n");
      out.write("    <p>Some text in the Modal..</p>\n");
      out.write("  </div>\n");
      out.write("\n");
      out.write("</div>\n");
      out.write("</centre> -->\n");
      out.write("<script src=\"jquery/jquery.min.js\"></script>\n");
      out.write("  <script src=\"bootstrap/js/bootstrap.min.js\"></script>\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        \n");
      out.write("        ");
 try{
            String accno=session.getAttribute("accno").toString();
            db_connection db=new db_connection();
            Connection con=db.dbcon();
            
            String query="select * from account where account_no=?";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1, accno);
            ResultSet rs=ps.executeQuery();
            rs.next();
            String name=rs.getString("name");
            int balance=rs.getInt("balance");
            
      out.write("\n");
      out.write("            <centre>\n");
      out.write("<div class=\"row justify-content-md-center\" id=\"balancerow\">\n");
      out.write("    <div class=\"col-md-8 justify-content-md-center\" id=\"balance\">\n");
      out.write("        ");

            out.println("<h4 class='headlines'>Account Holder Name : "+name+"</h4>");
            out.println("<h4 class='headlines'>Account Number : "+accno+"</h4>");
             out.println("<h4 class='headlines'>Balance : Rs."+balance+"</h4>");
            
      out.write("\n");
      out.write("    </div>\n");
      out.write("    </div>\n");
      out.write("</centre>\n");
      out.write("            \n");
      out.write("<!--            out.println(\"Name \"+name+\"<br>\");\n");
      out.write("            out.println(\"Accno \"+accno+\"<br>\");-->\n");
      out.write("           \n");
      out.write("            <centre>\n");
      out.write("    <div class=\"row justify-content-md-center\">\n");
      out.write("        <div class=\"col-md-11\" id=\"mainscreen\" style=\"background-color:#BCCEF8;\">\n");
      out.write("\n");
      out.write("        \n");
      out.write("        <div class=\"row\">\n");
      out.write("            <div class=\"col-md-3\" style=\"float: left;padding-left: 5px;\">\n");
      out.write("                <div class=\"buttons\">\n");
      out.write("                    <ul class=\"buttons\" style='list-style-type: none;' class=\"buttons\">\n");
      out.write("                <li style=\"margin: 10px; padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;\"><a style=\"color:white;text-decoration: none;font-weight: bolder;\" class=\"lists\" href=\"balance.jsp\">Balance</a></li> \n");
      out.write("                <li style=\"margin: 10px;padding: 5px; background-color:#0D4C92; border: 2px black;border-radius: 5px;\"><a style=\"color:white; text-decoration: underline;font-weight:bolder;padding: 120px;\" class=\"lists\" href=\"deposit.jsp\">Deposit</a> </li>\n");
      out.write("                <li style=\" margin: 10px;padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;\"><a style=\"color:white;text-decoration: none;font-weight: bolder;\" class=\"lists\" href=\"withdraw.jsp\">Withdraw</a></li>\n");
      out.write("                <li style=\"margin: 10px; padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;\"><a style=\"color:white;text-decoration: none;font-weight: bolder;\" class=\"lists\" href=\"transfer.jsp\">Transfer</a></li>\n");
      out.write("                <li style=\"margin: 10px; padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;\"><a style=\"color:white;text-decoration: none;font-weight: bolder;\" class=\"lists\" href=\"ministatement.jsp\">Mini Statement</a></li>\n");
      out.write("                <li style=\"margin: 10px; padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;\"><a style=\"color:white;text-decoration: none;font-weight: bolder;\" class=\"lists\" href=\"accountsettings.jsp\">Set Transaction Limit</a></li>\n");
      out.write("                <li style=\"margin: 10px; padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;\"><a style=\"color:white;text-decoration: none;font-weight: bolder;\" class=\"lists\" href=\"block.jsp\">Request for Block</a></li>\n");
      out.write("                <li style=\"margin: 10px; padding: 5px; background-color:#1363DF; border: 2px black;border-radius: 5px;\"><a style=\"color:white;text-decoration: none;font-weight: bolder;\" class=\"lists\" href=\"update_password.jsp\">Password Update</a></li></ul>\n");
      out.write("                </div>  </div>\n");
      out.write("            <div class=\"col-md-9\" style=\"float:right;\">\n");
      out.write("               \n");
      out.write("                   \n");
      out.write("                   \n");
      out.write("                ");
 
                    out.println("<form method='post' action='deposit_db.jsp'>" );
                     out.println("<h2 class='headlines' style='color:black;padding-top:20px;'>Enter Amount to Deposit : <input type='text' name='depositamt' placeholder='in Rs'><br></h2>");
                     
            out.println("<input type='submit' style='background-color:green;color:white;padding:8px;margin-left:80%;border-radius:5px;' value='Deposit'>");
                     
        }
        catch(Exception e){
            out.println(e);
        }
            
      out.write("\n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("    </div>\n");
      out.write("</centre>\n");
      out.write("<!--        <centre>\n");
      out.write("            <div class=\"row justify-content-md-center\">\n");
      out.write("            <div class=\"col-md-3\">\n");
      out.write("                <div class=\"modalmsg\" id=\"modalmsg\" style=\" background-color: black;height: 150px;width:300px; z-index:1\">\n");
      out.write("                <div class=\"msgheader\" id=\"msgheader\">\n");
      out.write("                    \n");
      out.write("                </div>\n");
      out.write("                <div class=\"msgmsg\" id=\"msgmsg\">\n");
      out.write("                    \n");
      out.write("                </div>\n");
      out.write("                <div class=\"msgfooter\" id=\"msgfooter\">\n");
      out.write("                    \n");
      out.write("                </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            </div>\n");
      out.write("        </centre>-->\n");
      out.write("\n");
      out.write("      \n");
      out.write("            \n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
