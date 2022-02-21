/*
 * @(#)GeolocationAPI.java $version 2017. 5. 19.
 *
 * Copyright 2007 NHN Corp. All rights Reserved.
 * NHN PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 */
package com.group7.MGMN.service;

import org.apache.commons.codec.binary.Base64;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.json.JSONObject;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.*;

public class GeolocationAPI {
	private final String accessKey;
	private final String secretKey;
	private final CloseableHttpClient httpClient;

	public GeolocationAPI(final String accessKey, final String secretKey) {
		this.accessKey = accessKey;
		this.secretKey = secretKey;

		final int timeout = 5000;
		final RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(timeout).setConnectTimeout(timeout).build();
		httpClient = HttpClientBuilder.create().setDefaultRequestConfig(requestConfig).build();
	}

	public static String getLocation(String ip) {
		String accessKey = "572FC0EF42E6019CDE12";
		String secretKey = "4A6116122E462B6A29848AA2C83CA77074771CDC";
		String IP = ip;
		String result = "";


		try {
			System.out.println(accessKey + secretKey + IP);
			final GeolocationAPI geolocationAPI = new GeolocationAPI(accessKey, secretKey);
			String str = geolocationAPI.run(IP);

			// json => str
			result = jsonToString(str);

		} catch (final Exception e) {
			System.out.println(e.getMessage());
		}



		return result;
	}
	
	// 동 까지만
	public static String getLocation2(String ip) {
		String accessKey = "572FC0EF42E6019CDE12";
		String secretKey = "4A6116122E462B6A29848AA2C83CA77074771CDC";
		String IP = ip;
		String result = "";


		try {
			System.out.println(accessKey + secretKey + IP);
			final GeolocationAPI geolocationAPI = new GeolocationAPI(accessKey, secretKey);
			String str = geolocationAPI.run(IP);

			// json => str
			result = jsonToString2(str);

		} catch (final Exception e) {
			System.out.println(e.getMessage());
		}



		return result;
	}

	public String run(final String ip) throws Exception {
		final String requestMethod = "GET";
		final String hostName = "https://geolocation.apigw.ntruss.com";
		final String requestUrl= "/geolocation/v2/geoLocation";
		
		final Map<String, List<String>> requestParameters = new HashMap<String, List<String>>();
		requestParameters.put("ip", Arrays.asList(ip));
		requestParameters.put("ext", Arrays.asList("t"));
		requestParameters.put("responseFormatType", Arrays.asList("json"));
		
		SortedMap<String, SortedSet<String>> parameters = convertTypeToSortedMap(requestParameters);
		
		String timestamp = generateTimestamp();
		System.out.println("timestamp: " + timestamp);

		String baseString = requestUrl + "?" + getRequestQueryString(parameters);
		System.out.println("baseString : " + baseString);
		
		String signature = makeSignature(requestMethod, baseString, timestamp, accessKey, secretKey);
		System.out.println("signature : " + signature);
		
		final String requestFullUrl = hostName + baseString;
		final HttpGet request = new HttpGet(requestFullUrl);
		request.setHeader("x-ncp-apigw-timestamp",timestamp);
		request.setHeader("x-ncp-iam-access-key",accessKey);
		request.setHeader("x-ncp-apigw-signature-v2",signature);
		
		final CloseableHttpResponse response;
		response = httpClient.execute(request);

		final String msg = getResponse(response);
		System.out.println(msg);

		return msg;
	}

	private String getResponse(final CloseableHttpResponse response) throws Exception {
		final StringBuffer buffer = new StringBuffer();
		final BufferedReader reader = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));

		String msg;

		try {
			while ((msg = reader.readLine()) != null) {
				buffer.append(msg);
			}
		} catch (final Exception e) {
			throw e;
		} finally {
			response.close();
		}
		return buffer.toString();
	}


	/**
	 * @param requestParameters
	 * @param significateParameters
	 */
	private static SortedMap<String, SortedSet<String>> convertTypeToSortedMap(final Map<String, List<String>> requestParameters) {
		final SortedMap<String, SortedSet<String>> significateParameters = new TreeMap<String, SortedSet<String>>();
		final Iterator<String> parameterNames = requestParameters.keySet().iterator();
		while (parameterNames.hasNext()) {
			final String parameterName = parameterNames.next();
			List<String> parameterValues = requestParameters.get(parameterName);
			if (parameterValues == null) {
				parameterValues = new ArrayList<String>();
			}

			for (String parameterValue : parameterValues) {
				if (parameterValue == null) {
					parameterValue = "";
				}

				SortedSet<String> significantValues = significateParameters.get(parameterName);
				if (significantValues == null) {
					significantValues = new TreeSet<String>();
					significateParameters.put(parameterName, significantValues);
				}
				significantValues.add(parameterValue);
			}

		}
		return significateParameters;
	}

	private static String generateTimestamp() {
		return Long.toString(System.currentTimeMillis());
	}

	/**
	 * query string 생성
	 * @param significantParameters
	 * @return
	 */
	private static String getRequestQueryString(final SortedMap<String, SortedSet<String>> significantParameters) {
		final StringBuilder queryString = new StringBuilder();
		final Iterator<Map.Entry<String, SortedSet<String>>> paramIt = significantParameters.entrySet().iterator();
		while (paramIt.hasNext()) {
			final Map.Entry<String, SortedSet<String>> sortedParameter = paramIt.next();
			final Iterator<String> valueIt = sortedParameter.getValue().iterator();
			while (valueIt.hasNext()) {
				final String parameterValue = valueIt.next();
				
				queryString.append(sortedParameter.getKey()).append('=').append(parameterValue);
				
				if (paramIt.hasNext() || valueIt.hasNext()) {
					queryString.append('&');
				}
			}
		}
		return queryString.toString();
	}	


	/**
	 * * base string과 timestamp, access key, secret key를 가지고 signature 생성
	 * @param method
	 * @param baseString
	 * @param timestamp
	 * @param accessKey
	 * @param secretKey
	 * @return
	 * @throws NoSuchAlgorithmException
	 * @throws UnsupportedEncodingException
	 * @throws InvalidKeyException
	 */
	public String makeSignature(final String method, final String baseString, final String timestamp, final String accessKey, final String secretKey) throws UnsupportedEncodingException, NoSuchAlgorithmException, InvalidKeyException{
	    String space = " ";                       // one space
	    String newLine = "\n";                    // new line

	    String message = new StringBuilder()
	        .append(method)
	        .append(space)
	        .append(baseString)
	        .append(newLine)
	        .append(timestamp)
	        .append(newLine)
	        .append(accessKey)
	        .toString();

	    SecretKeySpec signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"), "HmacSHA256");
		Mac mac = Mac.getInstance("HmacSHA256");
	    mac.init(signingKey);
	    byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
	    String encodeBase64String = Base64.encodeBase64String(rawHmac);
	    return encodeBase64String;
	}


	private static String jsonToString(String str) {
		String result = "";

		JSONObject jsonObject = new JSONObject(str);
		JSONObject geoLocationObj = jsonObject.getJSONObject("geoLocation");

		// 도, 시/군/구, 동, 위도, 경도
		String province = (String) geoLocationObj.get("r1");
		String country = (String) geoLocationObj.get("r2");
		String location = (String) geoLocationObj.get("r3");
		BigDecimal latitude = (BigDecimal) geoLocationObj.get("lat");
		BigDecimal longitude = (BigDecimal) geoLocationObj.get("long");

		System.out.println("province = " + province);
		System.out.println("country = " + country);
		System.out.println("location = " + location);
		System.out.println("latitude = " + latitude);
		System.out.println("longitude = " + longitude);
		
		result = String.format("%s %s %s", province, country, location);

		return result;
	}

	
	// 구 까지만 toString
	private static String jsonToString2(String str) {
		String result = "";

		JSONObject jsonObject = new JSONObject(str);
		JSONObject geoLocationObj = jsonObject.getJSONObject("geoLocation");

		// 도, 시/군/구, 위도, 경도
		String province = (String) geoLocationObj.get("r1");
		String country = (String) geoLocationObj.get("r2");
		//String location = (String) geoLocationObj.get("r3");
		BigDecimal latitude = (BigDecimal) geoLocationObj.get("lat");
		BigDecimal longitude = (BigDecimal) geoLocationObj.get("long");

		System.out.println("province = " + province);
		System.out.println("country = " + country);
		//System.out.println("location = " + location);
		System.out.println("latitude = " + latitude);
		System.out.println("longitude = " + longitude);
		
		// 구 까지만
		result = String.format("%s %s", province, country);

		return result;
	}

	public static void main(String[] args) {
		String json = "{" +
						"\"returnCode\": 0," +
						"\"requestId\": \"ae9cf7db-9f32-4a8b-b57b-06c16965df2d\"," +
						"\"geoLocation\":{" +
							"\"country\": \"KR\"," +
							"\"code\": \"4511168000\"," +
							"\"r1\": \"전라북도\"," +
							"\"r2\": \"전주시 완산구\"," +
							"\"r3\": \"서신동\"," +
							"\"lat\": 35.831085," +
							"\"long\": 127.1155486," +
							"\"net\": \"SK Broadband Co Ltd\"" +
						"}" +
					"}\n";

		JSONObject jsonObject = new JSONObject(json);
		JSONObject geoLocationObj = jsonObject.getJSONObject("geoLocation");

		// 도, 시/군/구, 동, 위도, 경도
		String province = (String) geoLocationObj.get("r1");
		String country = (String) geoLocationObj.get("r2");
		String location = (String) geoLocationObj.get("r3");
		BigDecimal latitude = (BigDecimal) geoLocationObj.get("lat");
		BigDecimal longitude = (BigDecimal) geoLocationObj.get("long");

		System.out.println("province = " + province);
		System.out.println("country = " + country);
		System.out.println("location = " + location);
		System.out.println("latitude = " + latitude);
		System.out.println("longitude = " + longitude);

	}

}
