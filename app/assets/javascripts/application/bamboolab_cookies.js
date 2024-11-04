function bamboolabCookies(configs) {
	function getCookie(name) {
		return (name = (document.cookie + ';').match(new RegExp(name + '=.*;'))) && name[0].split(/=|;/)[1];
	}

	if (!getCookie("bamboo_cookie")) {
		//create main div
		var div = document.createElement("div");
		div.setAttribute('class', 'cookies__wraper');

		//create two div tags
		var divInfo = document.createElement("div");
		divInfo.setAttribute('class', 'cookies__info');
		divInfo.innerHTML = configs.text;

		var divAction = document.createElement("div");
		divAction.setAttribute('class', 'cookies__action');

		//crete button
		var button = document.createElement("a");
		button.setAttribute('class', 'btn btn--cookies');
		button.textContent = configs.button;

		//crete link
		var link = document.createElement("a");
		link.setAttribute('class', 'link link__cookies');
		link.setAttribute('target', '_blank');
		link.href = configs.more[1];
		link.textContent = configs.more[0];

		//appending
		divAction.appendChild(button);
		divInfo.appendChild(link);
		div.appendChild(divInfo);
		div.appendChild(divAction);
		document.body.appendChild(div);

		//event and removing
		button.addEventListener("click", function(){
			document.cookie = "bamboo_cookie=true;expires="+new Date((new Date()).getTime() + (1000 * 86400000)).toUTCString();
			div.remove();
		});
	};
};
