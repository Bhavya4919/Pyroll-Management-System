<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%
String name=request.getParameter("Name");
String eid=request.getParameter("eid");
String Department=request.getParameter("Department");
String Designation=request.getParameter("Designation");
String salary=request.getParameter("salary");
try
{
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","root");
    PreparedStatement ps=con.prepareStatement("insert into newemp values(?,?,?,?,?)");
    ps.setString(1,name);
    ps.setString(2,eid);
    ps.setString(3,Department);
    ps.setString(4,Designation);
    ps.setString(5,salary);
    int x= ps.executeUpdate();
    if(x!=0)
    {
        out.println("<h1>Registered ,details saved</h1>");
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