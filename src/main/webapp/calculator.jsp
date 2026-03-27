<%@ page import="jakarta.xml.soap.*" %>
<%@ page import="java.net.URL" %>

<html>
<head>
    <title>Calculator SOAP</title>
</head>
<body>

<h2>Calculator Web Service</h2>

<form method="post">
    A: <input type="text" name="a" value="<%= request.getParameter("a") != null ? request.getParameter("a") : "" %>" /><br><br>

    B: <input type="text" name="b" value="<%= request.getParameter("b") != null ? request.getParameter("b") : "" %>" /><br><br>

    <button name="op" value="add">+</button>
    <button name="op" value="sub">-</button>
    <button name="op" value="mul">*</button>
    <button name="op" value="div">/</button>
</form>

<hr>

<%
    String result = "";

    if (request.getParameter("a") != null) {
        int a = Integer.parseInt(request.getParameter("a"));
        int b = Integer.parseInt(request.getParameter("b"));
        String op = request.getParameter("op");

        try {
            // SOAP request
            String soapRequest =
                    "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:ser=\"http://service.bit.ueh.edu.vn/\">" +
                            "<soapenv:Body>" +
                            "<ser:" + op + ">" +
                            "<arg0>" + a + "</arg0>" +
                            "<arg1>" + b + "</arg1>" +
                            "</ser:" + op + ">" +
                            "</soapenv:Body>" +
                            "</soapenv:Envelope>";

            // URL service (KHÔNG có ?wsdl)
            URL url = new URL("http://localhost:8081/LAB_01/calculatorWebService");

            SOAPConnectionFactory factory = SOAPConnectionFactory.newInstance();
            SOAPConnection connection = factory.createConnection();

            MessageFactory mf = MessageFactory.newInstance();
            SOAPMessage message = mf.createMessage(
                    null,
                    new java.io.ByteArrayInputStream(soapRequest.getBytes())
            );

            SOAPMessage soapResponse = connection.call(message, url);

// lấy kết quả
            result = soapResponse.getSOAPBody().getTextContent();
        } catch (Exception e) {
            result = "Error: " + e.getMessage();
        }
    }
%>

<h3>Result: <%= result %></h3>

</body>
</html>