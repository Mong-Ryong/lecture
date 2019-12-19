package com.qf.mapper;

import com.qf.base.BaseMapper;
import com.qf.pojo.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserMapper extends BaseMapper<User> {

    List<User> selectPageData();
}
