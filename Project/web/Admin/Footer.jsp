<%-- 
    Document   : Footer
    Created on : 7 Apr, 2024, 10:33:11 AM
    Author     : PRITHVIRAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
</div>
    </div>
  </div>
  <script src="../Assets/Templates/Admin/libs/jquery/dist/jquery.min.js"></script>
  <script src="../Assets/Templates/Admin/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <script src="../Assets/Templates/Admin/js/sidebarmenu.js"></script>
  <script src="../Assets/Templates/Admin/js/app.min.js"></script>
  <script src="../Assets/Templates/Admin/libs/apexcharts/dist/apexcharts.min.js"></script>
  <script src="../Assets/Templates/Admin/libs/simplebar/dist/simplebar.js"></script>
  <script src="../Assets/Templates/Admin/js/dashboard.js"></script>
    <script>
                            function sendMail()
                            {
                                $.ajax({
                                    url: "../Assets/AjaxPages/AjaxMail.jsp",
                                    success: function(html) {
                                       alert(html);
                                    }
                                });
                            }
    </script>
</body>

</html>
