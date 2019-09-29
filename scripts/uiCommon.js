"use strict";

function translate(type, value){
	if (locale[type]) {
		if(locale[type][value]){
			return locale[type][value]; 
		}
	}
	return value;
}

/** Propose to the user to download the give text file */
function download(filename, text) {
	let element = document.createElement('a');
    element.setAttribute('href', 'data:text/plain;charset=utf-8,' + encodeURIComponent(text));
    element.setAttribute('download', filename);

    element.style.display = 'none';
    document.body.appendChild(element);

    element.click();

    document.body.removeChild(element);
}
