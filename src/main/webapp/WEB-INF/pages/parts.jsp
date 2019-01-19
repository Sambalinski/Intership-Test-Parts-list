<%--
  Created by IntelliJ IDEA.
  User: Sambalinski sambalinski@mail.ru
  Date: 18.01.2019
  Time: 12:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Parts list</title>

    <style type="text/css">
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #cc6641;
        }

        .tg td {
            font-family: Comic Sans MS, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #cc49c0;
            color: #f8ff34;
            background-color: #dd435e;
        }

        .tg th {
            font-family: Comic Sans MS, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #4bcc00;
            color: #f8ff34;
            background-color: #c33f5a;
        }

        .tg .tg-4eph {
            background-color: #bcdd9d
        }
    </style>
</head>

<body>
<c:if test="${fullList.size() != listAll.size()}">
    <a href="<c:url value='/redirect'/>">Назад в каталог</a>
</c:if>

<br/>
<br/>

<h1>Каталог комплектующих для сборки компьютера</h1>
<c:if test="${!empty listParts}">
    <table class="tg">
        <tr>
            <th width="80">Название</th>
            <th width="120">Обязательна ли для сборки</th>
            <th width="120">Количество</th>
                <th width="60">Редактировать позицию</th>
            <th width="60">Удалить позицию из каталога</th>
        </tr>
        <c:forEach items="${listParts}" var="part">
            <tr>
                <td>${part.name}</td>
                <td><c:choose>
                    <c:when test="${part.needed !=1}">Нет</c:when>
                    <c:otherwise>Да</c:otherwise>
                </c:choose>
                </td>
                <td>${part.quantity}</td>
                    <td><a href="<c:url value='/edit/${part.id}'/>">Редактировать деталь</a></td>
                <td><a href="<c:url value='/remove/${part.id}'/>">Удалить</a></td>
            </tr>
        </c:forEach>
    </table>

    <br/>
    <br/>

    <c:if test="${listParts.size() < listAll.size()}">
        <table>
            <tr>
                <td><a href="<c:url value='/previous'/>"><— предыдущая </a></td>
                <td width="60"></td>
                <td><a href="<c:url value='/next'/>"> следующая —></a></td>
            </tr>
        </table>
    </c:if>

    <br/>

    <table class="tg">
        <tr>
            <td width="200">Можно собрать компьютеров</td>
            <td width="30">${countComputers}</td>
        </tr>
    </table>

</c:if>

<br/>

<table>
    <tr>
        <td><a href="<c:url value='/parts/selectNeeded'/>">Необходимые для сборки</a></td>
        &nbsp;&nbsp;&nbsp;
        <td><a href="<c:url value='/parts/selectNoNeeded'/>">Дополнительные</a></td>
    </tr>
</table>

<br/>

<h1>Введите параметры позиции для изменения или добавления</h1>

<c:url var="addAction" value="/parts/add"/>
<form:form action="${addAction}" commandName="part">
    <table>
        <c:if test="${!empty part.name}">
            <tr>
                <td>
                    <form:label path="id">
                        <spring:message text="ID"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="id" readonly="true" size="8" disabled="true"/>
                    <form:hidden path="id"/>
                </td>
            </tr>
        </c:if>
        <tr>
            <td>
                <form:label path="name">
                    <spring:message text="Название"/>
                </form:label>
            </td>
            <td>
                <form:input path="name"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="needed">
                    <spring:message text="Необходимость для сборки"/>
                </form:label>
            </td>
            <td>
                <form:input path="needed"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="quantity">
                    <spring:message text="Количество"/>
                </form:label>
            </td>
            <td>
                <form:input path="quantity"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">

                <input type="submit" value="<spring:message text="Добавить/Изменить"/>"/>
            </td>
        </tr>
    </table>
</form:form>

<h1>Поиск детали</h1>
<c:url var="searchAction" value="/parts/search"/>

<form:form action="${searchAction}" commandName="part">
    <table>
        <tr>
            <td>
                <form:label path="name">
                    <spring:message text="Название позиции"/>
                </form:label>
            </td>
            <td>
                <form:input path="name"/>
            </td>

        </tr>
        <tr>
            <td colspan="2">

                <input type="submit" value="<spring:message text="Найти"/>"/>

            </td>
        </tr>

    </table>
</form:form>

</body>
</html>