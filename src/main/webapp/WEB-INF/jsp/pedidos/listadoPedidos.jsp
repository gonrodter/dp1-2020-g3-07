<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="currogas" tagdir="/WEB-INF/tags" %>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript" src="jquery.tablesorter.js"></script> 

<currogas:layout pageName="pedidos">
    <h2>Pedidos A Domicilio</h2>
    <table id="pedidosTable" class="table table-striped">
        <thead>
        <tr>
            <th style="width: 150px;">id</th>
            <th>Fecha y hora</th>
            <th>comentario</th>
            <th>valoracion</th>
            <th>Metodo de pago</th>
            <th>Estado de pedido</th>
            <th>Tipo de pedido</th>
            <th>Acciones</th>     
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pedidosadom}" var="pedidosadom">
            <tr>
                <td>
                    <c:out value="${pedidosadom.id}"/>
                </td>
                <td>
                    <c:out value="${pedidosadom.fecha}"/>
                </td>
                <td>
                    <c:out value="${pedidosadom.comentario}"/>
                </td>
                <td>
                    <c:out value="${pedidosadom.valoracion}"/>
                </td>
                <td>
                    <c:out value="${pedidosadom.metodopago}"/>
                </td>
                <td>
                    <c:out value="${pedidosadom.estadopedido}"/>
                </td>
                <td>
                    <c:out value="${pedidosadom.tipopedido}"/>
                </td>
                 <td>
                	<spring:url value="pedidos/delete/{pedidoID}" var="pedidoUrl">
       				<spring:param name="pedidoID" value="${pedidosadom.id}"/>
    				</spring:url>
    				<a href="${fn:escapeXml(pedidoUrl)}" class="btn btn-default">Eliminar pedido</a>
                </td>            
            </tr>
        </c:forEach>
        </tbody>
    </table>  
    
    
    
         <h2>Pedidos En Local</h2>
    <table id="pedidosTable" class="table table-striped">
        <thead>
        <tr>
            <th style="width: 150px;">id</th>
            <th>Fecha y hora</th>
            <th>comentario</th>
            <th>valoracion</th>
            <th>Metodo de pago</th>
            <th>Estado de pedido</th>
            <th>Tipo de pedido</th>
            <th>Acciones</th>     
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pedidosenloc}" var="pedidosenloc">
            <tr>
                <td>
                    <c:out value="${pedidosenloc.id}"/>
                </td>
                <td data-sortable = "true">
                    <c:out value="${pedidosenloc.fecha}"/>
                </td>
                <td>
                    <c:out value="${pedidosenloc.comentario}"/>
                </td>
                <td>
                    <c:out value="${pedidosenloc.valoracion}"/>
                </td>
                <td>
                    <c:out value="${pedidosenloc.metodopago}"/>
                </td>
                <td>
                    <c:out value="${pedidosenloc.estadopedido}"/>
                </td>
                <td>
                    <c:out value="${pedidosenloc.tipopedido}"/>
                </td>
                 <td>
                	<spring:url value="pedidos/delete/{pedidoID}" var="pedidoUrl">
       				<spring:param name="pedidoID" value="${pedidosenloc.id}"/>
    				</spring:url>
    				<a href="${fn:escapeXml(pedidoUrl)}" class="btn btn-default">Eliminar pedido</a>
                </td>            
            </tr>
        </c:forEach>
        </tbody>
    </table>     
    
    <a class="btn btn-default" href='<spring:url value="/pedidos/new" htmlEscape="true"/>'>Anadir pedido</a>
</currogas:layout>
