<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<div class="mailbox-controls">
	<%
	String position = request.getParameter("position");
	if (position.equals("header")) {
	%>
	<button type="button" class="btn btn-default btn-sm">
		<i class="far fa-plus-square" data-toggle="dropdown"></i>
		<div class="dropdown-menu dropdown-menu-left" role="menu">
			<a class="dropdown-item" href="#" data-toggle="modal"
				data-target="#file-upload-modal">Upload File</a> <a
				class="dropdown-item" href="#" data-toggle="modal"
				data-target="#folder-upload-modal">Upload Folder</a>
			<div class="dropdown-divider"></div>
			<a class="dropdown-item" href="#">Create Folder</a>
		</div>
	</button>
	<%
	}
	%>
	<button type="button" class="btn btn-default btn-sm">
		<i class="far fa-trash-alt"></i>
	</button>
	<button type="button" class="btn btn-default btn-sm">
		<i class="fas fa-download"></i>
	</button>
	<button type="button" class="btn btn-default btn-sm">
		<i class="fas fa-share-alt"></i>
	</button>
	<button type="button" class="btn btn-default btn-sm">
		<i class="fas fa-thumbtack"></i>
	</button>
	<button type="button" class="btn btn-default btn-sm">
		<i class="fas fa-arrows-alt"></i>
	</button>
	<button type="button" class="btn btn-default btn-sm">
		<i class="far fa-clone"></i>
	</button>

	<!-- /.btn-group -->
	<button type="button" class="btn btn-default btn-sm">
		<i class="fas fa-sync-alt"></i>
	</button>

</div>