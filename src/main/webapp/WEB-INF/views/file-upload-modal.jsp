<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<div class="modal fade bd-example-modal-xl" id="file-upload-modal">
	<div class="modal-dialog modal-xl modal-dialog-scrollable">
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
							<span class="btn btn-success fileinput-button dz-clickable"
								id="addFilebtn"> <i class="glyphicon glyphicon-plus"></i>
								<span>Add files...</span>
							</span>
							<button type="submit" class="btn btn-primary start"
								id="startUploadFilebtn">
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
			<div class="modal-footer">
				<button type="button" id="fileSubmitOnUpload"
					class="btn btn-block btn-primary btn-lg disabled">Submit</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<script type="text/javascript" src="./resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	//Get the template HTML and remove it from the doumenthe template HTML and remove it from the doument
	var previewNode = document.querySelector("#template");
	previewNode.id = "";
	var previewTemplate = previewNode.parentNode.innerHTML;
	previewNode.parentNode.removeChild(previewNode);

	function addClass(domObjElement, className) {
		var element, name, arr;
		arr = domObjElement.className.split(" ");
		if (arr.indexOf(className) == -1) {
			domObjElement.className += " " + className;
		}
	}
	$(document)
			.ready(
					function() {
						$(document)
								.on(
										'hidden.bs.modal',
										'#file-upload-modal',
										function() {
											let startUploadFilebtnElement = document
													.querySelector("#fileSubmitOnUpload");
											addClass(startUploadFilebtnElement, "disabled");
											$("button.cancel").click();
										});
					});

	var myDropzone = new Dropzone(
			".container",
			{ // Make the whole body a dropzone
				url : "./file-upload", // Set the url
				thumbnailWidth : 80,
				thumbnailHeight : 80,
				parallelUploads : 20,
				previewTemplate : previewTemplate,
				init : function() {
					this.on("sending", function(file, xhr, data) {
						data.append("path", "/root/w/d");
					});
					this
							.on(
									"success",
									function(file, response) {
										console.log("file", file);
										console.log("response", response);

										let fileSubmitOnUploadElement = document
												.querySelector("#fileSubmitOnUpload");
										fileSubmitOnUploadElement.className = fileSubmitOnUploadElement.className
												.replace(/\bdisabled\b/g, "");
									});
				},
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