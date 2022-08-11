package com.techelevator.dao;

import com.techelevator.model.Pothole;

import java.util.List;

public interface PotholeDao {


    List<Pothole> retrievePotholes();
    void addPothole(Pothole pothole);
    Pothole statusUpdate(Pothole pothole, int potholeId);
//    void deletePothole(int potholeId);
}
