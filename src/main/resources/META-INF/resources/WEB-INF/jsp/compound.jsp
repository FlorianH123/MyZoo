<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>
        <title>${compound.compoundName} Gehege</title>
    </head>

    <body>
        <h1>Sie sind hier: ${compound.compoundName} Gehege</h1>
        <h2>Sie sehen diese Tiere</h2>

        <form method="POST" action="<c:url value='/selectAnimal'/>">
            <c:forEach items="${compound.animals}" var="animal">
                <c:if test="${!animal.hidden}">
                    <input type="radio" name="animalName"
                           value="${animal.animalName}" /> ${animal.animalName}
                </c:if>
            </c:forEach>

            <input type="hidden" name="compoundName" value="${compound.compoundName}" />
            <input type="submit" value="Gehe zum Tier" name="selectAnimal">
        </form>

        <h2>Diese Tiere verstecken sich:</h2>

        <c:forEach items="${compound.animals}"  var="animal">
            <td>
                <ul>
                    <c:if test="${animal.hidden}">
                        <li>
                                ${animal.animalName}
                        </li>
                    </c:if>
                </ul>
            </td>
        </c:forEach>

        <form method="POST" action="<c:url value='/zooMap'/>">
            <input type="submit" value="Zurueck zur Karte" name="zooMap">
        </form>

        <c:if test="${not empty noAnimalSelected}">
            <p style="color:red;"> Sie haben kein Tier ausgewaehlt!</p>
        </c:if>
    </body>
</html>