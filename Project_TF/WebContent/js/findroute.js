/*
	lat = jb = y
	lng = ib = x
	다음좌표 순서는 ib, jb이지만
	naver.maps.Point(x, y)
	daum.maps.LatLng(y, x).toCoords().jb or ib
	daum.maps.Coords(x, y)
*/

//-----------------변수선언시작-----------------
var map = new naver.maps.Map('map', {
	zoom : 8,
	minZoom : 1,
	zoomControl : true,
	zoomControlOptions : {
		position : naver.maps.Position.TOP_RIGHT
	},
	mapTypeControl : true
});

var subMenuString = [ '<div class="subMenu">',
	'<button id="btn1" onclick="button1_start();">출발</button> ',
	'<button id="btn2" onclick="button2_via();">경유</button> ',
	'<button id="btn3" onclick="button3_end();">도착</button>',
//	'<button onclick="button4_search();">길찾기</button> ',
	'<button id="btn4" onclick="reset();">리셋</button>',
	'</div>' ].join('');

var subMenu = new naver.maps.InfoWindow({
	content: subMenuString,
	maxWidth: 1250,
	backgroundColor: "",
	borderWidth: 3,
	borderColor: "black"
});

var transportType = 0; //0:자동차(default), 1:대중교통, 2:자전거, 3:도보

var daumCoord; //다음좌표(jb, ib)
var latYlngX; //좌표(y, x)
var address; //도로명주소
var daumCoordList = new Array(); //다음좌표리스트
var latYlngXList = new Array(); //좌표리스트
var addressList = new Array(); //주소리스트
var startIndex; //리스트 내 출발지인덱스
var endIndex; //리스트 내 도착지인덱스

var startMark = null; //출발지마크
var endMark = null; //도착지마크
var viaMarkList = new Array(); //경유지마크 리스트
var viaMarkImage = new Array();
var markerIndex = 1; //마크인덱스

var jsonObject;//java에서 넘어오는 json객체

var polyline = new naver.maps.Polyline({ //지도에 경로그리기
	map : map,
	path : [],
	strokeWeight : 4,
	strokeColor : 'blue'
});
//-----------------변수선언끝-----------------


//-----------------이벤트등록시작-----------------
naver.maps.Event.addListener(map, 'click', function(e) {
	subMenu.close();
});

naver.maps.Event.addListener(map, 'rightclick', function(e) {
	latYlngX = e.coord //좌표값 저장
	daumCoord = new daum.maps.LatLng(latYlngX.y, latYlngX.x).toCoords(); //다음좌표값 저장
	searchAddressByLatLng(latYlngX); //좌표에따른 도로명주소
	console.log("latYlngX:" + latYlngX);
	console.log("daumCoord:" + daumCoord);
	subMenu.open(map, e.coord);
});
//-----------------이벤트등록끝-----------------


//-----------------function시작-----------------
function selectTansportType(type){ //이동수단 선택
	transportType = type;
	
	if(startMark != null && endMark != null){
		searchStart();
	}
}

function transNaverListToLatLngList(naverCoordList){ //네이버좌표리스트를 좌표리스트로
	var resultArray = new Array(); //반환할 결과값 좌표리스트
	var splitTmpList = naverCoordList.split(" "); //x,y x,y x,y 로 되어있는걸 x,y로 짜르는 작업
	for(var i=0; i<splitTmpList.length; i++){
		var splitXY;
		if(splitTmpList.length < 5){ //속도상승을 위해 곡선 좌표개수별로 몇번에 한번찍을지 판단
			if(i%2 == 0){
				splitXY = splitTmpList[i].split(",");
			}
		}else if(splitTmpList.length < 10){
			if(i%4 == 0){
				splitXY = splitTmpList[i].split(",");
			}
		}else{
			if(i%5 == 0){
				splitXY = splitTmpList[i].split(",");
			}
		}
		resultArray.push(naver.maps.TransCoord.fromNaverToLatLng(naver.maps.Point(splitXY[0], splitXY[1])));
	}
	return resultArray;
}

function transLatLngListToDaumList(latlngList){ //좌표리스트를 다음좌표리스트로
	for(var i=0; i<latlngList.length; i++){
		var splitXY = new daum.maps.LatLng(latlngList[i].split(",")[0], latlngList[i].split(",")[1]);
		daumCoordList.push(splitXY.toCoords().jb+","+splitXY.toCoords().ib);
	}
}

function searchAddressByLatLng(addressLatLng){
	naver.maps.Service.reverseGeocode({
		location: addressLatLng,
		coordType: naver.maps.Service.CoordType.LATLNG
	}, function(status, response){
		if(status === naver.maps.Service.Status.ERROR){
			return alert("잘못되었습니다.");
		}
		address = response.result.items[0].address;
		console.log(address);
	});
}

function button1_start(){
	if(startMark == null){
		startMark = new naver.maps.Marker({
			title: '출발지',
			animation: 2,
			icon: {
				url: '../img/startpoint.png',
				anchor: new naver.maps.Point(0, 42)
			},
			position: latYlngX,
			map: map
		});
		latYlngXList.push(latYlngX.y+","+latYlngX.x);
		addressList.push(address);
		startIndex = latYlngXList.length-1;
	}else{
		startMark.setPosition(latYlngX);
		latYlngXList.splice(startIndex, 1, latYlngX);
		addressList.splice(startIndex, 1, address);
	}
	
	if(startMark != null && endMark != null){
		searchStart();
	}
	subMenu.close();
}

function button2_via(){
	if(markerIndex > 5){
		alert("경유지는 5개까지만 설정 가능합니다.");
	}else{
		var viaMark = new naver.maps.Marker({
			title: '경유지',
			animation: 2,
			icon: {
				url: '../img/via'+markerIndex+'.png',
				anchor: new naver.maps.Point(0, 44)
			},
			position: latYlngX,
			map: map
		});
		viaMarkList.push(viaMark);
		latYlngXList.push(latYlngX.y+","+latYlngX.x);
		addressList.push(address);
		if(markerIndex < 6){
			markerIndex += 1;
		}
	}
	subMenu.close();
}

function button3_end(){
	if(endMark == null){
		endMark = new naver.maps.Marker({
			title: '도착지',
			icon: {
				url: '../img/endpoint.png',
				anchor: new naver.maps.Point(0, 42)
			},
			animation: 2,
			position: latYlngX,
			map:map
			
		});
		latYlngXList.push(latYlngX.y+","+latYlngX.x);
		addressList.push(address);
		endIndex = latYlngXList.length-1;
	}else{
		endMark.setPosition(latYlngX);
		latYlngXList.splice(endIndex, 1, latYlngX);
		addressList.splice(endIndex, 1, address);
	}
	
	if(startMark != null && endMark != null){
		searchStart();
	}
	subMenu.close();
}

function searchStart(){
	if(transportType == 1){
		transLatLngListToDaumList(latYlngXList);
	}
	console.log(daumCoordList);
	console.log(latYlngXList);
	console.log(addressList);
	
	$.ajaxSettings.traditional = true;
	$.ajax({
		type:"POST",
		url:"../test/routeFinder",
		data:{
			transportType:transportType,
			daumCoordList:daumCoordList,
			latYlngXList:latYlngXList,
			addressList:addressList,
			startIndex:startIndex,
			endIndex:endIndex
		},
		dataType:"text",
		success:function(data){
			jsonObject=JSON.parse(data);
			var startAddr;
			var viaAddr = "";
			var endAddr;
			var distan;
			var timewaste;
			
			$('#routesNav').empty();
			
			if(transportType == 1){//다음
				startAddr = jsonObject.in_local.start.name;
				endAddr = jsonObject.in_local.end.name;
				$('#routesNav').append('<br><br><br><div id="nav0">'+'출발지 : '+startAddr+'<br><br>도착지 : '+endAddr+'</div><br><br>');
				
				for(var z=0; z<jsonObject.in_local.routes.length; z++){
					distan = jsonObject.in_local.routes[z].distance.text;
					timewaste = jsonObject.in_local.routes[z].time.text;
					$('#routesNav').append('<div id="nav1">'+'<button onclick="searchRouteByDaum('+z+')">경로'+(z+1)+
					'</button> 총거리:'+distan+' / 소요시간:'+timewaste+'<br><div class="selectRoute" id="selectRoute'+z+'"></div>'+'</div>');
				}
				searchRouteByDaum(0);
			}else{//네이버
				if(transportType == 3){ //걷기의 경우 변수명이 약간 다름
					startAddr = jsonObject.result.summary.startPoint.name;
					endAddr = jsonObject.result.summary.endPoint.name;
					distan = (jsonObject.result.summary.totalDistance)/1000;
					timewaste = jsonObject.result.summary.totalTime;
					$('#routesNav').append('<br><br><br><div id="nav0">'+'출발지 : '+startAddr+'<br>'+viaAddr+'<br>'+'도착지 : '+endAddr+'</div><br><br>');
					$('#routesNav').append('<div id="nav1">'+'총거리:'+distan.toFixed(2)	+'km<br>소요시간:'+timewaste+'분<br>이동속도:'+jsonObject.result.summary.speed+'km')+'</div>';
					searchRouteByNaverWalking();
				}else{ //자동차
					startAddr = jsonObject.routes[0].summary.start.address;
					endAddr = jsonObject.routes[0].summary.end.address;
					if(jsonObject.routes[0].summary.waypoints != null){
						for(var i=0; i<jsonObject.routes[0].summary.waypoints.length; i++){
							viaAddr += '<br>'+'경유지'+(i+1)+' : '+jsonObject.routes[0].summary.waypoints[i].address+'<br>';
						}
					}
					$('#routesNav').append('<br><br><br><div id="nav0">'+'출발지 : '+startAddr+'<br>'+viaAddr+'<br>'+'도착지 : '+endAddr+'</div><br><br>');
					
					for(var z=0; z < jsonObject.routes.length; z++){
						distan = (jsonObject.routes[z].summary.distance)/1000;
						timewaste = (jsonObject.routes[z].summary.duration)/60;
						$('#routesNav').append('<div id="nav1">'+'<button onclick="searchRouteByNaver('+z+')">경로'+(z+1)+'</button> 총거리:'+distan.toFixed(2)
								+'km / 소요시간:'+timewaste.toFixed(2)+'분</div><br>');
					}
					searchRouteByNaver(0);
				}
			}
		},
		error:function(msg){
			alert("해당지역까지의 경로는 지원하지않습니다.");
		}
	})
}

function searchRouteByNaver(routesIndex){
	if(viaMarkImage.length > 0){
		for(var i=0; i<viaMarkImage.length; i++){
			viaMarkImage[i].setMap(null);
		}
		viaMarkImage = new Array();
	}
	
	var lineArray = new Array();
	
	for(var i=0; i<jsonObject.routes[routesIndex].legs.length; i++){
		for(var j=0; j<jsonObject.routes[routesIndex].legs[i].steps.length; j++){
			if(jsonObject.routes[routesIndex].legs[i].steps[j].steps != null){
				for(var k=0; k < jsonObject.routes[routesIndex].legs[i].steps[j].steps.length; k++){
					if(jsonObject.routes[routesIndex].legs[i].steps[j].steps[k].path != ""){
						var pathArray = transNaverListToLatLngList(jsonObject.routes[routesIndex].legs[i].steps[j].steps[k].path);
						Array.prototype.push.apply(lineArray, pathArray);
					};
				};
			}else{
				if(jsonObject.routes[routesIndex].legs[i].steps[j].path != ""){
					var pathArray = transNaverListToLatLngList(jsonObject.routes[routesIndex].legs[i].steps[j].path);
					Array.prototype.push.apply(lineArray, pathArray);
				};
			};
		};
	};
	polyline.setPath(lineArray);
}

function searchRouteByNaverWalking(){
	if(viaMarkImage.length > 0){
		for(var i=0; i<viaMarkImage.length; i++){
			viaMarkImage[i].setMap(null);
		}
		viaMarkImage = new Array();
	}
	
	var lineArray = new Array();
	
	for(var i=0; i<jsonObject.result.route[0].point.length; i++){
		if(jsonObject.result.route[0].point[i].path != ""){
			var pathArray = transNaverListToLatLngList(jsonObject.result.route[0].point[i].path);
			Array.prototype.push.apply(lineArray, pathArray);
		};
	};
	polyline.setPath(lineArray);
}

function searchRouteByDaum(routesIndex){
	$('.selectRoute').empty();
	var lineArray = new Array();
	
	if(viaMarkImage.length > 0){
		for(var i=0; i<viaMarkImage.length; i++){
			viaMarkImage[i].setMap(null);
		}
		viaMarkImage = new Array();
	}
	
	for(var j=0; j<jsonObject.in_local.routes[routesIndex].steps.length; j++){
		$('#selectRoute'+routesIndex).append("<hr>이동순서"+(j+1)+" : "+jsonObject.in_local.routes[routesIndex].steps[j].information+"<br>");
		var whatTypeTransport = jsonObject.in_local.routes[routesIndex].steps[j].type
		if(jsonObject.in_local.routes[routesIndex].steps[j].startLocation != null && whatTypeTransport != null && whatTypeTransport != 'WALKING'){
			var whatUseTransport;
			var viaTmpX = jsonObject.in_local.routes[routesIndex].steps[j].startLocation.x;
			var viaTmpY = jsonObject.in_local.routes[routesIndex].steps[j].startLocation.y;
			var viaTmpDaumCoord = new daum.maps.Coords(viaTmpX, viaTmpY);
			if(whatTypeTransport == 'BUS'){
				whatUseTransport = '../img/bus.png';
			}else if(whatTypeTransport == 'SUBWAY'){
				whatUseTransport = '../img/subway.png';
			}
			var viaMark = new naver.maps.Marker({
				title: '대중교통',
				animation: 2,
				icon: {
					url: whatUseTransport
				},
				position: naver.maps.Point(viaTmpDaumCoord.toLatLng().ib, viaTmpDaumCoord.toLatLng().jb),
				map: map
			});
			viaMarkImage.push(viaMark);
		};
		
		if(jsonObject.in_local.routes[routesIndex].steps[j].polyline != null){
			var tmpDaumCoordList = jsonObject.in_local.routes[routesIndex].steps[j].polyline;
			for(var k=0; k<tmpDaumCoordList.split("|").length/2; k++){
				var tmpDaumCoord = new daum.maps.Coords(tmpDaumCoordList.split("|")[k*2], tmpDaumCoordList.split("|")[(k*2)+1]);
				lineArray.push(new naver.maps.LatLng(tmpDaumCoord.toLatLng().jb, tmpDaumCoord.toLatLng().ib));
			}
		}
	}
	polyline.setPath(lineArray);
}

function reset(){
	daumCoordList = new Array();
	latYlngXList = new Array();
	addressList = new Array();
	
	startMark.setMap(null);
	startMark = null;
	for(var i=0; i<viaMarkList.length; i++){
		viaMarkList[i].setMap(null);
	}
	viaMarkList = new Array();
	for(var i=0; i<viaMarkImage.length; i++){
		viaMarkImage[i].setMap(null);
	}
	viaMarkImage = new Array();
	markerIndex = 1;
	endMark.setMap(null);
	endMark = null;
	
	polyline.setMap(null);
	polyline = new naver.maps.Polyline({
		map: map,
		path: [],
		strokeWeight: 4,
		strokeColor: 'blue'
	})
	$('#routesNav').empty();
	subMenu.close();
}