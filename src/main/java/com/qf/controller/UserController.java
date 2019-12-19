package com.qf.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.qf.mapper.UserMapper;
import com.qf.pojo.User;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.awt.print.Pageable;
import java.util.List;

@RequestMapping("/users")
@RestController
@CrossOrigin(origins = "*")
public class UserController {

    @Resource
    private UserMapper userMapper;

    @RequestMapping
    public Object getPageUser(
            @RequestParam(required = false, defaultValue = "1") Integer page,
            @RequestParam(required = false, defaultValue = "10") Integer size) {

        PageHelper.startPage(page, size);
        List<User> list = userMapper.selectPageData();
        PageInfo<User> pageInfo = new PageInfo<>(list);

        return pageInfo;
    }
}
