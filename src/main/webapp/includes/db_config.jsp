<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %><sql:setDataSource
        var="spitalDB"
        driver="org.h2.Driver"
        url="jdbc:h2:file:${pageContext.servletContext.getRealPath('/')}/WEB-INF/db/spital;DB_CLOSE_ON_EXIT=FALSE;AUTO_RECONNECT=TRUE"
        user="admin"
        password="admin123"
/>
