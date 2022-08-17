<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%
String eid=request.getParameter("eid");
String basicsalary=request.getParameter("basicsalary");
String medicalallow=request.getParameter("medicalallow");
String hra=request.getParameter("hra");
String ta=request.getParameter("ta");
String da=request.getParameter("da");
String Deduction=request.getParameter("Deduction");
try
{
    Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","root");
    PreparedStatement ps=con.prepareStatement("insert into salary values(?,?,?,?,?,?,?)");
    ps.setString(1,eid);
    ps.setString(2,basicsalary);
    ps.setString(3,medicalallow);
    ps.setString(4,hra);
    ps.setString(5,ta);
    ps.setString(6,da);
    ps.setString(7,Deduction);
    int x= ps.executeUpdate();
    if(x!=0)
    {
        out.println("<h1>Salary ,details saved</h1>");
    }
    else
    {
        out.print("Something went wrong...");
    }
}
catch(Exception e)
{
out.println(e);
}
%>




