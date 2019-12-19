package com.qf.mapper;

import com.fasterxml.jackson.databind.ser.Serializers;
import com.qf.base.BaseMapper;
import com.qf.pojo.Company;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.bind.annotation.RequestParam;

@Mapper
public interface CompanyMapper extends BaseMapper<Company> {

}
