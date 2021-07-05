document.getElementById("resendOTP").addEventListener("click", resendOTP);
function resendOTP(){
	document.getElementById("errorMessage").innerHTML = "";
	ahrefState.disableHref();
	const xhr = new XMLHttpRequest();
	xhr.onload = () => {
		ahrefState.enableHref();
		if(xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200){
			console.log(xhr.responseText);
			if(xhr.responseText == "Success"){
				let resendInfo = document.getElementById("resendInfo");
				resendInfo.parentNode.classList.remove("d-none");
				resendInfo.innerHTML = "* New OTP is Generated and sent to your emailId";
			} else {
				
			}
		}
		else{
			console.log("Problem Occured");
		}
	};
	var userId = encodeURIComponent(document.getElementById("userId").value);
	var sourcePage = encodeURIComponent(document.getElementById("sourcePage").value);
	var parameters = "userId="+userId+"&sourcePage="+sourcePage;
	xhr.open("POST","./resend-otp",true);
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.send(parameters);
}

let href = function(){
	let resend = document.getElementById("resendOTP");
	let loader = document.getElementById("resend-email-loader");
	let submitBtn = document.getElementById("submitBtn");
	
	function disableHref(){
		if(resend.removeEventListener) {                   // For all major browsers, except IE 8 and later
		  resend.removeEventListener("click", resendOTP);
		} else if (resend.detachEvent) {                    // For IE 8 and earlier versions
		  resend.detachEvent("click", resendOTP);
		}
		resend.classList.add("disabled-a-text");
		loader.classList.remove("d-none");
		submitBtn.disabled = true;
	}
	
	function enableHref(){
		resend.addEventListener("click", resendOTP);
		resend.classList.remove("disabled-a-text");
		loader.classList.add("d-none");
		submitBtn.disabled = false;
	}
	
	return {
		disableHref:disableHref,
		enableHref:enableHref
	}
};
let ahrefState = new href();