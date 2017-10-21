package com.hup.service;

import com.hup.api.job.JobQuartzService;
import com.hup.dao.JobQuartzDao;
import com.hup.db.Pager;
import com.hup.entity.JobQuartz;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-21
 * Time: 10:03
 */
@Service
public class JobQuartzServiceImpl implements JobQuartzService {

    @Autowired
    private JobQuartzDao jobQuartzDao;

    @Override
    public Pager<JobQuartz> queryJobQuartzList(JobQuartz jobQuartz, Pager<JobQuartz> pager) {
        if (pager == null) {
            pager = new Pager<>();
        }
        pager.setOrderColumns("id"); //时间倒序查询
        List<JobQuartz> jobQuartzList = jobQuartzDao.queryJobQuartzList(jobQuartz, pager);
        int jobQuartzCount = jobQuartzDao.getJobQuartzCount(jobQuartz);
        pager.setList(jobQuartzList);
        pager.setTotalCount(jobQuartzCount);
        return pager;

    }

    @Override
    public int deleteJobQuartzByType(String jobType) {
        int delete = jobQuartzDao.deleteJobQuartzByType(jobType);
        return delete;
    }

    @Override
    public int insertJobQuartz(JobQuartz quartz) {
        int insert = jobQuartzDao.insertJobQuartz(quartz);
        return insert;
    }

    @Override
    public JobQuartz findOne(Long id) {
        return jobQuartzDao.findOne(id);
    }

    @Override
    public int updateStatus(JobQuartz quartz) {
        return jobQuartzDao.updateStatus(quartz);
    }

    @Override
    public JobQuartz findOneByJobName(String jobName) {
        return jobQuartzDao.findOneByJobName(jobName);
    }

    @Override
    public int deleteJobQuartz(Long id) {
        //关闭定时任务
        JobQuartz one = jobQuartzDao.findOne(id);
        if (one != null) {
            QuartzManager.removeJob(one.getJobName());
        }
        //删除任务列表记录
        int delete = jobQuartzDao.deleteJobQuartz(id);
        return delete;
    }
}
