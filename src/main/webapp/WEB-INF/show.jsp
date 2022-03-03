<%--
  Created by IntelliJ IDEA.
  User: plche
  Date: 3/03/22
  Time: 11:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Show Expense</title>
        <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
        <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container ms-4 mt-4">
            <div class="row">
                <div class="col-4">
                    <h1 class="text-primary">Language Details</h1>
                </div>
                <div class="col-2">
                    <form action="/languages">
                        <button class="btn btn-sm btn-outline-warning">Dashboard</button>
                    </form>
                </div>
            </div>
            <div class="col-4">
                <table class="table">
                    <tbody>
                    <tr>
                        <td>Name:</td>
                        <td><c:out value="${language.getName()}" /></td>
                    </tr>
                    <tr>
                        <td>Creator:</td>
                        <td><c:out value="${language.getCreator()}"/></td>
                    </tr>
                    <tr>
                        <td>Version:</td>
                        <td><c:out value="${language.getCurrentVersion()}"/></td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="btn-group" role="group">
                <form action="/languages/edit/${language.id}">
                    <button class="btn btn-sm btn-outline-primary">edit</button>
                </form>
                <form action="/languages/${language.id}" method="post">
                    <input type="hidden" name="_method" value="delete">
                    <button type="submit" class="btn btn-sm btn-outline-danger">delete</button>
                </form>
            </div>
        </div>
    </body>
</html>
