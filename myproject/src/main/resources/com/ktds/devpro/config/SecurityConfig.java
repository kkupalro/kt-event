package info.thecodinglive.member.config;

import info.thecodinglive.member.service.MemberAccessDeniedHandler;
import info.thecodinglive.member.service.MyUserService;
import info.thecodinglive.member.service.RememberMeTokenService;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import java.util.EnumSet;

@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter{


    @Override
	public void configure(WebSecurity web) throws Exception
	{
		// static 디렉터리의 하위 파일 목록은 인증 무시 ( = 항상통과 )
		web.ignoring().antMatchers("/css/**", "/js/**", "/img/**", "/lib/**");
	}
}
