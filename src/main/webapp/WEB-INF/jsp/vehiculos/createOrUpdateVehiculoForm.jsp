<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

<petclinic:layout pageName="vehiculo">
    <h2>
        <c:if test="${vehiculos['new']}">Nuevo</c:if> Vehiculo
    </h2>
    <form:form modelAttribute="vehiculos" class="form-horizontal" id="add-vehiculos-form">
        <div class="form-group has-feedback">
            <petclinic:inputField label="matricula" name="matricula"/>
            <petclinic:inputField label="tipovehiculo" name="tipovehiculo"/>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <c:choose>
                    <c:when test="${vehiculos['new']}">
                        <button class="btn btn-default" type="submit">Añadir vehiculos</button>
                    </c:when>
                    <c:otherwise>
                        <button class="btn btn-default" type="submit">Actualizar vehiculos</button>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </form:form>
</petclinic:layout>