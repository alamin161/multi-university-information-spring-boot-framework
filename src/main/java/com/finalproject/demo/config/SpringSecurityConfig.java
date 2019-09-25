package com.finalproject.demo.config;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import javax.annotation.Resource;
import javax.sql.DataSource;

@Configuration
@EnableWebSecurity
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter {

    /*@Autowired
    DataSource dataSource; */

    @Resource
    private UserDetailsService userDetailsService;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().requireCsrfProtectionMatcher(new AntPathRequestMatcher("**/login"))
                .and().authorizeRequests().antMatchers("/dashboard").hasRole("ADMIN")
                .and().authorizeRequests().antMatchers("/showAllUser").hasRole("ADMIN")
                .and().authorizeRequests().antMatchers("/home").authenticated()
                .and().authorizeRequests().antMatchers("/home1").authenticated()
                .and().authorizeRequests().antMatchers("/index").authenticated()
                .and().authorizeRequests().antMatchers("/userregistration").permitAll()
                .and().authorizeRequests().antMatchers("/createproject").authenticated()

                .and().authorizeRequests().antMatchers("/test").authenticated()





                /*--------Basic Form Area Start--------*/

                /*Teacher Form Start*/
                .and().authorizeRequests().antMatchers("/teacher").hasRole("ADMIN")
                /*Teacher Form End*/

                /*University Type Area Start*/
                .and().authorizeRequests().antMatchers("/university-type").hasRole("ADMIN")
                /*University Type Area End*/

                /*University Area Start*/
                .and().authorizeRequests().antMatchers("/university").hasRole("ADMIN")
                /*University Area End*/

                /*Achievement Area Start*/
                .and().authorizeRequests().antMatchers("/achievement").hasRole("ADMIN")
                /*Achievement Area End*/

                /*Research Area Start*/
                .and().authorizeRequests().antMatchers("/research").hasRole("ADMIN")
                /*Research Area End*/

                /*--------Basic Form Area End--------*/

                .and().authorizeRequests().antMatchers("/view-university-name-by-university-type").authenticated()

                .and().authorizeRequests().antMatchers("/saveUser").permitAll()
                .and().formLogin().defaultSuccessUrl("/home").loginPage("/login").permitAll()
                .and().logout().logoutRequestMatcher(new AntPathRequestMatcher("/logout")).logoutSuccessUrl("/login");

        http.exceptionHandling().accessDeniedPage("/403");
    }

    @Bean
    public PasswordEncoder passwordEncoder(){
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        return passwordEncoder;
    }

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
    }

    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/*.css");
        web.ignoring().antMatchers("/*.js");
    }
}
