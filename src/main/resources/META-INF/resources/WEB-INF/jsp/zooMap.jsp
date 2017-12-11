<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>
        <title>Zoo Karte</title>
    </head>

    <body>
        <h1>Willkommen im Zoo</h1>
        <h2>Welches Gehege moechten Sie besuchen?</h2>
        <h3>Schauen Sie auf unsere Karte</h3>

        <form method="POST" action="<c:url value='/selectCompound'/>">
            <c:forEach items="${allCompounds}" var="compound">
                <input type="radio" name="compoundName"
                       value="${compound.compoundName}" />${compound.compoundName}
            </c:forEach>

            <br>
            <p><input type="submit" value="Gehe zum Gehege" name="gotoCompound"></p>

            <c:if test="${not empty noCompoundSelected}">
                <p style="color:red;"> Sie haben kein Gehege ausgewaehlt!</p>
            </c:if>
        </form>
    </body>
</html>