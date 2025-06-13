<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
    <title>Spital Management</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<%@include file="includes/header.jsp"%>

<main>
    <c:choose>
        <%-- Login Handler --%>
        <c:when test="${param.menu == 'login'}">
            <%@include file="pages/auth/login_handler.jsp"%>
        </c:when>

        <%-- Hauptmenü --%>
        <c:when test="${not empty sessionScope.currentUser}">
            <c:choose>
                <c:when test="${param.menu == 'main'}">
                    <%@include file="pages/main_menu.jsp"%>
                </c:when>
                <c:when test="${param.menu == 'patient_search'}">
                    <%@include file="pages/patient/patient_search.jsp"%>
                </c:when>
                <c:when test="${param.menu == 'treatment_schedule'}">
                    <%@include file="pages/treatment/treatment_schedule.jsp"%>
                </c:when>
                <c:when test="${param.menu == 'book_loan'}">
                    <%@include file="pages/book/book_loan.jsp"%>
                </c:when>
                <%-- Weitere Menüpunkte --%>
                <c:otherwise>
                    <%@include file="pages/main_menu.jsp"%>
                </c:otherwise>
            </c:choose>
        </c:when>

        <%-- Login Formular --%>
        <c:otherwise>
            <%@include file="pages/auth/login.jsp"%>
        </c:otherwise>
    </c:choose>
</main>

<%@include file="includes/footer.jsp"%>
</body>
</html>
