/**
 * 
 */


	var httpRequest = null;
		
		function getXMLHttpRequest(){
			
			if(window.ActiveObject){
				try {
					return new ActiveXObject("Msxml2.XMLHTTP");
				} catch (e) {
					try {
						return new ActiveXObject("Microsoft.XMLHTTP");
					} catch (e1) {
						return null;
					}
				}
			}else if(window.XMLHttpRequest){
				return new XMLHttpRequest();
			}else {
				return null;
			}
		}

		
		function sendRequest(url, params, callback, method){
			httpRequest = getXMLHttpRequest();
			
			if(method=="get"){
				method = "GET";
			}else if(method == "post"){
				method = "POST";
			}
			
			var httpMethod = method ? method : "GET"; // null인 경우 GET
			
			if(httpMethod != "GET" && httpMethod != "POST"){
				httpMethod = "GET";
			}
			
			var httpParams = (params == null || params == "") ? null : params;
			
			var httpUrl = url;
			if(httpMethod == "GET" && httpParams != null){
				httpUrl += "?" + httpParams;
			}
			
			httpRequest.onreadystatechange = callback;
			
			httpRequest.open(httpMethod, httpUrl, true);
			
			httpRequest.setRequestHeader(
					"Content-Type", "application/x-www-form-urlencoded");
			httpRequest.send(httpMethod =="POST" ? httpParams : null);
			
		}
		
