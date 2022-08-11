package com.techelevator.controller;

import com.techelevator.dao.PotholeDao;
import com.techelevator.model.Pothole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController
@CrossOrigin
public class PotholeController {

    @Autowired
    private PotholeDao potholeDao;

    @RequestMapping(path = "/pothole", method = RequestMethod.GET)
    public List<Pothole> retrievePotholes() {

        return potholeDao.retrievePotholes();
    }
    @RequestMapping(path = "/pothole",method =RequestMethod.POST )
    public void reportPothole(@Valid @RequestBody Pothole pothole){
        potholeDao.addPothole(pothole);
    }

    @ResponseStatus(HttpStatus.NO_CONTENT)
    @RequestMapping(path = "/pothole/{id}",method =RequestMethod.DELETE )
    public void deletePothole(@PathVariable int potholeId) {
        potholeDao.deletePothole(potholeId);
    }

}
