<%@include file="../../includes/header.jsp"%>

<h2>Patientensuche</h2>

<form action="index.jsp" method="get">
    <input type="hidden" name="menu" value="patient_search">

    <label>Nachname:</label>
    <input type="text" name="lastname" value="${param.lastname}">

    <label>Patientennummer:</label>
    <input type="text" name="patient_id">

    <button type="submit">Suchen</button>
</form>

<c:if test="${not empty param.lastname or not empty param.patient_id}">
    <sql:query var="patients" dataSource="${db}">
        SELECT p.*, pat.Patientennummer
        FROM Person p
        JOIN Patient pat ON p.SVNR = pat.SVNR
        WHERE p.Nachname LIKE ?
        AND (? = '' OR pat.Patientennummer = ?)
        <sql:param value="%${param.lastname}%"/>
        <sql:param value="${empty param.patient_id ? '' : param.patient_id}"/>
        <sql:param value="${empty param.patient_id ? '' : param.patient_id}"/>
    </sql:query>

    <table>
        <tr>
            <th>Patientennummer</th>
            <th>Name</th>
            <th>Geburtsdatum</th>
            <th>Aktion</th>
        </tr>
        <c:forEach var="patient" items="${patients.rows}">
            <tr>
                <td>${patient.Patientennummer}</td>
                <td>${patient.Vorname} ${patient.Nachname}</td>
                <td><fmt:formatDate value="${patient.Geburtsdatum}" pattern="dd.MM.yyyy"/></td>
                <td>
                    <a href="index.jsp?menu=patient_details&id=${patient.Patientennummer}">Details</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<%@include file="../../includes/footer.jsp"%>
