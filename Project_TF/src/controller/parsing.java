package controller;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;

import org.json.JSONArray;
import org.json.JSONObject;

public class parsing {
	public static void main(String[] args) throws Exception {
		BufferedReader br = null;
		String inputLine = null;
		StringBuilder sb = new StringBuilder();
		
		String webURL = "https://map.naver.com/findroute2/searchPubtransPath.nhn?apiVersion=3&searchType=0&start=126.8966655%2C37.4830969%2C%EB%AA%85%EC%B9%AD+%EC%97%86%EC%9D%8C&destination=127.0276368%2C37.4979502%2C%EB%AA%85%EC%B9%AD+%EC%97%86%EC%9D%8C";
		URL url = new URL(webURL);
		HttpsURLConnection connection = (HttpsURLConnection)url.openConnection();
//		connection.setRequestMethod("GET");
		
			try {
//				br = new BufferedReader(new InputStreamReader(new FileInputStream("D:/Dropbox/eclipse_workspace2/NaverMap_Practice/src/test/NaverMap_Json.json")));
				br = new BufferedReader(new InputStreamReader(connection.getInputStream()));
				
				while((inputLine = br.readLine())!=null) {
					//버퍼에서 읽어온 문자열을 계속 연결
					sb.append(inputLine);
				}
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}finally {
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		
		JSONObject jsonObject = new JSONObject(sb.toString());
		JSONArray subPaths = jsonObject.getJSONObject("result").getJSONArray("path");
		JSONArray subPath = jsonObject.getJSONObject("result").getJSONArray("path").getJSONObject(0).getJSONArray("subPath");
		JSONObject info = jsonObject.getJSONObject("result").getJSONArray("path").getJSONObject(0).getJSONObject("info");
		System.out.println(info.get("totalTime"));
		System.out.println(info.get("mapObj"));
		System.out.println(info.get("payment"));
		
		
//		List<JSONObject> sPaths = new ArrayList<JSONObject>();
//
//		System.out.println(subPaths.length());
//		for(int i=0;i<subPaths.length();i++) {
//			System.out.println(subPaths.getJSONObject(i));
//		}
//			
//		System.out.println(sPaths);	
			
			
		
		
	}

}
