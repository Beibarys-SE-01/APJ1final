<%@ page import="com.myslanty.models.User" %><%--
  Created by IntelliJ IDEA.
  User: Sungat Kaparov, Beibarys
  Date: 16.11.2020
  Time: 17:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    User cur = (User)request.getSession().getAttribute("user");
%>
<head>
    <title>Event</title>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
</head>
<script>
    $( document ).ready(function () {
        $.ajax({
            url: 'api/clubs/<%=request.getParameter("id")%>',
            type: 'GET',
            contentType: "application/json",
            success:
                function (data) {
                    $("#testing").append(
                        "<h2>" + data.clubName + "</h2>" +
                        "<b>Description: </b>" + data.description
                    )
                }
        });
        $.ajax({
            url: 'api/news/<%=request.getParameter("id")%>',
            type: 'GET',
            contentType: "application/json",
            success:
                function (data) {
                    $("#testing2").append(
                        "<h3>" + "News: " + data.title + "</h3>" +
                        "<b>Content: </b>" + data.content
                    )
                }
        });
    });
</script>
<body>
<div class="jumbotron jumbotron-fluid">
    <div class="container">
        <h1 class="display-4">Welcome <%=cur.getName()%></h1>
    </div>
    <div class="list">
        <ul class="list-group list-group-horizontal">
            <li class="list-group-item"><a href="#">Clubs</a></li>
            <li class="list-group-item"><a href="#">News</a></li>
            <li class="list-group-item"><a href="#">Events</a></li>
            <li class="list-group-item"><a href="#">Users</a></li>
            <input type="button" class="btn btn-dark" id="butn" value="Log Out">
        </ul>
    </div>
</div>
<div id="testing"></div>
<div id="testing2"></div>
<a href="clubDelete.jsp?id=<%=request.getParameter("id")%>">Delete</a>
<a href="clubUpdate.jsp?id=<%=request.getParameter("id")%>">Update Club</a>
<a href="eventAdd.jsp?id=<%=request.getParameter("id")%>">Add Event</a>

</body>
</html>
