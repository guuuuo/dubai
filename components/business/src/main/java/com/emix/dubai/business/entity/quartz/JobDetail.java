package com.emix.dubai.business.entity.quartz;

import javax.persistence.*;

/**
 * @author niko
 */
@javax.persistence.Entity
@Table(name = "QRTZ_JOB_DETAILS")
public class JobDetail {
    @Id
    private JobDetailPK jobDetailPK;
    private String description;
    private String jobClassName;
    private boolean isDurable;
    private boolean isVolatile;
    private boolean isStateful;
    private boolean requestsRecovery;
    @Lob
    @Basic(fetch = FetchType.LAZY)
    private byte[] jobData;

    public JobDetailPK getJobDetailPK() {
        return jobDetailPK;
    }

    public void setJobDetailPK(JobDetailPK jobDetailPK) {
        this.jobDetailPK = jobDetailPK;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getJobClassName() {
        return jobClassName;
    }

    public void setJobClassName(String jobClassName) {
        this.jobClassName = jobClassName;
    }

    public boolean isDurable() {
        return isDurable;
    }

    public void setDurable(boolean durable) {
        isDurable = durable;
    }

    public boolean isVolatile() {
        return isVolatile;
    }

    public void setVolatile(boolean aVolatile) {
        isVolatile = aVolatile;
    }

    public boolean isStateful() {
        return isStateful;
    }

    public void setStateful(boolean stateful) {
        isStateful = stateful;
    }

    public boolean isRequestsRecovery() {
        return requestsRecovery;
    }

    public void setRequestsRecovery(boolean requestsRecovery) {
        this.requestsRecovery = requestsRecovery;
    }

    public byte[] getJobData() {
        return jobData;
    }

    public void setJobData(byte[] jobData) {
        this.jobData = jobData;
    }
}
