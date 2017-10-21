package com.hup.api.job;

import com.hup.db.Pager;
import com.hup.entity.JobQuartz; /**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-21
 * Time: 10:03
 */
public interface JobQuartzService {

    Pager<JobQuartz> queryJobQuartzList(JobQuartz jobQuartz, Pager<JobQuartz> pager);

    int deleteJobQuartzByType(String jobType);

    int insertJobQuartz(JobQuartz quartz);

    JobQuartz findOne(Long id);

    int updateStatus(JobQuartz quartz);

    JobQuartz findOneByJobName(String jobName);

    int deleteJobQuartz(Long id);
}
