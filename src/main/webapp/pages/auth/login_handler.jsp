<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:8082/spital"
                   user="admin" password="Asdfg12345"/>

<sql:query var="user" dataSource="${db}">
  SELECT * FROM Person p
  LEFT JOIN Patient pat ON p.SVNR = pat.SVNR
  LEFT JOIN Angestellter a ON p.SVNR = a.SVNR
  WHERE p.SVNR = ? AND (pat.Patientennummer = ? OR a.Angestelltennummer = ?)
  <sql:param value="${param.username}"/>  <!-- Für den ersten Platzhalter (p.SVNR) -->
  <sql:param value="${param.username}"/>  <!-- Für den zweiten Platzhalter (pat.Patientennummer) -->
  <sql:param value="${param.username}"/>  <!-- Für den dritten Platzhalter (a.Angestelltennummer) -->
</sql:query>

<c:choose>
  <c:when test="${user.rowCount == 1}">
    <c:set var="currentUser" value="${user.rows[0]}" scope="session"/>
    <c:redirect url="index.jsp?menu=main"/>
  </c:when>
  <c:otherwise>
    <c:set var="error" value="Ungültige Anmeldedaten" scope="session"/>
    <c:redirect url="index.jsp"/>
  </c:otherwise>
</c:choose>
