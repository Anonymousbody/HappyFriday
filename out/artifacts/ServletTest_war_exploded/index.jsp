
<%@page contentType="text/html; charset=GBK"%>
<%
   if (application.getAttribute("count") == null) {
   application.setAttribute("count", new Integer(0));
   }
  Integer count = (Integer) application.getAttribute("count");
  application.setAttribute("count", new Integer(count.intValue() + 1));
%>
<html>
<head>
  <title>ҳ�汻������ͳ��</title>
</head>
<body bgcolor="#ffffff">
<form action="RequestJsp.jsp">
  <p></p>
  <p></p>
  <h1>
     <input type="submit" name="sub" value="���!"/>
  </h1>

  <!--������ʴ��� -->
  <h1>��ҳ���ѱ�������
    ${applicationScope.count} ��
  </h1>
</form>
</body>
</html>
