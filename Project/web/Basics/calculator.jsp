<%-- 
    Document   : calculator.jsp
    Created on : 18 Feb, 2024, 11:47:22 AM
    Author     : kmadh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calculator</title>
    </head>
    <body>
        <%
            int c=0 ;
            
            if(request.getParameter("btAdd")!=null)
            {
                int a=Integer.parseInt(request.getParameter("n1"));
            int b=Integer.parseInt(request.getParameter("n2"));
                c=a+b;
                //out.println(c);
            }
            else if(request.getParameter("btSub")!=null)
            {
                int a=Integer.parseInt(request.getParameter("n1"));
            int b=Integer.parseInt(request.getParameter("n2"));
                c=a-b;
                //out.println(c);
            }
            else if(request.getParameter("btMul")!=null)
            {
                int a=Integer.parseInt(request.getParameter("n1"));
            int b=Integer.parseInt(request.getParameter("n2"));
                c=a*b;
                //out.println(c);
            }
            else if(request.getParameter("btDiv")!=null)
            {
                int a=Integer.parseInt(request.getParameter("n1"));
            int b=Integer.parseInt(request.getParameter("n2"));
                c=a/b;
                //out.println(c);
            }
         %>
        <form name="frmCalc" method="post">
        <h1>Calculator</h1>
        <table align="center" border="1">
            <tr>
                <th>No1</th>
                <td><input type="text" name="n1" placeholder="Enter n1" required></td>
            </tr>
            <tr>
                <th>No2</th>
                <td><input type="text" name="n2" placeholder="Enter n2" required></td>
            </tr>
            <tr>
                <th colspan="2">
                    <input type="submit" name="btAdd" value="+">
                    <input type="submit" name="btSub" value="-">
                    <input type="submit" name="btMul" value="*">
                    <input type="submit" name="btDiv" value="/">
                </th>
            </tr>
            <tr>
                <th>Result</th>
                <td> 
                    <%=c%>
                </td>
            </tr>
        </table>
        </form>
        
    </body>
</html>
