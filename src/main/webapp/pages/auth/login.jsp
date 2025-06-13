<%@include file="../../includes/header.jsp"%>

<form action="index.jsp" method="post">
  <input type="hidden" name="menu" value="login">

  <label>SVNR/Patientennummer:</label>
  <input type="text" name="username" required>

  <label>Passwort:</label>
  <input type="password" name="password" required>

  <button type="submit">Login</button>
</form>

<%@include file="../../includes/footer.jsp"%>
