<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>
        <title>${animal.animalName}</title>
    </head>

    <body>
        <h1>Sie beobachten ${animal.animalName} und ${animal.animalName} beobachtet zurueck.</h1>
    
        <img src="images/${animal.image}.jpg" height="300px" width="300px">

        <h2>Hunger ${animal.hunger}</h2>

        <form method="POST" action="<c:url value="/feedAnimal"/>">
            <c:choose>
                <c:when test="${animal.hunger > 0}">
                    <input type="hidden" value="${compound.compoundName}" name="compoundName" />
                    <input type="hidden" value="${animal.animalName}" name="animalName" />
                    <input type="submit" value="Fuettern">
                </c:when>
                <c:otherwise>
                    <p>Das Tier hat keinen Hunger.</p>
                </c:otherwise>
            </c:choose>

        </form>
        <form method="POST" action="<c:url value="/selectCompound"/>">
            <input type="hidden" value="${compound.compoundName}" name="compoundName">
            <input type="submit" value="Zurueck zum Gehege" name="zooMap">
        </form>
    </body>
</html>