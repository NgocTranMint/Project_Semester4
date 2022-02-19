package com.demo.controllers.user;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demo.configurations.MyConstants;
import com.demo.helpers.UploadHelper;
import com.demo.models.Account;
import com.demo.models.AccountPack;
import com.demo.services.AccountService;
import com.demo.services.user.AccountPackService;
import com.demo.services.user.AccountServiceUser;
import com.demo.services.user.RoleServiceUser;
import com.demo.validators.AccountValidator;

@Controller
@RequestMapping(value = { "user/account", "login/oauth2/code" })
public class AccountController implements ServletContextAware {
	@Autowired
	private AccountValidator accountValidator;
	@Autowired
	private RoleServiceUser roleServiceUser;
	@Autowired
	private AccountService accountService;

	private ServletContext servletContext;

	@Autowired
	private AccountServiceUser accountServiceUser;
	@Autowired
	private AccountPackService accountPackService;

	@Override
	public void setServletContext(ServletContext servletContext) {

		this.servletContext = servletContext;

	}

	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

	public void setRedirectStrategy(RedirectStrategy redirectStrategy) {
		this.redirectStrategy = redirectStrategy;
	}

	protected RedirectStrategy getRedirectStrategy() {
		return redirectStrategy;
	}

	public void sendMail(Account account, String hash) {

		String email = MyConstants.MY_EMAIL;
		String password = MyConstants.MY_PASSWORD;

		Properties theProperties = new Properties();

		theProperties.put("mail.smtp.auth", "true");
		theProperties.put("mail.smtp.starttls.enable", "true");
		theProperties.put("mail.smtp.host", "smtp.gmail.com");
		theProperties.put("mail.smtp.port", "587");

		Session session = Session.getInstance(theProperties, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(email, password);
			}
		});

		try {

			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(email));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(account.getEmail()));
			message.setSubject("Email Verification Link");
			message.setContent(
					"<head>\r\n    <title>Hello</title>\r\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n    <style type=\"text/css\">\r\n        #outlook a {\r\n            padding: 0;\r\n        }\r\n\r\n        .ReadMsgBody {\r\n            width: 100%;\r\n        }\r\n\r\n        .ExternalClass {\r\n            width: 100%;\r\n        }\r\n\r\n            .ExternalClass * {\r\n                line-height: 100%;\r\n            }\r\n\r\n        body {\r\n            margin: 0;\r\n            padding: 0;\r\n            -webkit-text-size-adjust: 100%;\r\n            -ms-text-size-adjust: 100%;\r\n        }\r\n\r\n        table, td {\r\n            border-collapse: collapse;\r\n            mso-table-lspace: 0pt;\r\n            mso-table-rspace: 0pt;\r\n        }\r\n\r\n        img {\r\n            border: 0;\r\n            height: auto;\r\n            line-height: 100%;\r\n            outline: none;\r\n            text-decoration: none;\r\n            -ms-interpolation-mode: bicubic;\r\n        }\r\n\r\n        p {\r\n            display: block;\r\n            margin: 13px 0;\r\n        }\r\n    </style>\r\n    <!--[if !mso]><!-->\r\n    <style type=\"text/css\">\r\n  @media only screen and (max-width:480px) {\r\n    @-ms-viewport { width:320px; }\r\n    @viewport { width:320px; }\r\n  }\r\n    </style>\r\n    <!--<![endif]-->\r\n    <!--[if mso]>\r\n    <xml>\r\n      <o:OfficeDocumentSettings>\r\n        <o:AllowPNG/>\r\n        <o:PixelsPerInch>96</o:PixelsPerInch>\r\n      </o:OfficeDocumentSettings>\r\n    </xml>\r\n    <![endif]-->\r\n    <style type=\"text/css\">\r\n  @media only screen and (min-width:480px) {\r\n    .mj-column-per-100, * [aria-labelledby=\"mj-column-per-100\"] { width:100%!important; }\r\n.mj-column-per-80, * [aria-labelledby=\"mj-column-per-80\"] { width:80%!important; }\r\n.mj-column-per-30, * [aria-labelledby=\"mj-column-per-30\"] { width:30%!important; }\r\n.mj-column-per-70, * [aria-labelledby=\"mj-column-per-70\"] { width:70%!important; }\r\n  }\r\n    </style>\r\n</head>\r\n<body style=\"background: #E3E5E7;\">\r\n    <div style=\"background-color:#E3E5E7;\">\r\n        <!--[if mso | IE]>\r\n        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" align=\"center\" style=\"width:600px;\">\r\n          <tr>\r\n            <td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\">\r\n        <![endif]-->\r\n        <div style=\"margin:0 auto;max-width:600px;background:white;\">\r\n            <table cellpadding=\"0\" cellspacing=\"0\" style=\"font-size:0px;width:100%;background:white;\" align=\"center\" border=\"0\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td style=\"text-align:center;vertical-align:top;font-size:0px;padding:20px 0px;\">\r\n                            <!--[if mso | IE]>\r\n                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td style=\"vertical-align:top;width:600px;\">\r\n                            <![endif]-->\r\n                            <div aria-labelledby=\"mj-column-per-100\" class=\"mj-column-per-100\" style=\"vertical-align:top;display:inline-block;font-size:13px;text-align:left;width:100%;\"><table cellpadding=\"0\" cellspacing=\"0\" style=\"vertical-align:top;\" width=\"100%\" border=\"0\"><tbody><tr><td style=\"word-break:break-word;font-size:0px;padding:10px 25px;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse:collapse;border-spacing:0px;\" align=\"center\" border=\"0\"><tbody><tr><td style=\"width:80px;\"></td></tr></tbody></table></td></tr></tbody></table></div>\r\n                            <!--[if mso | IE]>\r\n                            </td></tr></table>\r\n                            <![endif]-->\r\n                        </td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n        </div>\r\n        <!--[if mso | IE]>\r\n        </td></tr></table>\r\n        <![endif]-->\r\n        <!--[if mso | IE]>\r\n        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" align=\"center\" style=\"width:600px;\">\r\n          <tr>\r\n            <td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\">\r\n        <![endif]-->\r\n        <div style=\"margin:0 auto;max-width:600px;background:#222228;\">\r\n            <table cellpadding=\"0\" cellspacing=\"0\" style=\"font-size:0px;width:100%;background:#222228;\" align=\"center\" border=\"0\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td style=\"text-align:center;vertical-align:top;font-size:0px;padding:20px 0px;\">\r\n                            <!--[if mso | IE]>\r\n                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td style=\"vertical-align:top;width:480px;\">\r\n                            <![endif]-->\r\n                            <div aria-labelledby=\"mj-column-per-80\" class=\"mj-column-per-80\" style=\"vertical-align:top;display:inline-block;font-size:13px;text-align:left;width:100%;\">\r\n                                <table cellpadding=\"0\" cellspacing=\"0\" style=\"vertical-align:top;\" width=\"100%\" border=\"0\">\r\n                                    <tbody>\r\n                                        <tr><td style=\"word-break:break-word;font-size:0px;padding:10px 25px;padding-top:30px;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse:collapse;border-spacing:0px;\" align=\"center\" border=\"0\"><tbody><tr><td style=\"width:80px;\"><img alt=\"Zero To Launch\" title=\"\" height=\"auto\" src=\"https://cdn.auth0.com/website/emails/product/top-verify.png\" style=\"border:none;border-radius:;display:block;outline:none;text-decoration:none;width:100%;height:auto;\" width=\"80\"></td></tr></tbody></table></td></tr>\r\n                                        <tr>\r\n                                            <td style=\"word-break:break-word;font-size:0px;padding:0px 20px 0px 20px;\" align=\"center\">\r\n                                                <div style=\"cursor:auto;color:white;font-family:'Avenir Next', Avenir, sans-serif;font-size:32px;line-height:60ps;\">\r\n                                                    Verify Your Account\r\n                                                </div>\r\n                                            </td>\r\n                                        </tr>\r\n                                    </tbody>\r\n                                </table>\r\n                            </div>\r\n                            <!--[if mso | IE]>\r\n                            </td></tr></table>\r\n                            <![endif]-->\r\n                        </td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n        </div>\r\n        <!--[if mso | IE]>\r\n        </td></tr></table>\r\n        <![endif]-->\r\n        <!--[if mso | IE]>\r\n        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" align=\"center\" style=\"width:600px;\">\r\n          <tr>\r\n            <td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\">\r\n        <![endif]-->\r\n        <div style=\"margin:0 auto;max-width:600px;background:white;\">\r\n            <table cellpadding=\"0\" cellspacing=\"0\" style=\"font-size:0px;width:100%;background:white;\" align=\"center\" border=\"0\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td style=\"text-align:center;vertical-align:top;font-size:0px;padding:40px 25px 0px;\">\r\n                            <!--[if mso | IE]>\r\n                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td style=\"vertical-align:top;width:600px;\">\r\n                            <![endif]-->\r\n                            <div aria-labelledby=\"mj-column-per-100\" class=\"mj-column-per-100\" style=\"vertical-align:top;display:inline-block;font-size:13px;text-align:left;width:100%;\">\r\n                                <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\r\n                                    <tbody>\r\n                                        <tr>\r\n                                            <td style=\"word-break:break-word;font-size:0px;padding:0px 0px 25px;\" align=\"left\">\r\n                                                <div style=\"cursor:auto;color:#222228;font-family:'Avenir Next', Avenir, sans-serif;font-size:18px;font-weight:500;line-height:30px;\">\r\n                                                    Your account information\r\n                                                </div>\r\n                                            </td>\r\n                                        </tr>\r\n                                    </tbody>\r\n                                </table>\r\n                            </div>\r\n                            <!--[if mso | IE]>\r\n                            </td><td style=\"vertical-align:top;width:180px;\">\r\n                            <![endif]-->\r\n                            <div aria-labelledby=\"mj-column-per-30\" class=\"mj-column-per-30\" style=\"vertical-align:top;display:inline-block;font-size:13px;text-align:left;width:100%;\">\r\n                                <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\r\n                                    <tbody>\r\n                                        <tr>\r\n                                            <td style=\"word-break:break-word;font-size:0px;padding:0px 0px 10px;\" align=\"left\">\r\n                                                <div style=\"cursor:auto;color:#222228;font-family:'Avenir Next', Avenir, sans-serif;font-size:16px;line-height:30px;\">\r\n                                                    <strong style=\"font-weight: 500; white-space: nowrap;\">Account</strong>\r\n                                                </div>\r\n                                            </td>\r\n                                        </tr>\r\n                                    </tbody>\r\n                                </table>\r\n                            </div>\r\n                            <!--[if mso | IE]>\r\n                            </td><td style=\"vertical-align:top;width:420px;\">\r\n                            <![endif]-->\r\n                            <div aria-labelledby=\"mj-column-per-70\" class=\"mj-column-per-70\" style=\"vertical-align:top;display:inline-block;font-size:13px;text-align:left;width:100%;\">\r\n                                <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\r\n                                    <tbody>\r\n                                        <tr>\r\n                                            <td style=\"word-break:break-word;font-size:0px;padding:0px 0px 10px;\" align=\"left\">\r\n                                                <div style=\"cursor:auto;color:#222228;font-family:'Avenir Next', Avenir, sans-serif;font-size:16px;line-height:30px;\">\r\n                                                    "
							+ account.getFullname()
							+ "\r\n                                                </div>\r\n                                            </td>\r\n                                        </tr>\r\n                                    </tbody>\r\n                                </table>\r\n                            </div>\r\n                            <!--[if mso | IE]>\r\n                            </td><td style=\"vertical-align:top;width:180px;\">\r\n                            <![endif]-->\r\n                            <div aria-labelledby=\"mj-column-per-30\" class=\"mj-column-per-30\" style=\"vertical-align:top;display:inline-block;font-size:13px;text-align:left;width:100%;\">\r\n                                <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\r\n                                    <tbody>\r\n                                        <tr>\r\n                                            <td style=\"word-break:break-word;font-size:0px;padding:0px 0px 10px;\" align=\"left\">\r\n                                                <div style=\"cursor:auto;color:#222228;font-family:'Avenir Next', Avenir, sans-serif;font-size:16px;line-height:30px;\">\r\n                                                    <strong style=\"font-weight: 500; white-space: nowrap;\"></strong>\r\n                                                </div>\r\n                                            </td>\r\n                                        </tr>\r\n                                    </tbody>\r\n                                </table>\r\n                            </div>\r\n                            <!--[if mso | IE]>\r\n                            </td><td style=\"vertical-align:top;width:420px;\">\r\n                            <![endif]-->\r\n                            <div aria-labelledby=\"mj-column-per-70\" class=\"mj-column-per-70\" style=\"vertical-align:top;display:inline-block;font-size:13px;text-align:left;width:100%;\">\r\n                                <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\r\n                                    <tbody>\r\n                                        <tr>\r\n                                            <td style=\"word-break:break-word;font-size:0px;padding:0px 0px 25px;\" align=\"left\">\r\n                                                <div style=\"cursor:auto;color:#222228;font-family:'Avenir Next', Avenir, sans-serif;font-size:16px;line-height:30px;\">\r\n                                                    \r\n                                                </div>\r\n                                            </td>\r\n                                        </tr>\r\n                                    </tbody>\r\n                                </table>\r\n                            </div>\r\n                            <!--[if mso | IE]>\r\n                            </td></tr></table>\r\n                            <![endif]-->\r\n                        </td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n        </div>\r\n        <!--[if mso | IE]>\r\n        </td></tr></table>\r\n        <![endif]-->\r\n        <!--[if mso | IE]>\r\n        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" align=\"center\" style=\"width:600px;\">\r\n          <tr>\r\n            <td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\">\r\n        <![endif]-->\r\n        <div style=\"margin:0 auto;max-width:600px;background:white;\">\r\n            <table cellpadding=\"0\" cellspacing=\"0\" style=\"font-size:0px;width:100%;background:white;\" align=\"center\" border=\"0\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td style=\"text-align:center;vertical-align:top;font-size:0px;padding:0px 30px;\">\r\n                            <!--[if mso | IE]>\r\n                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td style=\"vertical-align:undefined;width:600px;\">\r\n                            <![endif]-->\r\n                            <p style=\"font-size:1px;margin:0 auto;border-top:1px solid #E3E5E7;width:100%;\"></p><!--[if mso | IE]><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"font-size:1px;margin:0 auto;border-top:1px solid #E3E5E7;width:100%;\" width=\"600\"><tr><td style=\"height:0;line-height:0;\"> </td></tr></table><![endif]-->\r\n                            <!--[if mso | IE]>\r\n                            </td></tr></table>\r\n                            <![endif]-->\r\n                        </td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n        </div>\r\n        <!--[if mso | IE]>\r\n        </td></tr></table>\r\n        <![endif]-->\r\n        <!--[if mso | IE]>\r\n        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" align=\"center\" style=\"width:600px;\">\r\n          <tr>\r\n            <td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\">\r\n        <![endif]-->\r\n        <div style=\"margin:0 auto;max-width:600px;background:white;\">\r\n            <table cellpadding=\"0\" cellspacing=\"0\" style=\"font-size:0px;width:100%;background:white;\" align=\"center\" border=\"0\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td style=\"text-align:center;vertical-align:top;font-size:0px;padding:20px 0px;\">\r\n                            <!--[if mso | IE]>\r\n                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td style=\"vertical-align:top;width:600px;\">\r\n                            <![endif]-->\r\n                            <div aria-labelledby=\"mj-column-per-100\" class=\"mj-column-per-100\" style=\"vertical-align:top;display:inline-block;font-size:13px;text-align:left;width:100%;\">\r\n                                <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\r\n                                    <tbody>\r\n                                        <tr>\r\n                                            <td style=\"word-break:break-word;font-size:0px;padding:10px 25px;\" align=\"center\">\r\n                                                <table cellpadding=\"0\" cellspacing=\"0\" align=\"center\" border=\"0\">\r\n                                                    <tbody>\r\n                                                        <tr>\r\n                                                            <td style=\"border-radius:3px;color:white;cursor:auto;\" align=\"center\" valign=\"middle\" bgcolor=\"#EB5424\">\r\n                                                                <a href=\""
							+ "http://localhost:9799/user/account/ActivateAccount?key1=" + account.getUsername()
							+ "&key2=" + hash
							+ "\" style=\"display:inline-block;text-decoration:none;background:#EB5424;border-radius:3px;color:white;font-family:'Avenir Next', Avenir, sans-serif;font-size:14px;font-weight:500;line-height:35px;padding:10px 25px;margin:0px;\" target=\"_blank\">\r\n                                                                    VERIFY YOUR ACCOUNT\r\n                                                                </a>\r\n                                                            </td>\r\n                                                        </tr>\r\n                                                    </tbody>\r\n                                                </table>\r\n                                            </td>\r\n                                        </tr>\r\n                                    </tbody>\r\n                                </table>\r\n                            </div>\r\n                            <!--[if mso | IE]>\r\n                            </td></tr></table>\r\n                            <![endif]-->\r\n                        </td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n        </div>\r\n        <!--[if mso | IE]>\r\n        </td></tr></table>\r\n        <![endif]-->\r\n        <!--[if mso | IE]>\r\n        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" align=\"center\" style=\"width:600px;\">\r\n          <tr>\r\n            <td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\">\r\n        <![endif]-->\r\n        <div style=\"margin:0 auto;max-width:600px;background:white;\">\r\n            <table cellpadding=\"0\" cellspacing=\"0\" style=\"font-size:0px;width:100%;background:white;\" align=\"center\" border=\"0\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td style=\"text-align:center;vertical-align:top;font-size:0px;padding:20px 0px;\">\r\n                            <!--[if mso | IE]>\r\n                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td style=\"vertical-align:top;width:600px;\">\r\n                            <![endif]-->\r\n                            <div aria-labelledby=\"mj-column-per-100\" class=\"mj-column-per-100\" style=\"vertical-align:top;display:inline-block;font-size:13px;text-align:left;width:100%;\">\r\n                                <table cellpadding=\"0\" cellspacing=\"0\" style=\"vertical-align:top;\" width=\"100%\" border=\"0\">\r\n                                    <tbody>\r\n                                        <tr>\r\n                                            <td style=\"word-break:break-word;font-size:0px;padding:0px 25px 15px;\" align=\"left\">\r\n                                                <div style=\"cursor:auto;color:#222228;font-family:'Avenir Next', Avenir, sans-serif;font-size:16px;line-height:30px;\">\r\n                                                    If you are having any issues with your account, please don't hesitate to contact us by replying to this mail.\r\n                                                    <br>Thanks!\r\n                                                </div>\r\n                                            </td>\r\n                                        </tr>\r\n                                    </tbody>\r\n                                </table>\r\n                            </div>\r\n                            <!--[if mso | IE]>\r\n                            </td></tr></table>\r\n                            <![endif]-->\r\n                        </td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n        </div>\r\n        <!--[if mso | IE]>\r\n        </td></tr></table>\r\n        <![endif]-->\r\n        <!--[if mso | IE]>\r\n        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" align=\"center\" style=\"width:600px;\">\r\n          <tr>\r\n            <td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\">\r\n        <![endif]-->\r\n        <div style=\"margin:0 auto;max-width:600px;background:#F5F7F9;\">\r\n            <table cellpadding=\"0\" cellspacing=\"0\" style=\"font-size:0px;width:100%;background:#F5F7F9;\" align=\"center\" border=\"0\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td style=\"text-align:center;vertical-align:top;font-size:0px;padding:20px 0px;\">\r\n                            <!--[if mso | IE]>\r\n                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td style=\"vertical-align:top;width:600px;\">\r\n                            <![endif]-->\r\n                            <div aria-labelledby=\"mj-column-per-100\" class=\"mj-column-per-100\" style=\"vertical-align:top;display:inline-block;font-size:13px;text-align:left;width:100%;\">\r\n                                <table cellpadding=\"0\" cellspacing=\"0\" style=\"vertical-align:top;\" width=\"100%\" border=\"0\">\r\n                                    <tbody>\r\n                                        <tr>\r\n                                            <td style=\"word-break:break-word;font-size:0px;padding:0px 20px;\" align=\"center\">\r\n                                                <div style=\"cursor:auto;color:#222228;font-family:'Avenir Next', Avenir, sans-serif;font-size:13px;line-height:20px;\">\r\n                                                    You’re receiving this email because you have an account in Online Test.\r\n                                                    If you are not sure why you’re receiving this, please contact us.\r\n                                                </div>\r\n                                            </td>\r\n                                        </tr>\r\n                                    </tbody>\r\n                                </table>\r\n                            </div>\r\n                            <!--[if mso | IE]>\r\n                            </td></tr></table>\r\n                            <![endif]-->\r\n                        </td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n        </div>\r\n        <!--[if mso | IE]>\r\n        </td></tr></table>\r\n        <![endif]-->\r\n        <!--[if mso | IE]>\r\n        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" align=\"center\" style=\"width:600px;\">\r\n          <tr>\r\n            <td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\">\r\n        <![endif]-->\r\n        <div></div>\r\n        <!--[if mso | IE]>\r\n        </td></tr></table>\r\n        <![endif]-->\r\n    </div>\r\n    <img src=\"https://mandrillapp.com/track/open.php?u=9812467&amp;id=bca57efeee894396adad890ad5feefe1\" height=\"1\" width=\"1\">\r\n\r\n\r\n</body>",
					"text/html; charset=utf-8");

			Transport.send(message);

			System.out.println("Successfully sent Verification Link");

		} catch (Exception e) {
			System.out.println("Error at SendingEmail.java: " + e);
		}

	}

	public void Changepasswordbymail(Account account, String hash) {

		String email = MyConstants.MY_EMAIL;
		String password = MyConstants.MY_PASSWORD;

		Properties theProperties = new Properties();

		theProperties.put("mail.smtp.auth", "true");
		theProperties.put("mail.smtp.starttls.enable", "true");
		theProperties.put("mail.smtp.host", "smtp.gmail.com");
		theProperties.put("mail.smtp.port", "587");

		Session session = Session.getInstance(theProperties, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(email, password);
			}
		});

		try {

			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(email));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(account.getEmail()));
			message.setSubject("Email Verification Link");
			message.setContent(
					"<head>\r\n    <title>Hello</title>\r\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n    <style type=\"text/css\">\r\n        #outlook a {\r\n            padding: 0;\r\n        }\r\n\r\n        .ReadMsgBody {\r\n            width: 100%;\r\n        }\r\n\r\n        .ExternalClass {\r\n            width: 100%;\r\n        }\r\n\r\n            .ExternalClass * {\r\n                line-height: 100%;\r\n            }\r\n\r\n        body {\r\n            margin: 0;\r\n            padding: 0;\r\n            -webkit-text-size-adjust: 100%;\r\n            -ms-text-size-adjust: 100%;\r\n        }\r\n\r\n        table, td {\r\n            border-collapse: collapse;\r\n            mso-table-lspace: 0pt;\r\n            mso-table-rspace: 0pt;\r\n        }\r\n\r\n        img {\r\n            border: 0;\r\n            height: auto;\r\n            line-height: 100%;\r\n            outline: none;\r\n            text-decoration: none;\r\n            -ms-interpolation-mode: bicubic;\r\n        }\r\n\r\n        p {\r\n            display: block;\r\n            margin: 13px 0;\r\n        }\r\n    </style>\r\n    <!--[if !mso]><!-->\r\n    <style type=\"text/css\">\r\n  @media only screen and (max-width:480px) {\r\n    @-ms-viewport { width:320px; }\r\n    @viewport { width:320px; }\r\n  }\r\n    </style>\r\n    <!--<![endif]-->\r\n    <!--[if mso]>\r\n    <xml>\r\n      <o:OfficeDocumentSettings>\r\n        <o:AllowPNG/>\r\n        <o:PixelsPerInch>96</o:PixelsPerInch>\r\n      </o:OfficeDocumentSettings>\r\n    </xml>\r\n    <![endif]-->\r\n    <style type=\"text/css\">\r\n  @media only screen and (min-width:480px) {\r\n    .mj-column-per-100, * [aria-labelledby=\"mj-column-per-100\"] { width:100%!important; }\r\n.mj-column-per-80, * [aria-labelledby=\"mj-column-per-80\"] { width:80%!important; }\r\n.mj-column-per-30, * [aria-labelledby=\"mj-column-per-30\"] { width:30%!important; }\r\n.mj-column-per-70, * [aria-labelledby=\"mj-column-per-70\"] { width:70%!important; }\r\n  }\r\n    </style>\r\n</head>\r\n<body style=\"background: #E3E5E7;\">\r\n    <div style=\"background-color:#E3E5E7;\">\r\n        <!--[if mso | IE]>\r\n        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" align=\"center\" style=\"width:600px;\">\r\n          <tr>\r\n            <td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\">\r\n        <![endif]-->\r\n        <div style=\"margin:0 auto;max-width:600px;background:white;\">\r\n            <table cellpadding=\"0\" cellspacing=\"0\" style=\"font-size:0px;width:100%;background:white;\" align=\"center\" border=\"0\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td style=\"text-align:center;vertical-align:top;font-size:0px;padding:20px 0px;\">\r\n                            <!--[if mso | IE]>\r\n                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td style=\"vertical-align:top;width:600px;\">\r\n                            <![endif]-->\r\n                            <div aria-labelledby=\"mj-column-per-100\" class=\"mj-column-per-100\" style=\"vertical-align:top;display:inline-block;font-size:13px;text-align:left;width:100%;\"><table cellpadding=\"0\" cellspacing=\"0\" style=\"vertical-align:top;\" width=\"100%\" border=\"0\"><tbody><tr><td style=\"word-break:break-word;font-size:0px;padding:10px 25px;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse:collapse;border-spacing:0px;\" align=\"center\" border=\"0\"><tbody><tr><td style=\"width:80px;\"></td></tr></tbody></table></td></tr></tbody></table></div>\r\n                            <!--[if mso | IE]>\r\n                            </td></tr></table>\r\n                            <![endif]-->\r\n                        </td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n        </div>\r\n        <!--[if mso | IE]>\r\n        </td></tr></table>\r\n        <![endif]-->\r\n        <!--[if mso | IE]>\r\n        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" align=\"center\" style=\"width:600px;\">\r\n          <tr>\r\n            <td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\">\r\n        <![endif]-->\r\n        <div style=\"margin:0 auto;max-width:600px;background:#222228;\">\r\n            <table cellpadding=\"0\" cellspacing=\"0\" style=\"font-size:0px;width:100%;background:#222228;\" align=\"center\" border=\"0\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td style=\"text-align:center;vertical-align:top;font-size:0px;padding:20px 0px;\">\r\n                            <!--[if mso | IE]>\r\n                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td style=\"vertical-align:top;width:480px;\">\r\n                            <![endif]-->\r\n                            <div aria-labelledby=\"mj-column-per-80\" class=\"mj-column-per-80\" style=\"vertical-align:top;display:inline-block;font-size:13px;text-align:left;width:100%;\">\r\n                                <table cellpadding=\"0\" cellspacing=\"0\" style=\"vertical-align:top;\" width=\"100%\" border=\"0\">\r\n                                    <tbody>\r\n                                        <tr><td style=\"word-break:break-word;font-size:0px;padding:10px 25px;padding-top:30px;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse:collapse;border-spacing:0px;\" align=\"center\" border=\"0\"><tbody><tr><td style=\"width:80px;\"><img alt=\"Zero To Launch\" title=\"\" height=\"auto\" src=\"https://cdn.auth0.com/website/emails/product/top-verify.png\" style=\"border:none;border-radius:;display:block;outline:none;text-decoration:none;width:100%;height:auto;\" width=\"80\"></td></tr></tbody></table></td></tr>\r\n                                        <tr>\r\n                                            <td style=\"word-break:break-word;font-size:0px;padding:0px 20px 0px 20px;\" align=\"center\">\r\n                                                <div style=\"cursor:auto;color:white;font-family:'Avenir Next', Avenir, sans-serif;font-size:32px;line-height:60ps;\">\r\n                                                    Change your password!\r\n                                                </div>\r\n                                            </td>\r\n                                        </tr>\r\n                                    </tbody>\r\n                                </table>\r\n                            </div>\r\n                            <!--[if mso | IE]>\r\n                            </td></tr></table>\r\n                            <![endif]-->\r\n                        </td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n        </div>\r\n        <!--[if mso | IE]>\r\n        </td></tr></table>\r\n        <![endif]-->\r\n        <!--[if mso | IE]>\r\n        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" align=\"center\" style=\"width:600px;\">\r\n          <tr>\r\n            <td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\">\r\n        <![endif]-->\r\n        <div style=\"margin:0 auto;max-width:600px;background:white;\">\r\n            <table cellpadding=\"0\" cellspacing=\"0\" style=\"font-size:0px;width:100%;background:white;\" align=\"center\" border=\"0\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td style=\"text-align:center;vertical-align:top;font-size:0px;padding:40px 25px 0px;\">\r\n                            <!--[if mso | IE]>\r\n                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td style=\"vertical-align:top;width:600px;\">\r\n                            <![endif]-->\r\n                            <div aria-labelledby=\"mj-column-per-100\" class=\"mj-column-per-100\" style=\"vertical-align:top;display:inline-block;font-size:13px;text-align:left;width:100%;\">\r\n                                <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\r\n                                    <tbody>\r\n                                        <tr>\r\n                                            <td style=\"word-break:break-word;font-size:0px;padding:0px 0px 25px;\" align=\"left\">\r\n                                                <div style=\"cursor:auto;color:#222228;font-family:'Avenir Next', Avenir, sans-serif;font-size:18px;font-weight:500;line-height:30px;\">\r\n                                                    Your account information\r\n                                                </div>\r\n                                            </td>\r\n                                        </tr>\r\n                                    </tbody>\r\n                                </table>\r\n                            </div>\r\n                            <!--[if mso | IE]>\r\n                            </td><td style=\"vertical-align:top;width:180px;\">\r\n                            <![endif]-->\r\n                            <div aria-labelledby=\"mj-column-per-30\" class=\"mj-column-per-30\" style=\"vertical-align:top;display:inline-block;font-size:13px;text-align:left;width:100%;\">\r\n                                <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\r\n                                    <tbody>\r\n                                        <tr>\r\n                                            <td style=\"word-break:break-word;font-size:0px;padding:0px 0px 10px;\" align=\"left\">\r\n                                                <div style=\"cursor:auto;color:#222228;font-family:'Avenir Next', Avenir, sans-serif;font-size:16px;line-height:30px;\">\r\n                                                    <strong style=\"font-weight: 500; white-space: nowrap;\">Account</strong>\r\n                                                </div>\r\n                                            </td>\r\n                                        </tr>\r\n                                    </tbody>\r\n                                </table>\r\n                            </div>\r\n                            <!--[if mso | IE]>\r\n                            </td><td style=\"vertical-align:top;width:420px;\">\r\n                            <![endif]-->\r\n                            <div aria-labelledby=\"mj-column-per-70\" class=\"mj-column-per-70\" style=\"vertical-align:top;display:inline-block;font-size:13px;text-align:left;width:100%;\">\r\n                                <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\r\n                                    <tbody>\r\n                                        <tr>\r\n                                            <td style=\"word-break:break-word;font-size:0px;padding:0px 0px 10px;\" align=\"left\">\r\n                                                <div style=\"cursor:auto;color:#222228;font-family:'Avenir Next', Avenir, sans-serif;font-size:16px;line-height:30px;\">\r\n                                                    "
							+ account.getFullname()
							+ "\r\n                                                </div>\r\n                                            </td>\r\n                                        </tr>\r\n                                    </tbody>\r\n                                </table>\r\n                            </div>\r\n                            <!--[if mso | IE]>\r\n                            </td><td style=\"vertical-align:top;width:180px;\">\r\n                            <![endif]-->\r\n                            <div aria-labelledby=\"mj-column-per-30\" class=\"mj-column-per-30\" style=\"vertical-align:top;display:inline-block;font-size:13px;text-align:left;width:100%;\">\r\n                                <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\r\n                                    <tbody>\r\n                                        <tr>\r\n                                            <td style=\"word-break:break-word;font-size:0px;padding:0px 0px 10px;\" align=\"left\">\r\n                                                <div style=\"cursor:auto;color:#222228;font-family:'Avenir Next', Avenir, sans-serif;font-size:16px;line-height:30px;\">\r\n                                                    <strong style=\"font-weight: 500; white-space: nowrap;\"></strong>\r\n                                                </div>\r\n                                            </td>\r\n                                        </tr>\r\n                                    </tbody>\r\n                                </table>\r\n                            </div>\r\n                            <!--[if mso | IE]>\r\n                            </td><td style=\"vertical-align:top;width:420px;\">\r\n                            <![endif]-->\r\n                            <div aria-labelledby=\"mj-column-per-70\" class=\"mj-column-per-70\" style=\"vertical-align:top;display:inline-block;font-size:13px;text-align:left;width:100%;\">\r\n                                <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\r\n                                    <tbody>\r\n                                        <tr>\r\n                                            <td style=\"word-break:break-word;font-size:0px;padding:0px 0px 25px;\" align=\"left\">\r\n                                                <div style=\"cursor:auto;color:#222228;font-family:'Avenir Next', Avenir, sans-serif;font-size:16px;line-height:30px;\">\r\n                                                    \r\n                                                </div>\r\n                                            </td>\r\n                                        </tr>\r\n                                    </tbody>\r\n                                </table>\r\n                            </div>\r\n                            <!--[if mso | IE]>\r\n                            </td></tr></table>\r\n                            <![endif]-->\r\n                        </td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n        </div>\r\n        <!--[if mso | IE]>\r\n        </td></tr></table>\r\n        <![endif]-->\r\n        <!--[if mso | IE]>\r\n        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" align=\"center\" style=\"width:600px;\">\r\n          <tr>\r\n            <td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\">\r\n        <![endif]-->\r\n        <div style=\"margin:0 auto;max-width:600px;background:white;\">\r\n            <table cellpadding=\"0\" cellspacing=\"0\" style=\"font-size:0px;width:100%;background:white;\" align=\"center\" border=\"0\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td style=\"text-align:center;vertical-align:top;font-size:0px;padding:0px 30px;\">\r\n                            <!--[if mso | IE]>\r\n                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td style=\"vertical-align:undefined;width:600px;\">\r\n                            <![endif]-->\r\n                            <p style=\"font-size:1px;margin:0 auto;border-top:1px solid #E3E5E7;width:100%;\"></p><!--[if mso | IE]><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"font-size:1px;margin:0 auto;border-top:1px solid #E3E5E7;width:100%;\" width=\"600\"><tr><td style=\"height:0;line-height:0;\"> </td></tr></table><![endif]-->\r\n                            <!--[if mso | IE]>\r\n                            </td></tr></table>\r\n                            <![endif]-->\r\n                        </td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n        </div>\r\n        <!--[if mso | IE]>\r\n        </td></tr></table>\r\n        <![endif]-->\r\n        <!--[if mso | IE]>\r\n        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" align=\"center\" style=\"width:600px;\">\r\n          <tr>\r\n            <td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\">\r\n        <![endif]-->\r\n        <div style=\"margin:0 auto;max-width:600px;background:white;\">\r\n            <table cellpadding=\"0\" cellspacing=\"0\" style=\"font-size:0px;width:100%;background:white;\" align=\"center\" border=\"0\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td style=\"text-align:center;vertical-align:top;font-size:0px;padding:20px 0px;\">\r\n                            <!--[if mso | IE]>\r\n                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td style=\"vertical-align:top;width:600px;\">\r\n                            <![endif]-->\r\n                            <div aria-labelledby=\"mj-column-per-100\" class=\"mj-column-per-100\" style=\"vertical-align:top;display:inline-block;font-size:13px;text-align:left;width:100%;\">\r\n                                <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\r\n                                    <tbody>\r\n                                        <tr>\r\n                                            <td style=\"word-break:break-word;font-size:0px;padding:10px 25px;\" align=\"center\">\r\n                                                <table cellpadding=\"0\" cellspacing=\"0\" align=\"center\" border=\"0\">\r\n                                                    <tbody>\r\n                                                        <tr>\r\n                                                            <td style=\"border-radius:3px;color:white;cursor:auto;\" align=\"center\" valign=\"middle\" bgcolor=\"#EB5424\">\r\n                                                                <a href=\""
							+ "http://localhost:9799/user/account/forgetpassword?key1=" + account.getUsername()
							+ "&key2=" + hash
							+ "\" style=\"display:inline-block;text-decoration:none;background:#EB5424;border-radius:3px;color:white;font-family:'Avenir Next', Avenir, sans-serif;font-size:14px;font-weight:500;line-height:35px;padding:10px 25px;margin:0px;\" target=\"_blank\">\r\n                                                                    Change Password\r\n                                                                </a>\r\n                                                            </td>\r\n                                                        </tr>\r\n                                                    </tbody>\r\n                                                </table>\r\n                                            </td>\r\n                                        </tr>\r\n                                    </tbody>\r\n                                </table>\r\n                            </div>\r\n                            <!--[if mso | IE]>\r\n                            </td></tr></table>\r\n                            <![endif]-->\r\n                        </td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n        </div>\r\n        <!--[if mso | IE]>\r\n        </td></tr></table>\r\n        <![endif]-->\r\n        <!--[if mso | IE]>\r\n        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" align=\"center\" style=\"width:600px;\">\r\n          <tr>\r\n            <td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\">\r\n        <![endif]-->\r\n        <div style=\"margin:0 auto;max-width:600px;background:white;\">\r\n            <table cellpadding=\"0\" cellspacing=\"0\" style=\"font-size:0px;width:100%;background:white;\" align=\"center\" border=\"0\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td style=\"text-align:center;vertical-align:top;font-size:0px;padding:20px 0px;\">\r\n                            <!--[if mso | IE]>\r\n                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td style=\"vertical-align:top;width:600px;\">\r\n                            <![endif]-->\r\n                            <div aria-labelledby=\"mj-column-per-100\" class=\"mj-column-per-100\" style=\"vertical-align:top;display:inline-block;font-size:13px;text-align:left;width:100%;\">\r\n                                <table cellpadding=\"0\" cellspacing=\"0\" style=\"vertical-align:top;\" width=\"100%\" border=\"0\">\r\n                                    <tbody>\r\n                                        <tr>\r\n                                            <td style=\"word-break:break-word;font-size:0px;padding:0px 25px 15px;\" align=\"left\">\r\n                                                <div style=\"cursor:auto;color:#222228;font-family:'Avenir Next', Avenir, sans-serif;font-size:16px;line-height:30px;\">\r\n                                                    If you are having any issues with your account, please don't hesitate to contact us by replying to this mail.\r\n                                                    <br>Thanks!\r\n                                                </div>\r\n                                            </td>\r\n                                        </tr>\r\n                                    </tbody>\r\n                                </table>\r\n                            </div>\r\n                            <!--[if mso | IE]>\r\n                            </td></tr></table>\r\n                            <![endif]-->\r\n                        </td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n        </div>\r\n        <!--[if mso | IE]>\r\n        </td></tr></table>\r\n        <![endif]-->\r\n        <!--[if mso | IE]>\r\n        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" align=\"center\" style=\"width:600px;\">\r\n          <tr>\r\n            <td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\">\r\n        <![endif]-->\r\n        <div style=\"margin:0 auto;max-width:600px;background:#F5F7F9;\">\r\n            <table cellpadding=\"0\" cellspacing=\"0\" style=\"font-size:0px;width:100%;background:#F5F7F9;\" align=\"center\" border=\"0\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td style=\"text-align:center;vertical-align:top;font-size:0px;padding:20px 0px;\">\r\n                            <!--[if mso | IE]>\r\n                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td style=\"vertical-align:top;width:600px;\">\r\n                            <![endif]-->\r\n                            <div aria-labelledby=\"mj-column-per-100\" class=\"mj-column-per-100\" style=\"vertical-align:top;display:inline-block;font-size:13px;text-align:left;width:100%;\">\r\n                                <table cellpadding=\"0\" cellspacing=\"0\" style=\"vertical-align:top;\" width=\"100%\" border=\"0\">\r\n                                    <tbody>\r\n                                        <tr>\r\n                                            <td style=\"word-break:break-word;font-size:0px;padding:0px 20px;\" align=\"center\">\r\n                                                <div style=\"cursor:auto;color:#222228;font-family:'Avenir Next', Avenir, sans-serif;font-size:13px;line-height:20px;\">\r\n                                                    You’re receiving this email because you have sent an changepassword request in Online Test.\r\n                                                    If you are not sure why you’re receiving this, please contact us.\r\n                                                </div>\r\n                                            </td>\r\n                                        </tr>\r\n                                    </tbody>\r\n                                </table>\r\n                            </div>\r\n                            <!--[if mso | IE]>\r\n                            </td></tr></table>\r\n                            <![endif]-->\r\n                        </td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n        </div>\r\n        <!--[if mso | IE]>\r\n        </td></tr></table>\r\n        <![endif]-->\r\n        <!--[if mso | IE]>\r\n        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" align=\"center\" style=\"width:600px;\">\r\n          <tr>\r\n            <td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\">\r\n        <![endif]-->\r\n        <div></div>\r\n        <!--[if mso | IE]>\r\n        </td></tr></table>\r\n        <![endif]-->\r\n    </div>\r\n    <img src=\"https://mandrillapp.com/track/open.php?u=9812467&amp;id=bca57efeee894396adad890ad5feefe1\" height=\"1\" width=\"1\">\r\n\r\n\r\n</body>",
					"text/html; charset=utf-8");

			Transport.send(message);

			System.out.println("Successfully sent Verification Link");

		} catch (Exception e) {
			System.out.println("Error at SendingEmail.java: " + e);
		}

	}

	@RequestMapping(value = { "login" }, method = RequestMethod.GET)
	public String login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, HttpServletRequest request,
			ModelMap modelMap) {
		HttpSession session = request.getSession();
		if (error != null) {
			session.setAttribute("msg", "<script>alert('Invalid')</script>");
		}
		if (logout != null) {
			session.setAttribute("msg", "<script>alert('Logout Successfully!')</script>");
		}

		return "redirect:/user/home/index";
	}

	@RequestMapping(value = { "process-login" }, method = RequestMethod.GET)
	public String login(@RequestParam("username") String username, @RequestParam("password") String Password) {

		Account account = accountService.findByUsername(username);
		if (account.isStatus()) {
			System.out.println(account.isStatus());
			return "user/account/process-login";
		}
		return "404/index";
	}

	@RequestMapping(value = "register", method = RequestMethod.GET)
	public String register(ModelMap modelMap) {

		Account account = new Account();
		account.setDob(new Date());
		modelMap.put("account", account);
		return "user/account/register";
	}

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder builder) throws Exception {
		builder.userDetailsService(accountService);
	}

	@RequestMapping(value = { "register" }, method = RequestMethod.POST)
	public String register(ModelMap modelMap, @RequestParam(value = "terms", required = false) boolean terms,
			@ModelAttribute("account") @Valid Account account, @RequestParam("role") int[] roles,
			@RequestParam(value = "file") MultipartFile file, @RequestParam("repassword") String repassword,
			RedirectAttributes redirectAttributes, BindingResult bindingResult, HttpServletRequest request) {
		accountValidator.validate(account, bindingResult);
		HttpSession session = request.getSession();
		if (bindingResult.hasErrors()) {
			session.setAttribute("msg", "<script>alert('Invalid!')</script>");
			
			return "redirect:/user/home/index";
		}
		if (terms) {
			if (account.getPassword().equalsIgnoreCase(repassword)) {
				try {
					String hash = new BCryptPasswordEncoder().encode(account.getPassword());
					account.setPassword(hash);
					String fileNameUpload = UploadHelper.upload(servletContext, file);
					redirectAttributes.addFlashAttribute("fileName", fileNameUpload);
					account.setAvatar(fileNameUpload);
					if (roles != null && roles.length > 0) {
						for (int role : roles) {
							account.getRoles().add(roleServiceUser.find(role));
						}
					}

					Date date;
					ZoneId defaultZoneId = ZoneId.systemDefault();
					LocalDate localDate = LocalDate.now();
					date = Date.from(localDate.atStartOfDay(defaultZoneId).toInstant());
					account.setCreateDate(date);
					String hash2 = new BCryptPasswordEncoder().encode(account.getEmail());
					sendMail(account, hash2);
					accountService.save(account);
					session.removeAttribute("msg");
					
					return "user/home/index";
				} catch (Exception e) {
					session.setAttribute("msg", "<script>alert('" + e.getMessage() + "')</script>");
					return "redirect:/user/home/index";
				}
			} else {
				session.setAttribute("msg", "Retype Password Is Not Correct! ");
				return "redirect:/user/home/index";
			}
		} else {
			session.setAttribute("msg", "Accept Our Term To Continue Signing Up! ");
			return "redirect:/user/home/index";
		}

	}

	@RequestMapping(value = "welcome", method = RequestMethod.GET)
	public String welcome(Authentication authentication, HttpServletRequest request, ModelMap modelMap) {
		HttpSession session = request.getSession();

		Account account = accountService.findByUsername(authentication.getName());
		if (account == null) {
			account = accountService.findByUsername((String) session.getAttribute("email"));
		}
		System.out.println(account.isStatus());
		if (account.isStatus()) {

//<<<<<<< HEAD
//			if (authentication.getAuthorities().toString().equalsIgnoreCase("[ROLE_ADMIN]")) {
//				session.setAttribute("account", accountService.findByUsername(authentication.getName()));
//				return "redirect:/admin/dashboard/index";
//			} else if (authentication.getAuthorities().toString().equalsIgnoreCase("[ROLE_USER_FACULTY]")) {
//				session.setAttribute("account", accountService.findByUsername(authentication.getName()));
//				return "redirect:/faculty/dashboard/index";
//			} else if (authentication.getAuthorities().toString().equalsIgnoreCase("[ROLE_USER_CANDIDATE]")) {
//				session.setAttribute("account", accountService.findByUsername(authentication.getName()));
//				session.setAttribute("counta", accountServiceUser.countAccountUser());
//
//				String referer = request.getHeader("Referer");
//				return "redirect:" + referer;
//			} else if (authentication.getAuthorities().toString().equalsIgnoreCase(
//					"[ROLE_USER, SCOPE_https://www.googleapis.com/auth/userinfo.email, SCOPE_https://www.googleapis.com/auth/userinfo.profile, SCOPE_openid]")) {
//				session.setAttribute("account", accountService.findByUsername((String) session.getAttribute("email")));
//				return "redirect:/user/home/index";
//			}
//=======
			if (authentication.getAuthorities().toString().equalsIgnoreCase("[ROLE_ADMIN]")) {
				session.setAttribute("account", accountService.findByUsername(authentication.getName()));
				return "redirect:/admin/dashboard/index";
			} else if (authentication.getAuthorities().toString().equalsIgnoreCase("[ROLE_USER_FACULTY]")) {
				session.setAttribute("account", accountService.findByUsername(authentication.getName()));
				// Check Pack Of Account
				Account account2 = (Account) session.getAttribute("account");
				Date now = new Date();
				boolean result = false;
				if (account2 == null) {
					result = false;
				} else if (account2.getAccountPacks().size() == 0 && account2 != null) {
					System.out.println("Khong co goi");
				} else {
					for (AccountPack accountPack : account2.getAccountPacks()) {
						int number = now.getDate() - accountPack.getStartDate().getDate();
						if (number >= accountPack.getPack().getExpiry()) {
							System.out.println("Het han");
							accountPack.setStatus(false);
							accountPackService.save(accountPack);
							result = false;
						} else {
							System.out.println("Con han");
							result = true;
						}
					}
				}
				session.removeAttribute("msg");
				modelMap.put("result", result);
				return "redirect:/faculty/dashboard/index";
			} else if (authentication.getAuthorities().toString().equalsIgnoreCase("[ROLE_USER_CANDIDATE]")) {
				session.setAttribute("account", accountService.findByUsername(authentication.getName()));
//				session.setAttribute("counta", accountServiceUser.countAccountUser());
				String referer = request.getHeader("Referer");

				// Check Pack Of Account
				Account account2 = (Account) session.getAttribute("account");
				Date now = new Date();
				boolean result = false;
				if (account2 == null) {
					result = false;
				} else if (account2.getAccountPacks().size() == 0 && account2 != null) {
					System.out.println("Khong co goi");
				} else {
					for (AccountPack accountPack : account2.getAccountPacks()) {
						int number = now.getDate() - accountPack.getStartDate().getDate();
						if (number >= accountPack.getPack().getExpiry()) {
							System.out.println("Het han");
							accountPack.setStatus(false);
							accountPackService.save(accountPack);
						} else if (accountPack.isStatus() == true) {
							session.setAttribute("result", "<h4 style='color: #ffbc00;'>PREMIUM</h4>");
							break;
						} else if (accountPack.isStatus() == false) {
							session.setAttribute("result", "<h4 style='color: green;'>FREE</h4>");
							break;
						}
					}
				}
				session.removeAttribute("msg");
				return "redirect:" + referer;
			} else if (authentication.getAuthorities().toString().equalsIgnoreCase(
					"[ROLE_USER, SCOPE_https://www.googleapis.com/auth/userinfo.email, SCOPE_https://www.googleapis.com/auth/userinfo.profile, SCOPE_openid]")) {
				session.setAttribute("account", accountService.findByUsername((String) session.getAttribute("email")));
				// Check Pack Of Account
				Account account2 = (Account) session.getAttribute("account");
				Date now = new Date();
				boolean result = false;
				if (account2 == null) {
					result = false;
				} else if (account2.getAccountPacks().size() == 0 && account2 != null) {
					System.out.println("Khong co goi");
				} else {
					for (AccountPack accountPack : account2.getAccountPacks()) {
						int number = now.getDate() - accountPack.getStartDate().getDate();
						if (number >= accountPack.getPack().getExpiry()) {
							System.out.println("Het han");
							accountPack.setStatus(false);
							accountPackService.save(accountPack);
							result = false;
						} else if (accountPack.isStatus() == true) {
							result = true;
							break;
						} else {
							System.out.println("Con han");

						}
					}
				}
				modelMap.put("result", result);
				session.removeAttribute("msg");
				return "redirect:/user/home/index";

			}
			session.setAttribute("msg", "<script>alert('Account not Activated! Please Check Your Mail!')</script>");
			return "redirect:/user/home/index";
		}
		return "404/index";
	}

	@RequestMapping(value = "accessDenied", method = RequestMethod.GET)
	public String accessDenied() {

		return "404/index";
	}

	@RequestMapping(value = "ActivateAccount", method = RequestMethod.GET)
	public String ActivateAccount(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Account account = accountService.findByUsername(request.getParameter("key1"));
		if (BCrypt.checkpw(account.getEmail(), request.getParameter("key2"))) {
			account.setStatus(true);
			accountService.save(account);
			session.setAttribute("msg", "<script>alert('Account activation successfully!')</script>");
			return "redirect:/user/home/index";
		} else {
			return "404/index";
		}

	}

	@RequestMapping(value = "forgetpassword", method = RequestMethod.POST)
	public String forgetpassword(@RequestParam("accountname") String name, @RequestParam("email") String email,
			@RequestParam("newpassword") String newpassword, ModelMap modelMap, HttpServletRequest request) {
		Account account = accountService.findByUsername(name);
		HttpSession session = request.getSession();
		if (!account.getEmail().equalsIgnoreCase(email)) {
			session.setAttribute("msg", "<script>alert('Wrong Email!')</script>");
			return "redirect:/user/home/index";
		} else {
			String hash2 = new BCryptPasswordEncoder().encode(newpassword);
			Changepasswordbymail(account, hash2);
			session.setAttribute("msg", "<script>alert('Please Check your email!')</script>");
			return "redirect:/user/home/index";
		}
	}

	@RequestMapping(value = "forgetpassword", method = RequestMethod.GET)
	public String forgetpassword(HttpServletRequest request, ModelMap modelMap) {
		Account account = accountService.findByUsername(request.getParameter("key1"));
		HttpSession session = request.getSession();
		session.setAttribute("msg", "<script>alert('Change password successfully!')</script>");
		account.setPassword(request.getParameter("key2"));
		accountService.save(account);

		return "redirect:/user/home/index";

	}

}