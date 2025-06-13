<%@include file="../../includes/header.jsp"%>

<h2>Behandlungsplanung</h2>

<sql:query var="treatments" dataSource="${db}">
  SELECT b.BehandlungstypID, bt.Dauer, bt.Kosten, b.Uhrzeit, o.Raumbeschreibung,
  a.Arztnummer, ar.Facharztrichtung, p.Vorname, p.Nachname
  FROM Behandlung b
  JOIN Behandlungstyp bt ON b.BehandlungstypID = bt.ID
  JOIN Ort o ON b.Raumcodierung = o.Raumcodierung
  LEFT JOIN Vorgemerkt v ON b.BehandlungstypID = v.BehandlungID AND b.Uhrzeit = v.Uhrzeit
  LEFT JOIN Arzt a ON v.Arztnummer = a.Arztnummer
  LEFT JOIN Angestellter ar ON a.Angestelltennummer = ar.Angestelltennummer
  LEFT JOIN Person p ON ar.SVNR = p.SVNR
  ORDER BY b.Uhrzeit
</sql:query>

<table>
  <tr>
    <th>Behandlungstyp</th>
    <th>Uhrzeit</th>
    <th>Raum</th>
    <th>Arzt</th>
    <th>Dauer (min)</th>
    <th>Kosten</th>
    <th>Aktion</th>
  </tr>
  <c:forEach var="t" items="${treatments.rows}">
    <tr>
      <td>${t.BehandlungstypID}</td>
      <td>${t.Uhrzeit}</td>
      <td>${t.Raumbeschreibung}</td>
      <td>
        <c:choose>
          <c:when test="${not empty t.Vorname}">
            ${t.Vorname} ${t.Nachname} (${t.Facharztrichtung})
          </c:when>
          <c:otherwise>Frei</c:otherwise>
        </c:choose>
      </td>
      <td>${t.Dauer}</td>
      <td><fmt:formatNumber value="${t.Kosten}" type="currency"/></td>
      <td>
        <a href="index.jsp?menu=treatment_book&type=${t.BehandlungstypID}&time=${t.Uhrzeit}">
          Buchen
        </a>
      </td>
    </tr>
  </c:forEach>
</table>

<%@include file="../../includes/footer.jsp"%>
