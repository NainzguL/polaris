"use strict";

var forCarrerComps = [
	"natOriginNation",
	"natHostNation",
];

function doTransfer() {
	let items = [{
		"language": translate("competence", "natOriginNation"),
	    "value": "natOriginNation",
	},
	{
		"language": translate("competence", "natHostNation"),
	    "value": "natHostNation",
	}];
	
	let groupData = [];
	for(let categoryName in comps){
		let category = comps[categoryName];
		let group = {
				"groupName": translate("competence",categoryName),
		        "groupData": [],
		};
		for(let compName in category) {
			let newElt = {
					"language": translate("competence", compName),
				    "value": compName,
			}
			group.groupData.push(newElt);
			items.push(newElt);
		}
		groupData.push(group);
	}
	
	let otherGroup = {
		"groupName": translate("competence","forCarrer"),
        "groupData": [],
	};
	for (let i = 0; i < forCarrerComps.length; i++) {
		let compName = forCarrerComps[i];
		let newElt = {
				"language": translate("competence", compName),
			    "value": compName,
		}
		otherGroup.groupData.push(newElt);
		items.push(newElt);
	}
	groupData.push(otherGroup);
		
    console.log(groupData)
	
	let settings = {
	        "inputId": "languageInput",
	        "data": items,
	        "groupData": groupData,
	        "itemName": "language",
	        "groupItemName": "groupName",
	        "groupListName" : "groupData",
	        "container": "transfer",
	        "valueName": "value",
	        "callable" : function (data, names) {
	            console.log("Selected ID：" + data)
	            $("#selectedItemSpan").text(names)
	        }
	    };
	
	Transfer.transfer(settings);
}

doTransfer();
