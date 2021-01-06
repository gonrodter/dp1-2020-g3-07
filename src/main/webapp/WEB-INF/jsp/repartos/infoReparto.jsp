<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="currogas" tagdir="/WEB-INF/tags" %>

<currogas:layout pageName="reparto">

	<h2>Informacion del Reparto</h2>

		<table class="table table-striped">
			<tr>
				<th>Nombre repartidor</th>
				<th>Fecha</th>
				<th>Hora de inicio</th>
				<th><c:if test="${reparto.horaFin!=null}">Hora de fin</c:if></th>
			</tr>
			<tr>
				<td><c:out value="${reparto.repartidor.nombre}"></c:out></td>
				<td><c:out value="${reparto.fecha}"></c:out></td>
				<td><c:out value="${reparto.horaInicio}"></c:out></td>
				<td><c:if test="${reparto.horaFin!=null}"><c:out value="${reparto.horaFin}"></c:out></c:if></td>

			</tr>
		</table>

	<h2>Pedidos asociados</h2>

	<form:form class="form-horizontal">
		<table class="table table-striped">
			<tr>
				<th>Nombre del cliente</th>
				<th>Fecha del pedido</th>
				<th>Estado del pedido</th>
				<th>Contenido del pedido</th>
				<th>Acciones</th>
			</tr>
			<c:forEach items="${reparto.pedidos}" var="pedido">
				<tr>
					<td>
						<spring:url value="/repartidores/{repartidorId}/repartos/{repartoId}/cliente/{clienteId}" var="clienteUrl">
							<spring:param name="clienteId" value="${pedido.cliente.id}"/>
							<spring:param name="repartoId" value="${reparto.id}"/>
							<spring:param name="repartidorId" value="${repartidor.id}"/>
						</spring:url>
						<a href="${fn:escapeXml(clienteUrl)}" class="btn btn-outline-secondary">
							<c:out value="${pedido.cliente.nombre} ${pedido.cliente.apellidos}"></c:out>
						</a>
					</td>
					<td><c:out value="${pedido.fecha}"></c:out></td>
					<td><c:out value="${pedido.estadopedido}"></c:out></td>
					<td>
						<spring:url value="/repartidores/{repartidorId}/repartos/{repartoId}/{pedidoId}/detallesPedido" var="detallesUrl">
							<spring:param name="pedidoId" value="${pedido.id}"/>
							<spring:param name="repartoId" value="${reparto.id}"/>
							<spring:param name="repartidorId" value="${repartidor.id}"/>
						</spring:url>
						<a href="${fn:escapeXml(detallesUrl)}" class="btn btn-outline-secondary">Detalles del pedido</a>
					</td>
					<td>
						<spring:url value="/repartidores/{repartidorId}/repartos/{repartoId}/{pedidoId}/entregado" var="entregadoUrl">
							<spring:param name="pedidoId" value="${pedido.id}"/>
							<spring:param name="repartoId" value="${reparto.id}"/>
							<spring:param name="repartidorId" value="${repartidor.id}"/>
						</spring:url>
						<c:if test = "${pedido.estadopedido != 'Entregado'}">
							<a href="${fn:escapeXml(entregadoUrl)}" class="btn btn-outline-secondary">Marcar como entregado</a>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
	</form:form>
</currogas:layout>