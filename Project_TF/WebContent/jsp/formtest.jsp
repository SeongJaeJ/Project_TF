<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	전송테스트
	<form action="../test/write" method="get" enctype="multipart/form-data">
		게시판제목<input type="text" name="trip_board_title" value="test">
		아이디<input type="text" name="member_id" value="tester">
		닉네임<input type="text" name="member_nick" value="testman">
		메모<input type="text" name="trip_board_memo" value="hihi">
		여행기간<input type="text" name="trip_board_period" value="1박2일">
		사람모집여부<input type="text" name="trip_board_recruit" value="1">
		글공개여부<input type="text" name="trip_board_bool" value="1">
		숙박인덱스<input type="text" name="reserve_stay_index" value="3">
		출발지1주소<input type="text" name="daily_tripList[0].daily_trip_start_address" value="신림">
		출발지좌표<input type="text" name="daily_tripList[0].daily_trip_start_lngy" value="34.2345">
		출발지좌표<input type="text" name="daily_tripList[0].daily_trip_start_latx" value="123.234">
		경유지1주소<input type="text" name="daily_tripList[0].daily_trip_via1_address" value="강남">
		경유지좌표<input type="text" name="daily_tripList[0].daily_trip_via1_lngy" value="34.2345">
		경유지좌표<input type="text" name="daily_tripList[0].daily_trip_via1_latx" value="133.234">
		도착지1주소<input type="text" name="daily_tripList[0].daily_trip_end_address" value="성남">
		도착지좌표<input type="text" name="daily_tripList[0].daily_trip_end_lngy" value="34.2345">
		도착지좌표<input type="text" name="daily_tripList[0].daily_trip_end_latx" value="144.234">
		데일리1메모<input type="text" name="daily_tripList[0].daily_trip_memo" value="hihitetst">

		출발지2주소<input type="text" name="daily_tripList[1].daily_trip_start_address" value="홍대">
		출발지좌표<input type="text" name="daily_tripList[1].daily_trip_start_lngy" value="34.2345">
		출발지좌표<input type="text" name="daily_tripList[1].daily_trip_start_latx" value="123.234">
		경유지2주소<input type="text" name="daily_tripList[1].daily_trip_via1_address" value="신촌">
		경유지좌표<input type="text" name="daily_tripList[1].daily_trip_via1_lngy" value="34.2345">
		경유지좌표<input type="text" name="daily_tripList[1].daily_trip_via1_latx" value="155.234">
		도착지2주소<input type="text" name="daily_tripList[1].daily_trip_end_address" value="시청">
		도착지좌표<input type="text" name="daily_tripList[1].daily_trip_end_lngy" value="34.2345">
		도착지좌표<input type="text" name="daily_tripList[1].daily_trip_end_latx" value="144.234">
		데일리2메모<input type="text" name="daily_tripList[1].daily_trip_memo" value="망할자바">
		
		교통수단<input type="text" name="road_finderList[0].road_finder_transport_type" value="0">
		파일이름<input type="text" name="road_finderList[0].road_finder_filename" value="test1">
		교통수단<input type="text" name="road_finderList[1].road_finder_transport_type" value="1">
		파일이름<input type="text" name="road_finderList[1].road_finder_filename" value="test2">
<!-- 		<input type="file" name="file" multiple="multiple"> -->
		<input type="submit" value="작성">
	</form>
</body>
</html>