package controller;

import java.awt.geom.Point2D;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import model.Coordinate;
import model.Daily_Trip;
import model.Road_Finder;
import model.Trip_Board;
import service.Trip_BoardService;

@Controller
@RequestMapping("/test")
public class Test {
	
	@Autowired
	private Trip_BoardService trip_boardService;
	
	@RequestMapping("/routeFinder")
	public void routeFinder(int transportType, String[] daumCoordList, String[] latYlngXList, String[] addressList, String startIndex, String endIndex, HttpServletResponse response) throws IOException {
		List<Coordinate> coords = new ArrayList<Coordinate>();
		
		if(transportType == 1) {
			for(int i=0; i<daumCoordList.length; i++) {
				daumCoordList[i].split(",");
				latYlngXList[i].split(",");
				Point2D.Double insertDaumCoord = new Point2D.Double(Double.parseDouble(daumCoordList[i].split(",")[1]), Double.parseDouble(daumCoordList[i].split(",")[0]));
				Point2D.Double insertNaverCoord = new Point2D.Double(Double.parseDouble(latYlngXList[i].split(",")[1]), Double.parseDouble(latYlngXList[i].split(",")[0]));
				coords.add(new Coordinate(insertDaumCoord, insertNaverCoord, URLEncoder.encode(addressList[i], "UTF-8")));
			}
		}else{
			for(int i=0; i<latYlngXList.length; i++) {
				latYlngXList[i].split(",");
				Point2D.Double insertNaverCoord = new Point2D.Double(Double.parseDouble(latYlngXList[i].split(",")[1]), Double.parseDouble(latYlngXList[i].split(",")[0]));
				coords.add(new Coordinate(insertNaverCoord, URLEncoder.encode(addressList[i], "UTF-8")));
			}
		}
		
		Coordinate tmpStartCoord = coords.get(Integer.parseInt(startIndex));
		Coordinate tmpFinalCoord = coords.get(Integer.parseInt(endIndex));
		for(int i=0; i<coords.size(); i++) {
			if(coords.get(i).getAddress().equals(tmpStartCoord.getAddress())) {
				coords.remove(i);
			}
		}
		for(int i=0; i<coords.size(); i++) {
			if(coords.get(i).getAddress().equals(tmpFinalCoord.getAddress())) {
				coords.remove(i);
			}
		}
		coords.add(0, tmpStartCoord);
		coords.add(tmpFinalCoord);
		
		for(Coordinate c : coords) {
			System.out.println(c);
		}
		
		BufferedReader br = null;
		String inputLine = null;
		StringBuilder sb = new StringBuilder();
		String webURL = "";
		String tmp = "";
		
		if(coords.size()>2) {//경유지 있는지 판별하여 있으면 경유지 추가
			for(int i=1; i<coords.size()-1; i++) {
				tmp += coords.get(i).getLngYlatX().x+"%2C"+coords.get(i).getLngYlatX().y+"%2C"+coords.get(i).getAddress()+"%2C";
			}
		}
		if(transportType != 1) {
			if(transportType == 0) {//자동차경로
				webURL = "https://map.naver.com/spirra/findCarRoute.nhn?route=route3&output=json&result=web3&coord_type=naver&search=2&car=0&mileage=12.4&start="+coords.get(0).getLngYlatX().x+"%2C"+coords.get(0).getLngYlatX().y+"%2C"+coords.get(0).getAddress()+"&destination="+coords.get(coords.size()-1).getLngYlatX().x+"%2C"+coords.get(coords.size()-1).getLngYlatX().y+"%2C"+coords.get(coords.size()-1).getAddress()+"&via="+tmp;
			}else if(transportType == 2) {//자전거경로
				webURL = "https://map.naver.com/spirra/findCarRoute.nhn?call=route3&output=json&search=8&result=web3&coord_type=naver&start="+coords.get(0).getLngYlatX().x+"%2C"+coords.get(0).getLngYlatX().y+"%2C"+coords.get(0).getAddress()+"&destination="+coords.get(coords.size()-1).getLngYlatX().x+"%2C"+coords.get(coords.size()-1).getLngYlatX().y+"%2C"+coords.get(coords.size()-1).getAddress()+"&via="+tmp;
			}else {//도보경로
				webURL = "https://map.naver.com/findroute2/findWalkRoute.nhn?call=route2&output=json&coord_type=naver&search=0&start="+coords.get(0).getLngYlatX().x+"%2C"+coords.get(0).getLngYlatX().y+"%2C"+coords.get(0).getAddress()+"&destination="+coords.get(coords.size()-1).getLngYlatX().x+"%2C"+coords.get(coords.size()-1).getLngYlatX().y+"%2C"+coords.get(coords.size()-1).getAddress();
			}
		}else {
			webURL = "http://map.daum.net/route/pubtrans.json?inputCoordSystem=WCONGNAMUL&outputCoordSystem=WCONGNAMUL&service=map.daum.net&sX="+coords.get(0).getDaumCoord().x+"&sY="+coords.get(0).getDaumCoord().y+"&sName="+coords.get(0).getAddress()+"&sid=&eX="+coords.get(coords.size()-1).getDaumCoord().x+"&eY="+coords.get(coords.size()-1).getDaumCoord().y+"&eName="+coords.get(coords.size()-1).getAddress()+"&eid=";
		}
		System.out.println(webURL);
		URL url = new URL(webURL);
		if(transportType != 1) {
			System.out.println("네이버");
			HttpsURLConnection connection = (HttpsURLConnection)url.openConnection();
			connection.setRequestProperty("User-Agent", "Mozilla/4.0");
			try {
				br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));
				while((inputLine = br.readLine())!=null) {
					sb.append(inputLine);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}finally {
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}else {
			System.out.println("다음");
			HttpURLConnection connection = (HttpURLConnection)url.openConnection();
			connection.setRequestProperty("User-Agent", "Mozilla/4.0");
			try {
				br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));
				while((inputLine = br.readLine())!=null) {
					sb.append(inputLine);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}finally {
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		System.out.println("결과");
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().print(sb);
		System.out.println(sb);
	}
	
//	@RequestMapping("write")
//	public void writeboard(Trip_Board trip_board, Daily_Trip daily_trip, Road_Finder road_finder) {
//		
//	}
	
	@RequestMapping("/write")
	public void fileUpload(Trip_Board trip_board, Daily_Trip daily_trip, Road_Finder road_finder) {
		//, MultipartHttpServletRequest request
		System.out.println("요청은왔습니까?");
		List<Daily_Trip> dList = daily_trip.getDaily_tripList();
		List<Road_Finder> rList = road_finder.getRoad_finderList();
		
//		for(Daily_Trip dd : dList) {
//			System.out.println(dd);
//		}
//		for(Road_Finder rr : rList) {
//			System.out.println(rr);
//		}
		
		trip_boardService.writeTripBoard(trip_board, dList, rList);
//		List<MultipartFile> fileList = request.getFiles("files");
//		String path = "c:\\imageTmp\\";
//		for(MultipartFile mf : fileList) {
//			String fileOriginName = mf.getOriginalFilename();
//			System.out.println(fileOriginName);
//			String saveName = "new_"+fileOriginName;
//			try {
//				mf.transferTo(new File(path+saveName));
//			} catch (IllegalStateException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			} catch (IOException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		}
	}
}