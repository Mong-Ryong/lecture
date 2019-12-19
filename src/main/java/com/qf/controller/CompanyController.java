package com.qf.controller;

import com.qf.mapper.CompanyMapper;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import javax.annotation.Resource;

@RequestMapping("/company")
@RestController
@CrossOrigin(origins = "*")
public class CompanyController {

    @Resource
    private CompanyMapper companyMapper;

    @RequestMapping
    public Object getAll() {
        return companyMapper.selectAll();
    }
}
