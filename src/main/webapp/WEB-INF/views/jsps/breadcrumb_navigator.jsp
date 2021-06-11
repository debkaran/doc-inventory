<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<nav aria-label="breadcrumb">
	<ol class="breadcrumb blue-grey lighten-4">
		<li class="breadcrumb-item text-truncate" style="max-width: 150px;"
			data-toggle="tooltip" data-placement="top" title="Root">
			<%
				String location = request.getParameter("location");
				if(location.equals("home-window")){
					%>
						<a class="black-text" href="#"><i class="fas fa-home"></i> Root</a>
					<%	
				} else{
					%>
						<i class="fas fa-home"></i> Root
					<%
				}
			%>
		</li>
		<li class="breadcrumb-item active text-truncate"
			style="max-width: 150px;" data-toggle="tooltip" data-placement="top"
			title="Current Directory"><i class="fas fa-folder-open"></i>
			Current Directory
		</li>
	</ol>
</nav>