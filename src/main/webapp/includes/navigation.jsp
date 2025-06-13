<nav>
    <ul>
        <li><a href="../index.jsp?menu=main">Startseite</a></li>
        <c:if test="${not empty sessionScope.currentUser}">
            <li><a href="../index.jsp?menu=patient_search">Patienten</a></li>
            <li><a href="../index.jsp?menu=treatment_schedule">Behandlungen</a></li>
            <li><a href="../index.jsp?menu=book_search">Bücher</a></li>
            <c:if test="${sessionScope.currentUser.isAdmin}">
                <li><a href="../index.jsp?menu=employee_list">Mitarbeiter</a></li>
            </c:if>
            <li><a href="../index.jsp?menu=logout">Abmelden</a></li>
        </c:if>
    </ul>
</nav>
