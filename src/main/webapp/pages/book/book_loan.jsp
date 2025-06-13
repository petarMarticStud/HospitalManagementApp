<%@include file="../../includes/header.jsp"%>

<h2>Buchausleihe</h2>

<sql:query var="availableBooks" dataSource="${db}">
  SELECT b.Inventarnummer, bt.ISBN, bt.Titel, bt.Auflagenjahr
  FROM Buch b
  JOIN Buchtyp bt ON b.ISBN = bt.ISBN
  WHERE NOT EXISTS (
  SELECT 1 FROM Entlehnt e
  WHERE e.Inventarnummer = b.Inventarnummer
  AND e.Rückgabedatum IS NULL
  )
</sql:query>

<form action="index.jsp" method="post">
  <input type="hidden" name="menu" value="book_loan">

  <label>Buch auswählen:</label>
  <select name="inventory_number" required>
    <c:forEach var="book" items="${availableBooks.rows}">
      <option value="${book.Inventarnummer}">
          ${book.Titel} (${book.Auflagenjahr}) - ${book.Inventarnummer}
      </option>
    </c:forEach>
  </select>

  <button type="submit">Ausleihen</button>
</form>

<%@include file="../../includes/footer.jsp"%>
