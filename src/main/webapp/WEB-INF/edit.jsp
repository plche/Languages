<%--
  Created by IntelliJ IDEA.
  User: plche
  Date: 3/03/22
  Time: 11:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Languages</title>
        <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
        <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="row justify-content-center ms-4 mt-4">
            <div class="col-4">
                <div class="row">
                    <div class="col-8">
                        <h1 class="text-primary text-center mb-3">Edit Language</h1>
                    </div>
                    <div class="col-4">
                        <div class="btn-group" role="group">
                            <form action="/languages/${language.id}" method="post">
                                <input type="hidden" name="_method" value="delete">
                                <button type="submit" class="btn btn-sm btn-outline-danger">delete</button>
                            </form>
                            <form action="/languages">
                                <button class="btn btn-sm btn-outline-warning">Dashboard</button>
                            </form>
                        </div>
                    </div>
                </div>
                <form:form class="rounded border border-5 border-primary" action="/languages" method="post" modelAttribute="language">
                    <input type="hidden" name="_method" value="put">
                    <div class="row justify-content-center">
                        <div class="col-9">
                            <form:label for="name" path="name" class="form-label mt-3">Language:</form:label>
                            <form:errors path="name" cssClass="text-danger" />
                            <form:input type="text" class="form-control mb-3" id="name" path="name" aria-label="Language's name" />
                            <form:label for="creator" path="creator" class="form-label">Creator:</form:label>
                            <form:errors path="creator" cssClass="text-danger" />
                            <form:input type="text" class="form-control mb-3" id="vendor" path="creator" aria-label="Language's creator"/>
                            <form:label for="currentVersion" path="currentVersion" class="form-label">Version:</form:label>
                            <form:errors path="currentVersion" cssClass="text-danger" />
                            <form:input type="text" class="form-control mb-3" id="currentVersion" path="currentVersion" aria-label="Language's version" />
                            <div class="d-flex justify-content-end">
                                <button type="submit" class="btn btn-primary mb-3">Submit</button>
                            </div>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </body>
</html>
