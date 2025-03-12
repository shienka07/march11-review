<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p>답입니당!</p>
    <% if (session.getAttribute("answer") != null) { %>
        <p><%= session.getAttribute("question")%> </p>
        <p>answer: <%= session.getAttribute("answer")%> </p>
        <p>thinking: <%= session.getAttribute("thinking")%> </p>
        <p>reasoning: <%= session.getAttribute("reasoning")%> </p>
    <% } %>
</body>
</html>
