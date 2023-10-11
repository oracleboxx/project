package com.team3web.shop.api;

import java.io.IOException;
import java.util.UUID;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

@Component
public class KakaoLoginBO {
    private final static String CLIENT_ID = "473b250b46e3a08eb8db0f1fb6578aa8";
    private final static String CLIENT_SECRET = "yrCANAIRom6BEirbeDTICez0ECpo7ABg";
    private final static String REDIRECT_URI = "http://localhost:7996/shop/login/kakao";
    private final static String SESSION_STATE = "oauth_state";

    // 카카오 아이디로 인증 URL 생성 메서드
    public String getAuthorizationUrl(HttpSession session) {
        // 세션 유효성 검증을 위해 난수 생성
        String state = generateRandomString();
        setSession(session, state);
        
        // Scribe를 사용하여 인증 URL 생성
        OAuth20Service oauthService = new ServiceBuilder()
            .apiKey(CLIENT_ID)
            .apiSecret(CLIENT_SECRET)
            .callback(REDIRECT_URI)
            .state(state)
            .build(KakaoLoginApi.instance());
        
        return oauthService.getAuthorizationUrl();
    }
    
    // 카카오 아이디로 Callback 처리 및 AccessToken 획득 메서드
    public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws IOException {
        // Callback으로 전달받은 세션 검증용 난수값과 세션에 저장된 값이 일치하는지 확인
        String sessionState = getSession(session);
        if (StringUtils.pathEquals(sessionState, state)) {
            OAuth20Service oauthService = new ServiceBuilder()
                .apiKey(CLIENT_ID)
                .apiSecret(CLIENT_SECRET)
                .callback(REDIRECT_URI)
                .state(state)
                .build(KakaoLoginApi.instance());
            
            OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
            return accessToken;
        }
        return null;
    }
    
    // 세션 유효성 검증을 위한 난수 생성 메서드
    private String generateRandomString() {
        return UUID.randomUUID().toString();
    }
    
    private void setSession(HttpSession session, String state) {
        session.setAttribute(SESSION_STATE, state);
    }
    
    private String getSession(HttpSession session) {
        return (String) session.getAttribute(SESSION_STATE);
    }
    
    // 카카오 사용자 프로필 API 호출
    public String getUserProfile(OAuth2AccessToken oauthToken) throws IOException {
        OAuth20Service oauthService = new ServiceBuilder()
            .apiKey(CLIENT_ID)
            .apiSecret(CLIENT_SECRET)
            .callback(REDIRECT_URI)
            .build(KakaoLoginApi.instance());
        
        OAuthRequest request = new OAuthRequest(Verb.GET, "https://kapi.kakao.com/v2/user/me", oauthService);
        oauthService.signRequest(oauthToken, request);
        Response response = request.send();
        return response.getBody();
    }
}
