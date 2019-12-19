package com.qf.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.qf.mapper.UserMapper;
import com.qf.pojo.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping("/user")
@RestController
@CrossOrigin(origins = "*")
public class UserController {

    private static Logger logger = LoggerFactory.getLogger(UserController.class);

    @Resource
    private UserMapper userMapper;

    @GetMapping
    public Object getPageUser(
            @RequestParam(required = false, defaultValue = "1") Integer page,
            @RequestParam(required = false, defaultValue = "10") Integer size) {

        PageHelper.startPage(page, size);
        List<User> list = userMapper.selectPageData();
        PageInfo<User> pageInfo = new PageInfo<>(list);

        return pageInfo;
    }

    @PostMapping
    public Object addUser(@RequestBody User user) {
        Map<String, Object> map = new HashMap<>();
        try{
            user.setCreatetime(new Date());
            user.setUpdatetime(new Date());
            userMapper.insert(user);
            map.put("code", 1);
            map.put("msg", "添加成功");
        }catch (Exception ex) {
            logger.error(ex.getMessage());
            map.put("code", -1);
            map.put("msg", "添加失败");
        }
        return map;
    }

    @RequestMapping(value="/{id}", method = RequestMethod.DELETE)
    public Object delete(@PathVariable("id") Integer id) {
        Map<String, Object> map = new HashMap<>();
        try{
            userMapper.deleteByIds(id + "");
            map.put("code", 1);
            map.put("msg", "删除成功");
        }catch (Exception ex) {
            logger.error(ex.getMessage());
            map.put("code", -1);
            map.put("msg", "删除失败");
        }
        return map;
    }
}
