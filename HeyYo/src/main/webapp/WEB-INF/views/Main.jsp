<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- SideBar CSS -->
<link href="${pageContext.request.contextPath}/resources/css/sidebar.css" rel="stylesheet">
<script type="text/javascript">
	function need() {
		document.location.href = "main.do?type=need";
	}
	function able() {
		document.location.href = "main.do?type=able";
	}
</script>
</head>
<body>

	<!-- Login Modal JSP-->
	<jsp:include page="/WEB-INF/common/loginmodal.jsp" />

	<!-- Navigation Bar JSP  -->
	<jsp:include page="/WEB-INF/common/navbar.jsp" />


	<div class="container">
		<div id="wrapper">
			<!-- Sidebar -->
			<jsp:include page="/WEB-INF/common/sidebar.jsp" />
			<br>
			<!-- 검색 부분 -->
			<div class="form-inline">
				<div class="col-md-3 col-md-offset-3 col-xs-12 input-group">
					<input id="location_search" type="textbox" class="form-control" placeholder="지역명" name="location"> <span class="input-group-btn">
						<button id="submit" class="btn btn-default" type="button">GO!</button>
					</span>
				</div>
				<div class="col-md-3  col-xs-12 input-group pull-right">
					<div class="input-group-btn">
						<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
							선택 <span class="caret"></span>
						</button>
						<ul class="dropdown-menu" role="menu">
							<li><a href="main.do">전체 보기</a></li>
							<li id="need"><a href="main.do?type=need">필요해요!</a></li>
							<li id="able"><a href="main.do?type=able">필요해요?</a></li>
							<li class="divider"></li>
						</ul>
					</div>
					<!-- /btn-group -->
					<input type="text" class="form-control" placeholder="키워드" name="talent" id="talent"> <span class="input-group-btn">
						<button class="btn btn-default" type="button" onclick="talentClick()" style="height: 34px;">
							<i class="glyphicon glyphicon-search"></i>
						</button>
					</span>
				</div>
				<div class="col-md-3 col-xs-12 input-group pull-left">
					<input type="button" value="지도로 보기" onclick="location.href='main.do'" class="col-xs-6 btn btn-default"> <input type="button" value="리스트로 보기" onclick="location.href='list.do'" class="col-xs-6 btn btn-default">
				</div>
			</div>
			<br>
			<!-- Map 띄우기 위한 Div -->
			<div id="map" style="width: 100%; height: 60%;" class="center-block"></div>
			<br> <input type="button" value="요청/나눔 등록" onclick="location.href='write.con'" class="col-md-8 col-md-offset-2 col-xs-12 btn btn-primary"> <input type="button" value="사이드 바" onclick="location.href='#menu-toggle"
				id="menu-toggle" class="col-md-2 col-xs-12 btn btn-default">
		</div>
		<!-- /#wrapper -->
	</div>

	<!-- 사이드바 토글 Script -->
	<script>
		/* 사이드바 토글 */
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("toggled");
		});
	</script>
	
	<!-- 지도 정보처리 script -->
	<script type="text/javascript">
		function setMapCenter(lat, lng) {
			if(map != undefined && map != null) {
				map.setCenter({lat, lng});
			} else {
			}
		}
		
		/* DB에서 가져온 주소값 */
		var address = new Array();
		var coordinate = new Array();

		/* 마커 정보창 text */
		var contentString = new Array();
		var init_lat = new Array();
		var init_lng = new Array();
		var marker_type = new Array();
		
		
		var lat_result,// 위도
			lng_result; // 경도
		
			<c:if test="${lat != null}">
				lat_result = ${lat}; // 위도
				lng_result = ${lng}; // 경도
			</c:if>
			
			
			console.log("1@" + lat_result);
			if(lat_result == null || lng_result == null) {
				if (navigator.geolocation) {
					// 위치정보 얻어옴
					navigator.geolocation.getCurrentPosition(function(position) {
						lat_result = position.coords.latitude, // 위도
						lng_result = position.coords.longitude;// 경도
						console.log("2@" +lat_result);
						setMapCenter(lat_result,lng_result);
					});
				}
			}
			console.log("3@" +lat_result);
		
		

		<c:forEach items="${contentLists}" var="content" varStatus="status">
		var str = "";

		$.ajax({
			type : 'post',
			url : 'infowindow.con',
			dataType : 'html',
			success : function(data) {
				str = data
			},
			async : false

		});

		str = str.replace("$SUBJECT", "${content.SUBJECT}")
		str = str.replace("$TALENT", "${content.TALENT}")
		str = str.replace("$S_DAY", "<fmt:formatDate value='${content.S_DAY}' pattern='yyyy년 MM월 dd일'/>")
		str = str.replace("$NUM", "${content.NUM}")
		str = str.replace("$ID", "${content.ID}")

		address.push("${content.ADDRESS}"); //주소값
		coordinate.push("${content.LOCATION}") //좌표값
		init_lat.push("${content.LAT}")
		init_lng.push("${content.LNG}")
		marker_type.push("${content.TYPE}")

		contentString.push(str); //마커 정보
		</c:forEach>
	</script>


	<!-- Map JS -->
	<script src="${pageContext.request.contextPath}/resources/js/map.js"></script>

	<!-- 구글 맵 api 키값 -->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDr7VXyN9A75vH2I8W73He8E61iuknPtf8&callback=initMap" async defer></script>

	<script type="text/javascript">
	function talentClick() {
		var talent = $("input[name=talent]").val();
		location.href = 'main.do?talent=' + talent;
	}
</script>

</body>
</html>
