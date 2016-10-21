/**
 * 
 */

		
		var rcvNum = null;
		var rcvtarget = null;
		
		function goInsert(target) {
//	 		alert("goInsert함수입장");
			rcvNum = null;
			rcvtarget = target;
			sendRequest(path+"/insertOne", null, callBack, null);
			$("#myModal").modal();
		}
		function goUpdate(num,target) {
//	 		alert("goUpdate함수입장");
			rcvNum = num;
			rcvtarget = target;
			sendRequest(path+"/updateOne", "num=" + rcvNum, callBack, null);
			$("#myModal").modal();
		}
		
		function goSelOne(num,target) {
//	 		alert("selectOne함수입장");
			rcvNum = num;
			rcvtarget = target;
			sendRequest(path+"/selectOne", "num=" + rcvNum, callBack, null);
			$("#myModal").modal();
		}
		
		function callBack() {
//			alert("callBack함수입장");
//			alert(rcvtarget);
			if (httpRequest.readyState == 4) {
//	 			alert("callBack함수입장 ==4");
				if (httpRequest.status == 200) {
//	 				alert("callBack함수입장 ==200");
					var data = httpRequest.responseText;
					var tdElem = document.getElementsByTagName(rcvtarget);
					var target = null;
					target = tdElem.item(0);
					target.innerHTML = data;

				} else {
					alret("#### 실패 : " + httpRequest.status);

				}

			}
		}
		

		
		