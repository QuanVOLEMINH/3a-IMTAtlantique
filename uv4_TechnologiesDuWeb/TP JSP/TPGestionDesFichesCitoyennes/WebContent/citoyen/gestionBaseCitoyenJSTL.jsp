
<%@ page isELIgnored="false"%>
<%@ page import="java.util.*"%>
<%@ page import="utile.*"%>
<%@ page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql2"%>




<!-- modification  des informations sur un  citoyen dans la base et dans les variables de session  -->

<c:if test="${param.modifier != null }">
	<sql2:update var="result" dataSource="DonneesBase">
    update  personne set prenom="${param.prenom}", fixe="${param.fixe}", mobile="${param.mobile}", rue="${param.rue}", ville="${param.ville}" where id= ${sessionScope.id}
 </sql2:update>
</c:if>

<!--  appel page suivante dans tous les cas  -->

<jsp:forward page="mesInformationsPersonnelles.jsp" />




