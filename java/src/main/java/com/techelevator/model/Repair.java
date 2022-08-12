package com.techelevator.model;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class Repair {
    private String status;
    private LocalDate repairDate;

    public String getStatus() {
        return status;
    }

    public void setStatus(String  status) {
        this.status = status;
    }

    public LocalDate getRepairDate() {
        return repairDate;
    }

    public void setRepairDate(LocalDate repairDate) {
        this.repairDate = repairDate;
    }
}
