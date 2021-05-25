<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<script src="./resources/dropzone/dist/min/dropzone.min.js"></script>
<link rel="stylesheet"
	href="./resources/dropzone/dist/min/dropzone.min.css">
<!-- Content Header (Page header) -->
<div class="content-header">
	<div class="container-fluid">
		<!-- Small boxes (Stat box) -->
		<div class="row">
			<div class="col-lg-2 col-12">
				<!-- small card -->
				<div class="small-box bg-success">
					<div class="inner">
						<h3>150</h3>

						<p>Files in Inventory</p>
					</div>
					<div class="icon">
						<i class="fas fa-shopping-cart"></i>
					</div>
					<a href="#" data-toggle="dropdown" class="small-box-footer">
						New <i class="fas fa-arrow-circle-right"></i>
					</a>
					<div class="dropdown-menu dropdown-menu-right" role="menu">
						<a class="dropdown-item" href="#" data-toggle="modal"
							data-target="#file-upload-modal">Upload File</a> <a
							class="dropdown-item" href="#" data-toggle="modal"
							data-target="#folder-upload-modal">Upload Folder</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Create Folder</a>
					</div>
				</div>
			</div>
			<div class="col-lg-5 col-12">
				<div class="info-box bg-info">

					<div class="info-box-content">
						<span class="info-box-number"><i
							class="fas fa-cloud-download-alt"></i> &nbsp;41,410 files
							Downloaded</span>

						<div class="info-box-number"
							style="margin-top: inherit; font-weight: lighter; line-height: 1.3;">
							<span style="font-size: 12px;">Last download at 12th Oct
								at 9:00 pm</span>
						</div>
						<div class="dropdown-divider"></div>
						<span class="info-box-number"><i class="fas fa-trash-alt"></i>
							&nbsp;210 files Deleted</span>

						<div class="info-box-number"
							style="margin-top: inherit; font-weight: lighter; line-height: 1.3;">
							<span style="font-size: 12px;">Last deleted at 12th Oct</span>
						</div>
					</div>
					<!-- /.info-box-content -->
				</div>
				<!-- /.info-box -->
			</div>
			<div class="col-lg-5 col-12">
				<div class="info-box bg-info">

					<div class="info-box-content">
						<span class="info-box-number"><i class="fas fa-share-alt"></i>
							&nbsp;41,410 files in Shared</span>

						<div class="info-box-number"
							style="margin-top: inherit; font-weight: lighter; line-height: 1.3;">
							<span style="font-size: 12px;">Last shared at 12th Oct at
								9:00 pm</span>
						</div>
						<div class="dropdown-divider"></div>
						<span class="info-box-number"><i class="fas fa-heart"></i>
							&nbsp;210 files is Favourite</span>

						<div class="info-box-number"
							style="margin-top: inherit; font-weight: lighter; line-height: 1.3;">
							<span style="font-size: 12px;">Last favourite done at 12th
								Oct</span>
						</div>
					</div>
					<!-- /.info-box-content -->
				</div>
				<!-- /.info-box -->
			</div>
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container-fluid -->
</div>
<!-- /.content-header -->



<jsp:include page="file-upload-modal.jsp"></jsp:include>


<div class="modal fade" id="folder-upload-modal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">Folder Upload</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="folderuploadForm" onsubmit="event.preventDefault();"
					method="post" action="#">
					<div class="container">
						<div class="row">
							<div class="col-12">
								<jsp:include page="breadcrumb_navigator.jsp">
									<jsp:param name="location" value="upload-window" />
								</jsp:include>
							</div>
						</div>
						<div class="row" style="padding: 30px;">
							<div class="col-12" style="text-align: center;">
								<div class="fileUpload btn btn-success">
									<span>Upload Directory</span> <input type="file"
										class="form-control-file btn btn-primary" webkitdirectory
										mozdirectory directory multiple id="file-folder"
										style="position: absolute; top: 0; right: 0; margin: 0; padding: 0; font-size: 20px; cursor: pointer; opacity: 0; filter: alpha(opacity = 0);" />
								</div>
							</div>
							<div class="col-12" style="text-align: center;">
								<span id="folderUploadMessage"></span>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<p>
									<button type="button" id="folderSubmitOnUpload"
										class="btn btn-block btn-primary btn-lg" disabled="disabled">Submit</button>
								</p>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<script type="text/javascript">
	document.getElementById('file-folder').onchange = function(e) {
		files = e.target.files; // FileList
		uploadFiles(files);
		$(this).prop("disabled", true);
		addClass($(this).parent()[0], "disabled");
	}

	$(document).ready(function() {
		$(document).on('hidden.bs.modal', '#folder-upload-modal', function() {
			let folderele = document.getElementById('file-folder');
			let parentfolderele = $(folderele).parent()[0];
			$(folderele).prop("disabled", false);
			parentfolderele.className = parentfolderele.className
					.replace(/\bdisabled\b/g, "");
			$("#folderSubmitOnUpload").prop("disabled", true);
			document.getElementById('folderuploadForm').reset();
		});
	});

	function uploadFiles(files) {
		let presentDirLoc = "/root/w/d";
		let path = "";
		// Create a new HTTP requests, Form data item (data we will send to the server) and an empty string for the file paths.
		xhr = new XMLHttpRequest();
		var formData = new FormData();

		// Set how to handle the response text from the server
		xhr.onreadystatechange = function(ev) {
			if (this.readyState == 4 && this.status == 200) {
				console.debug(xhr.responseText);
				$("#folderSubmitOnUpload").prop("disabled", false);
			}
		};

		for (let i = 0; i < files.length; i++) {
			let filename = files[i].webkitRelativePath;

			path += filename.substring(0, filename.lastIndexOf("/")) + "###";
			formData.append('file', files[i]);
		}

		formData.append('dir_structs', path);
		formData.append('path', presentDirLoc);

		xhr.open('POST', "./file-upload", true);
		xhr.send(formData);

		return true;
	}
</script>