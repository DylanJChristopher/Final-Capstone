package com.techelevator.model;

import java.time.LocalDateTime;

public class Repair {
    private boolean status;
    private LocalDateTime repairDate;

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public LocalDateTime getRepairDate() {
        return repairDate;
    }

    public void setRepairDate(LocalDateTime repairDate) {
        this.repairDate = repairDate;
    }
}
