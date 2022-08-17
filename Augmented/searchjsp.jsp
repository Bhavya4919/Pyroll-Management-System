<%@ page import="java.sql.*"%>
<link href="style3.css" rel="stylesheet" type="text/css">
<%
try
{
    Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","root");
	String idsearch=request.getParameter("idsearch");
    Statement stmt = con.createStatement();
    ResultSet flag=stmt.executeQuery(" select * from newemp where eid='"+idsearch+"'");

    if(flag.next())
    {
        ResultSet rs=stmt.executeQuery(" select * from newemp where eid='"+idsearch+"'");
        ResultSetMetaData rsmd=rs.getMetaData();
        int colCount=rsmd.getColumnCount();
        out.print("<center><table><tr>");
        for(int i=1;i<=colCount;i++)
        out.print("<td><b>"+rsmd.getColumnLabel(i)+"</b></td>");
        out.print("</tr>");
        while(rs.next())
        {
            out.print("<tr>");
            for(int i=1;i<=colCount;i++)
            out.print("<td>"+rs.getString(i)+"</td>");
            out.print("</tr>");
        }
        out.print("</table></center>");
        rs.close();
    }
    else
    {
        out.print("<center><h3>No data exist</h3></center>");
    }
    flag.close();
    con.close();
}
catch(Exception e)
{
	out.println(e);
}
%>