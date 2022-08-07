package com.techelevator.dao;

import com.techelevator.model.Pothole;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.ArrayList;
import java.util.List;

public class JdbcPotholeDao implements PotholeDao{

    private JdbcTemplate jdbcTemplate;
    public JdbcPotholeDao(JdbcTemplate jdbcTemplate){
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Pothole> retrievePotholes(){
        List<Pothole> potholes = new ArrayList<>();

        String sql = "SELECT ";

        return potholes;

    }

}
