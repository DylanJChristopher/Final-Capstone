package com.techelevator.model;

import java.time.LocalDateTime;

public class Repair {
    private String status;
    private LocalDateTime repairDate;

    public String isStatus() {
        return status;
    }

    public void setStatus(String  status) {
        this.status = status;
    }

    public LocalDateTime getRepairDate() {
        return repairDate;
    }

    public void setRepairDate(LocalDateTime repairDate) {
        this.repairDate = repairDate;
    }
}
