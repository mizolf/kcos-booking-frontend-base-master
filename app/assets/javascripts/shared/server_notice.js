// append dev server notice to body
document.addEventListener('DOMContentLoaded', function() {
	if (window.location.href.includes("dev.bambooapp")) {
		let notice = document.createElement("div");
		notice.innerHTML =
			"Development server - for development & testing purposes only.";
		notice.classList.add("dev-server-notice");
		document.querySelector("body").appendChild(notice);
	}
})