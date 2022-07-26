package com.mvc.helper;

//import com.mvc.service.UserService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.security.web.context.SecurityContextPersistenceFilter;
//import org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter;

//
//import com.spring4.services.AccServ;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//

//@EnableWebSecurity
//@Configuration
public class SecurityConfig{
//        extends WebSecurityConfigurerAdapter {
//    @Autowired
//    UserService accServ;
//
//    @Override
//    protected void configure(HttpSecurity http) throws Exception {
//                    //.hasAnyRole("USER")
//            http.cors().and().csrf().disable();
//            http.authorizeHttpRequests()
//                    .antMatchers("/index").permitAll()
//                    .antMatchers("/admin/**").hasAnyRole("ADMIN")
//                    .antMatchers("/user/**").permitAll()
//                    .and().formLogin().loginPage("/admin/login")
//                    .loginProcessingUrl("/acc/process")
//                    .usernameParameter("uname")
//                    .passwordParameter("pass")
//                    .defaultSuccessUrl("/user/")
//                    .failureUrl("/acc?error")
//                    .and()
//                    .logout().logoutUrl("/admin/logout")
//                    .logoutSuccessUrl("/admin/")
//                    .and()
//                    .exceptionHandling().accessDeniedPage("/acc/denied")
//            ;
//    }
//    @Bean
//    public BCryptPasswordEncoder encoder(){
//    return new BCryptPasswordEncoder();
//    }
//
//    @Autowired
//    public void customConfigGlobal(AuthenticationManagerBuilder builder) throws Exception{
//        builder.userDetailsService(accServ);
//    }
//
//    @Bean
//    public SecurityContextHolderAwareRequestFilter requestFilter(){
//        return new SecurityContextHolderAwareRequestFilter();
//    }
//
//    @Bean
//    public SecurityContextPersistenceFilter persistenceFilter(){
//        return new SecurityContextPersistenceFilter();
//    }
}
