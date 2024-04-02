<%-- 
    Document   : LargestSmallest.jsp
    Created on : 18 Feb, 2024, 12:48:03 PM
    Author     : kmadh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Largest and Smallest</title>
    </head>
    <body>
        <%
            int s=0,l=0;
            if(request.getParameter("S")!=null)
            {
               int n1=Integer.parseInt(request.getParameter("n1"));
               int n2=Integer.parseInt(request.getParameter("n2"));
               int n3=Integer.parseInt(request.getParameter("n3"));
               if((n1>n3) && (n1>n2))
                   l=n1;
               else if(n2>n1 && n2>n3)
                   l=n2;
               else
                   l=n3;
               if(n1<n3 && n1<n2)
                   s=n1;
               else if(n2<n1 && n2<n3)
                   s=n2;
               else
                   s=n3;
            }
        %>    
           
        <form name="frmLS" method="post">
            <h1>Bring em on!!!</h1>
            <table align="center">
                <tr>
                    <th>No1</th>
                    <td><input type="text" name="n1" placeholder="Enter No1" required></td>
                </tr>
                <tr>
                    <th>No2</th>
                    <td><input type="text" name="n2" placeholder="Enter No2" required></td>
                </tr>
                <tr>
                    <th>No3</th>
                    <td><input type="text" name="n3" placeholder="Enter No3" required></td>
                </tr
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="S" value="Submit">
                    </td>
                </tr>
                <tr>
                    <th colspan="2" align="center">Largest=<%=l%></th>
                </tr>
                <tr>
                     <th colspan="2" align="center">Smallest=<%=s%></th>
                </tr>
            </table>
        </form>
    </body>
</html>
