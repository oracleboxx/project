package com.team3web.shop.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.team3web.shop.api.KakaoLoginBO;
import com.team3web.shop.api.NaverLoginBO;
import com.team3web.shop.service.LoginService;
import com.team3web.shop.vo.UserVO;


@Controller
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	private NaverLoginBO naverLoginBO;
	private KakaoLoginBO kakaoLoginBO;
	
	@Inject
	LoginService loginService;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	@Autowired
	private void setKakaoLoginBO(KakaoLoginBO kakaoLoginBO) {
		this.kakaoLoginBO = kakaoLoginBO;
	}
	
	@RequestMapping(value = "/login" , method = RequestMethod.GET)
    public String login(Model model, HttpSession session) {
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		System.out.println("네이버: " + naverAuthUrl);
		model.addAttribute("naverUrl", naverAuthUrl);
		
	    String kakaoAuthUrl = kakaoLoginBO.getAuthorizationUrl(session);
	    System.out.println("카카오: " + kakaoAuthUrl);
	    model.addAttribute("kakaoUrl", kakaoAuthUrl);
	    
		return "/user/login";
	}
	
	@RequestMapping(value = "/naver/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String naverCallback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
		System.out.println("Naver callback");
	    
	    OAuth2AccessToken oauthToken;
	    oauthToken = naverLoginBO.getAccessToken(session, code, state);
	    
	    if (oauthToken != null) {
	        String apiResult = naverLoginBO.getUserProfile(oauthToken);
	        JSONParser parser = new JSONParser();
	        Object obj = parser.parse(apiResult);
	        JSONObject jsonObj = (JSONObject) obj;
	        
	        JSONObject response_obj = (JSONObject) jsonObj.get("response");
	        String nickname = (String) response_obj.get("nickname");
	        System.out.println(nickname);
	        
	        session.setAttribute("sessionId", nickname);
	        model.addAttribute("result", apiResult);
	    } else {
	    	System.out.println(" AccessToken ");
	    }
	    
	    return "login";
	}
	
	@RequestMapping(value = "/kakao/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String kakaoCallback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
	    System.out.println("Kakao callback");
	    
	    OAuth2AccessToken oauthToken;
	    oauthToken = kakaoLoginBO.getAccessToken(session, code, state);
	    
	    if (oauthToken != null) {
	        String apiResult = kakaoLoginBO.getUserProfile(oauthToken);
	        
	        JSONParser parser = new JSONParser();
	        Object obj = parser.parse(apiResult);
	        JSONObject jsonObj = (JSONObject) obj;
	        JSONObject properties = (JSONObject) jsonObj.get("properties");
	        String nickname = (String) properties.get("nickname");
	        
	        System.out.println(nickname);
	        session.setAttribute("sessionId", nickname);
	        model.addAttribute("result", apiResult);
	    } else {
	    	System.out.println(" AccessToken ");
	    }
	    
	    return "login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(
	        @RequestParam("id") String id,
	        @RequestParam("password") String password,
	        HttpSession session,
	        Model model,
	        RedirectAttributes redirectAttributes) {

	    UserVO userVO = new UserVO();
	    userVO.setId(id);
	    userVO.setPassword(password);

	    int loginResult = loginService.loginCheck(userVO, session);

	    if (loginResult == 1) {
	        int role = loginService.getUserRole(id);
	        String name = loginService.getUserName(id);
	        String pw = loginService.getPasswordById(password);
	        session.setAttribute("loggedInUserName", name);
	        session.setAttribute("id",id);	 
	      session.setAttribute("pw", pw);
	        System.out.println("로그인 성공 "+name);
	        
	        if (role == 0 || role == 1  ) {
	            return "index";
	        } else if (role == 2) {
	            return "/shop/admin";
	        } else {
	            return "index";
	        }
	    } else {
	        model.addAttribute("loginResult", "아이디 또는 비밀번호가 일치하지 않습니다.");
	        System.out.println("로그인 실패");
	        return "/user/login";
	    }
	}
	@RequestMapping(value = "/userUpdate", method = RequestMethod.GET)
	public String update(Model model, HttpSession session,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();

		String id=(String)session.getAttribute("id");//세션 아이디를 구함
		String password=(String)session.getAttribute("pw");
		logger.info("C: 회원정보보기 GET의 아이디 "+id);
		logger.info("C: 회원정보보기 GET의 비밀번호 "+password);
		
	
		if(id == null) {
          out.println("<script>");
          out.println("alert('다시 로그인 하세요!');");
          out.println("</script>");
		}else {
			
			UserVO user=loginService.getUserById(id);
			String pw=loginService.getPasswordById(password);
			  model.addAttribute("user", user);
			  model.addAttribute("pw",pw);
			    logger.info(" 회원정보보기 GET의 VO " + id);
			    logger.info("vo pw:" + pw);
			  return "/user/userUpdate";
		}
		return null;
	}

	@RequestMapping(value = "/userUp", method = RequestMethod.POST)
	public String updateUser( Model model, HttpSession session ,UserVO userVO) throws Exception {
		model.addAttribute("userVO",loginService.getUserById((String)session.getAttribute("id")));
		
		
		
	    // 여기에서 updatedUser를 이용하여 데이터베이스 업데이트 또는 다른 작업을 수행합니다.
		logger.info("C: 회원정보수정 입력페이지 POST");
		loginService.updateUser(userVO);
		   session.setAttribute("userVO", userVO);
			System.out.println("userVO:"+userVO);
		    // 세션에 수정된 사용자 정보를 업데이트합니다.
		
		
	    // 수정이 완료된 후에 메인 화면으로 리다이렉트 또는 포워딩합니다.
	    return "redirect:/userUpdate"; // 메인 화면으로 리다이렉트 예시
	}
	// 
//	@RequestMapping(value = "/changePassword", method = RequestMethod.POST)
//	public String changePassword(@RequestParam("oldPassword")String oldPassword,@RequestParam("newPassword") String newPassword, Model model, HttpSession session) throws Exception {
//	    // 여기에서 updatedUser를 이용하여 데이터베이스 업데이트 또는 다른 작업을 수행합니다.
//		 String userId = (String) session.getAttribute("id");
//		  boolean passwordChanged = loginService.changePassword(userId, oldPassword, newPassword);
//		  if (passwordChanged) {
//				model.addAttribute("userVO",loginService.getUserById((String)session.getAttribute("id")));
//		        return "redirect:/";
//	    // 세션에 수정된 사용자 정보를 업데이트합니다.
//	
//		  }else
//		return userId;
//	}

	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session)throws IOException {
		session.removeAttribute("loggedInUserName");
		session.invalidate();
	 
		return "index";
	}
}