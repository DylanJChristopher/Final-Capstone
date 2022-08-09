package com.techelevator.dao;

import com.techelevator.model.Address;
import com.techelevator.model.Pothole;
import com.techelevator.model.Repair;
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

        String sql = "SELECT pothole.*, address.*, repair.* " +
                "FROM pothole " +
                "JOIN address ON pothole.address_id = address.address_id " +
                "JOIN repair ON pothole.pothole_id = repair.pothole_id";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);


        while(results.next()) {

            Pothole pothole = mapRowToPothole(results);
            potholes.add(pothole);
        }

        return potholes;

    }

    public  void addPothole(Pothole pothole){

        String potholeSql ="INSERT INTO pothole (direction, address_id, severity, discovery_date, description) " +
        "VALUES (?, (SELECT address_id FROM address WHERE street_name = ?), ?, ?, ?)";

        String addressSql = "INSERT INTO address (street_number, street_name, city, state_abbreviation, zipcode) " +
                "VALUES ( ?,?,?,?,?)";
        String repairSql = "INSERT INTO repair (pothole_id, status) "+
                "VALUES ((SELECT pothole_id FROM pothole WHERE discovery_date = ?), false)";
        jdbcTemplate.update(addressSql,pothole.getAddress().getStreetNumber(), pothole.getAddress().getStreetName(), pothole.getAddress().getCity(), pothole.getAddress().getState(), pothole.getAddress().getZipCode());

        jdbcTemplate.update(potholeSql,pothole.getDirection(), pothole.getAddress().getStreetName(), pothole.getSeverity(),pothole.getDiscoveryDate(),pothole.getDescription());
        jdbcTemplate.update(repairSql, pothole.getDiscoveryDate());

    }

    private Pothole mapRowToPothole(SqlRowSet results) {
        Pothole pothole = new Pothole();

        pothole.setPotholeId(results.getInt("pothole_id"));
        pothole.setDirection(results.getString("direction"));
        pothole.setSeverity(results.getInt("severity"));
        pothole.setDiscoveryDate(results.getTimestamp("discovery_date").toLocalDateTime());
        pothole.setDescription(results.getString("description"));



        pothole.setAddress(mapRowTAddress(results));
        pothole.setRepair(mapRowToRepair(results));

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
    private Repair mapRowToRepair(SqlRowSet results){

        Repair repair = new Repair();

        repair.setStatus(results.getBoolean("status"));
        if (results.getTimestamp("repair_date") != null) {
            repair.setRepairDate(results.getTimestamp("repair_date").toLocalDateTime());
        }
        else {
            repair.setRepairDate(null);
        }
        return repair;


    }


}
