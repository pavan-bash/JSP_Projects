<%@ page import="java.sql.*" %>
<%
   String table=request.getParameter("TABLE");
   try{
  Class.forName("oracle.jdbc.driver.OracleDriver");
  
  Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","tiger");

  Statement st=con.createStatement();
  ResultSet rs=
	  st.executeQuery("SELECT * from "+table);

  ResultSetMetaData rsmd=rs.getMetaData();
  int nc=rsmd.getColumnCount();

  out.print("<body bgcolor=green text=white>");
  out.print("<h1 align=center> DB Application </h1><hr><br><br>");

  out.print("<table align=center border=2>");
  out.print("<tr bgcolor=maroon>");
      for(int c=1;c<=nc;c++)
	   { out.print
		  ("<th>"+rsmd.getColumnName(c)+"</th>");
	    }
  out.print("</tr>");
  while(rs.next())
	   {
	      out.print("<tr bgcolor=blue>");
		     for( int co=1;co<=nc ; co++)
		          { out.print
				 ("<td>"+rs.getString(co)+"</td>"); }
		  out.print("</tr>");
       }

  out.print("</table>");
  st.close();
  con.close();
   }
   catch(SQLException | ClassNotFoundException e)
   {
	   out.print
		   ("<h1>Unable to process ... "+e+"</h1>");
   }
%>
</body>