package com.emix.dubai.business.entity.quartz;

import javax.persistence.Embeddable;
import java.io.Serializable;

/**
 * @author niko
 */
@Embeddable
public class JobDetailPK implements Serializable {
    private String jobName;
    private String jobGroup;

    public String getJobName() {
        return jobName;
    }

    public void setJobName(String jobName) {
        this.jobName = jobName;
    }

    public String getJobGroup() {
        return jobGroup;
    }

    public void setJobGroup(String jobGroup) {
        this.jobGroup = jobGroup;
    }


}
