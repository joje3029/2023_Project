package com.example.demo.service;

import java.util.List;
import java.util.Map;

import org.springframework.core.ParameterizedTypeReference;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;

import com.example.demo.dao.WebClientDao;

@Service
public class WebClientServiceImpl {
	
	private WebClientDao webClientDao;
	
	public WebClientServiceImpl(WebClientDao webClientDao) {
		this.webClientDao = webClientDao;
	}

    public void getNewBook() { // 일단 새로운책으로 해서 controller에서 요청을 보냈을때 받는지 해보자. 대충 뭐 하나 jsp에서 연결해서 contorller가 일하게 하면 되니까. 
    	
        String ttbkey = "ttbphandom03111555001";
        String QueryType = "ItemNewAll";
        String SearchTarget = "Book";
        String output = "js";
        String Version = "20131101";
        String MaxResults = "100";
        
        // 여기서부터 문제네. 
        // webClient 기본 설정
        WebClient webClient =
                WebClient
                        .builder()
                        .baseUrl("http://www.aladin.co.kr")
                        .build();
        // api 요청
        Map<String, Object> response =
                webClient
                        .get()
                        .uri(uriBuilder ->
                                uriBuilder
                                        .path("/ttb/api/ItemList.aspx")
                                        .queryParam("ttbkey", ttbkey)
                                        .queryParam("QueryType", QueryType)
                                        .queryParam("MaxResults", MaxResults)
                                        .queryParam("SearchTarget", SearchTarget)
                                        .queryParam("output", output)
                                        .queryParam("Version", Version)
                                        .build())
                        .retrieve()
                        .bodyToMono(new ParameterizedTypeReference<Map<String, Object>>() {})
                        .block();
        
        // 가꼬온거를 Db에 넣어야지.
        // 넣기전에 잘라야해. 내가 필요한것만.
        List<Map<String, Object>> itemList=(List<Map<String, Object>>) response.get("item");
        
        webClientDao.insertBook(itemList);
        
    }
    
    public void getBestBook() { // 일단 새로운책으로 해서 controller에서 요청을 보냈을때 받는지 해보자. 대충 뭐 하나 jsp에서 연결해서 contorller가 일하게 하면 되니까. 
    	
        String ttbkey = "ttbphandom03111555001";
        String QueryType = "Bestseller";
        String SearchTarget = "Book";
        String output = "js";
        String Version = "20131101";
        String MaxResults = "100";
        
        // 여기서부터 문제네. 
        // webClient 기본 설정
        WebClient webClient =
                WebClient
                        .builder()
                        .baseUrl("http://www.aladin.co.kr")
                        .build();
        // api 요청
        Map<String, Object> response =
                webClient
                        .get()
                        .uri(uriBuilder ->
                                uriBuilder
                                        .path("/ttb/api/ItemList.aspx")
                                        .queryParam("ttbkey", ttbkey)
                                        .queryParam("QueryType", QueryType)
                                        .queryParam("MaxResults", MaxResults)
                                        .queryParam("SearchTarget", SearchTarget)
                                        .queryParam("output", output)
                                        .queryParam("Version", Version)
                                        .build())
                        .retrieve()
                        .bodyToMono(new ParameterizedTypeReference<Map<String, Object>>() {})
                        .block();
        
        // 가꼬온거를 Db에 넣어야지.
        // 넣기전에 잘라야해. 내가 필요한것만.
        List<Map<String, Object>> itemList=(List<Map<String, Object>>) response.get("item");
        
        webClientDao.insertBook(itemList);
        
        
    }
}
