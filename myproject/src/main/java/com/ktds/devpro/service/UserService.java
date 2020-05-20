package com.ktds.devpro.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.ktds.devpro.model.mapper.MemberMapper;
import com.ktds.devpro.model.vo.Member;
 
 
@Service
public class UserService implements UserDetailsService {
    @Autowired
    private MemberMapper map;
 
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Member user = map.selectUserById(username);
        System.out.println(user);
        if(null == user) {
            throw new UsernameNotFoundException("User Not Found");
        }
        user.setPassword("{noop}1596");
        
        return user;
    }
    
}
 
