package com.hup.dao;

import com.hup.db.Pager;
import com.hup.entity.JobQuartz;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-21
 * Time: 10:10
 */
public interface JobQuartzDao {

    List<JobQuartz> getQuartzJobByStatus(String status);

    List<JobQuartz> queryJobQuartzList(@Param("jobQuartz") JobQuartz jobQuartz, @Param("pager") Pager<JobQuartz> pager);

    int getJobQuartzCount(@Param("jobQuartz") JobQuartz jobQuartz);

    int deleteJobQuartzByType(@Param("jobType") String jobType);

    int insertJobQuartz(@Param("jobQuartz") JobQuartz jobQuartz);

    JobQuartz findOne(Long id);

    int updateStatus(@Param("jobQuartz") JobQuartz jobQuartz);

    JobQuartz findOneByJobName(String jobName);

    int deleteJobQuartz(Long id);



}
