package com.techelevator.dao;

import com.techelevator.model.Pothole;
import com.techelevator.model.Repair;

import java.util.List;

public interface PotholeDao {


    List<Pothole> retrievePotholes();
    void addPothole(Pothole pothole);
    void statusUpdate(Repair repair, int potholeId);
//    void deletePothole(int potholeId);
}
