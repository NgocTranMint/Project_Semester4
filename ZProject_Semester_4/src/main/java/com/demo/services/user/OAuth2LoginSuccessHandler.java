package com.demo.services.user;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

@Component
public class OAuth2LoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

	public void setRedirectStrategy(RedirectStrategy redirectStrategy) {
		this.redirectStrategy = redirectStrategy;
	}

	protected RedirectStrategy getRedirectStrategy() {
		return redirectStrategy;
	}

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		// TODO Auto-generated method stub
		CustomOAuth2User auth2ServiceUserImpl = (CustomOAuth2User) authentication.getPrincipal();
		String email = auth2ServiceUserImpl.getEmail();
		String name = auth2ServiceUserImpl.getName();
		String picture = auth2ServiceUserImpl.getPicture();
		System.out.println(name);
		System.out.println(email);
		System.out.println(picture);
		System.out.println("hello" + authentication.getAuthorities().toString());
		System.out.println(request.getParameter("code"));
		request.getSession().setAttribute("email", email);
		request.getSession().setAttribute("name", name);
		request.getSession().setAttribute("picture", picture);
		request.getSession().setAttribute("code", request.getParameter("code").toString());
		redirectStrategy.sendRedirect(request, response, "/google");

		super.onAuthenticationSuccess(request, response, authentication);

	}

}
