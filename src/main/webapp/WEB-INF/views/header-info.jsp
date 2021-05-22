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
							data-target="#file-upload">Upload File</a> <a
							class="dropdown-item" href="#">Upload Folder</a>
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



<div class="modal fade bd-example-modal-xl" id="file-upload">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">Upload File</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="container">
					<div class="row">
						<div class="col-12">
							<jsp:include page="breadcrumb_navigator.jsp">
								<jsp:param name="location" value="upload-window" />
							</jsp:include>
						</div>
					</div>
					<div id="actions" class="row">
						<div class="col-lg-7">
							<span class="btn btn-success fileinput-button dz-clickable">
								<i class="glyphicon glyphicon-plus"></i> <span>Add
									files...</span>
							</span>
							<button type="submit" class="btn btn-primary start">
								<i class="glyphicon glyphicon-upload"></i> <span>Start
									upload</span>
							</button>
							<button type="reset" class="btn btn-warning cancel">
								<i class="glyphicon glyphicon-ban-circle"></i> <span>Cancel
									upload</span>
							</button>
						</div>

						<div class="col-lg-5">
							<!-- The global file processing state -->
							<span class="fileupload-process">
								<div id="total-progress"
									class="progress progress-striped active" role="progressbar"
									aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
									<div class="progress-bar progress-bar-success"
										style="width: 0%;" data-dz-uploadprogress=""></div>
								</div>
							</span>
						</div>
					</div>
					<div class="table table-striped files" id="previews">
						<div id="template" class="file-row dz-image-preview">
							<!-- This is used as the file preview template -->
							<div>
								<span class="preview"><img data-dz-thumbnail></span>
							</div>
							<div>
								<p class="name" data-dz-name></p>
								<strong class="error text-danger" data-dz-errormessage></strong>
							</div>
							<div>
								<p class="size" data-dz-size></p>
								<div class="progress progress-striped active" role="progressbar"
									aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
									<div class="progress-bar progress-bar-success"
										style="width: 0%;" data-dz-uploadprogress></div>
								</div>
							</div>
							<div>
								<button class="btn btn-primary start">
									<i class="glyphicon glyphicon-upload"></i> <span>Start</span>
								</button>
								<button data-dz-remove class="btn btn-warning cancel">
									<i class="glyphicon glyphicon-ban-circle"></i> <span>Cancel</span>
								</button>
								<button data-dz-remove class="btn btn-danger delete">
									<i class="glyphicon glyphicon-trash"></i> <span>Delete</span>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<script type="text/javascript">
	//Get the template HTML and remove it from the doumenthe template HTML and remove it from the doument
	var previewNode = document.querySelector("#template");
	previewNode.id = "";
	var previewTemplate = previewNode.parentNode.innerHTML;
	previewNode.parentNode.removeChild(previewNode);

	var myDropzone = new Dropzone(".container", { // Make the whole body a dropzone
		url : "./upload", // Set the url
		thumbnailWidth : 80,
		thumbnailHeight : 80,
		parallelUploads : 20,
		previewTemplate : previewTemplate,
		autoQueue : false, // Make sure the files aren't queued until manually added
		previewsContainer : "#previews", // Define the container to display the previews
		clickable : ".fileinput-button" // Define the element that should be used as click trigger to select files.
	});

	myDropzone.on("addedfile", function(file) {
		// Hookup the start button
		file.previewElement.querySelector(".start").onclick = function() {
			myDropzone.enqueueFile(file);
		};
	});

	// Update the total progress bar
	myDropzone
			.on(
					"totaluploadprogress",
					function(progress) {
						document.querySelector("#total-progress .progress-bar").style.width = progress
								+ "%";
					});

	myDropzone.on("sending", function(file) {
		// Show the total progress bar when upload starts
		document.querySelector("#total-progress").style.opacity = "1";
		// And disable the start button
		file.previewElement.querySelector(".start").setAttribute("disabled",
				"disabled");
	});

	// Hide the total progress bar when nothing's uploading anymore
	myDropzone.on("queuecomplete", function(progress) {
		document.querySelector("#total-progress").style.opacity = "0";
	});

	// Setup the buttons for all transfers
	// The "add files" button doesn't need to be setup because the config
	// `clickable` has already been specified.
	document.querySelector("#actions .start").onclick = function() {
		myDropzone.enqueueFiles(myDropzone.getFilesWithStatus(Dropzone.ADDED));
	};
	document.querySelector("#actions .cancel").onclick = function() {
		myDropzone.removeAllFiles(true);
	};
</script>

<style type="text/css">
#actions {
	margin: 2em 0;
}

/* Mimic table appearance */
div.table {
	display: table;
}

div.table .file-row {
	display: table-row;
}

div.table .file-row>div {
	display: table-cell;
	vertical-align: top;
	border-top: 1px solid #ddd;
	padding: 8px;
}

div.table .file-row:nth-child(odd) {
	background: #f9f9f9;
}

/* The total progress gets shown by event listeners */
#total-progress {
	opacity: 0;
	transition: opacity 0.3s linear;
}

/* Hide the progress bar when finished */
#previews .file-row.dz-success .progress {
	opacity: 0;
	transition: opacity 0.3s linear;
}

/* Hide the delete button initially */
#previews .file-row .delete {
	display: none;
}

/* Hide the start and cancel buttons and show the delete button */
#previews .file-row.dz-success .start, #previews .file-row.dz-success .cancel
	{
	display: none;
}

#previews .file-row.dz-success .delete {
	display: block;
}
</style>