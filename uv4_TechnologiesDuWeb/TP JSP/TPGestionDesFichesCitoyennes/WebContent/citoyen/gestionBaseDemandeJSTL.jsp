<%@ page isELIgnored="false"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="utile.*"%>
<%@ page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql2"%>

<!-- inscription de la fiche dans la base  -->
<c:if test="${(param.valider != null) or (param.ajoutdoc != null)}">








</c:if>

<c:if test="${param.ajoutdoc != null }">
	<!--   demande de upload d'un document appel a la page pour le choix du fichier : 
      uploadPage.jsp -->

</c:if>

<!-- fiche sans document on retourne a une page d'accueil


-->
<c:if test="${param.ajoutdoc == null }">
	<jsp:forward page="suivreMesDemandes.jsp" />
</c:if>



