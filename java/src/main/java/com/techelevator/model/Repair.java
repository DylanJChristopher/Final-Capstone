package com.techelevator.model;

import java.time.LocalDateTime;

public class Repair {
    private boolean status;
    private String repairDate;

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getRepairDate() {
        return repairDate;
    }

    public void setRepairDate(String repairDate) {
        this.repairDate = repairDate;
    }
}
