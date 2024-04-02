<%-- 
    Document   : rank.jsp
    Created on : 22 Feb, 2024, 2:06:25 PM
    Author     : kmadh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rank</title>
    </head>
    <body>
        <%
            String nme="",gn="",grd="",dep="";
            double per=0,tot=0;
            if(request.getParameter("sub")!=null)
            {
                gn=request.getParameter("gender");
                if(gn.compareTo("Male")==0)
                {
                    nme="Mr"+" "+request.getParameter("fn")+" "+request.getParameter("ln");
                }
                else
                {
                    nme="Ms"+" "+request.getParameter("fn")+" "+request.getParameter("ln");
                }
                dep=request.getParameter("slctDep");
                tot=Integer.parseInt(request.getParameter("m1"))+Integer.parseInt(request.getParameter("m2"))+Integer.parseInt(request.getParameter("m3"));
                per=(tot/300)*100;
                if(per>=90)
                    grd="S";
                else if(per>=80)
                    grd="A";
                else if(per>=70)
                    grd="B";
                else if(per>=60)
                    grd="C";
                else if(per>=50)
                    grd="D";
                else if(per>=40)
                    grd="P";
                else
                    grd="FAIL";
            }
            %>
        <form name="frmRank" method="post">
            <h1 align="center">Rank</h1>
            <table align='center'>
                <tr>
                    <th>First name</th>
                    <td><input type="text" name="fn" placeholder="Enter first name" required></td>
                </tr>
                <tr>
                    <th>Last name</th>
                    <td><input type="text" name="ln" placeholder="Enter first name" required></td>
                </tr>
                <tr>
                    <th>Gender</th>
                    <td>
                        <input type="radio" name="gender" value="Male" required>Male
                        <input type="radio" name="gender" value="Female" required>Female
                    </td>
                </tr>
                <tr>
                    <th>Department</th>
                    <td>
                        <select name="slctDep" required>
                            <option value="CSE">CSE</option>
                            <option value="ME">ME</option>
                            <option value="IT">IT</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>Mark 1</th>
                    <td><input type="number" name="m1" placeholder="Enter Mark 1" max="100" required></td>
                </tr>
                <tr>
                    <th>Mark 2</th>
                    <td><input type="number" name="m2" placeholder="Enter Mark 2" max="100" required></td>
                </tr>
                <tr>
                    <th>Mark 3</th>
                    <td><input type="number" name="m3" placeholder="Enter Mark 3" max="100" required></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="sub" value="Submit">
                    </td>
                </tr>
                <tr></tr>
                <tr>
                    <td colspan="2" align="center"><h1>Rank and Details</h1></td>
                </tr>
                <tr>
                    <th>Name</th>
                    <td>:<%=nme%></td>
                </tr>
                <tr>
                    <th>Gender</th>
                    <td>:<%=gn%></td>
                </tr>
                <tr>
                    <th>
                        Department
                    </th>
                    <td>:<%=dep%></td>
                </tr>
                <tr>
                    <th>
                        Total
                    </th>
                    <td>:<%=tot%></td>
                </tr>
                <tr>
                    <th>
                        Percentage
                    </th>
                    <td>:<%=per%>%</td>
                </tr>
                <tr>
                    <th>
                        Grade
                    </th>
                    <td>:<%=grd%></td>
                </tr>
            </table>
        </form>
    </body>
</html>
