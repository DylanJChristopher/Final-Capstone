package com.techelevator.dao;

import com.techelevator.model.Address;
import com.techelevator.model.Pothole;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcPotholeDao implements PotholeDao{

    private JdbcTemplate jdbcTemplate;
    public JdbcPotholeDao(JdbcTemplate jdbcTemplate){
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Pothole> retrievePotholes(){
        List<Pothole> potholes = new ArrayList<>();

        String sql = "SELECT pothole.*, address.* " +
                "FROM pothole " +
                "JOIN address ON pothole.address_id = address.address_id";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);


        while(results.next()) {

            Pothole pothole = mapRowToPothole(results);
            potholes.add(pothole);
        }

        return potholes;

    }

    private Pothole mapRowToPothole(SqlRowSet results) {
        Pothole pothole = new Pothole();

        pothole.setPotholeId(results.getInt("pothole_id"));
        pothole.setDirection(results.getString("direction"));
        pothole.setSeverity(results.getInt("severity"));
        pothole.setDiscoveryDate(results.getTimestamp("discovery_date").toLocalDateTime());
        pothole.setDescription(results.getString("description"));



        pothole.setAddress(mapRowTAddress(results));

        return pothole;
    }

    private Address mapRowTAddress(SqlRowSet results){

        Address address = new Address();

        address.setStreetName(results.getString("street_name"));
        address.setCity(results.getString("city"));
        address.setState(results.getString("state_abbreviation"));
        address.setStreetNumber(results.getInt("street_number"));
        address.setZipCode(results.getInt("zipcode"));

        return address;


    }


}
