/** 
 * @Description:  
 * 
 * @Title: QuartzJob.java 
 * @Package com.joyce.quartz 
 * @Copyright: Copyright (c) 2014 
 * 
 * @author Comsys-LZP 
 * @date 2014-6-26 下午03:37:11 
 * @version V2.0 
 */
package com.hup.service;
  
import java.text.SimpleDateFormat;  
import java.util.Date;  
  
import org.quartz.Job;
import org.quartz.JobDetail;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;  
  
/** 
 * @Description: 任务执行类 
 * 
 * @ClassName: QuartzJob 
 * @Copyright: Copyright (c) 2014 
 * 
 * @author Comsys-LZP 
 * @date 2014-6-26 下午03:37:11 
 * @version V2.0 
 */  
public class QuartzJob implements Job {  
  
    @Override  
    public void execute(JobExecutionContext arg0) throws JobExecutionException {
        JobDetail jobDetail = arg0.getJobDetail();
        String name = jobDetail.getName();
        System.out.println(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())+ "★★★★★★★★★★★ - " + name);
    }  
}  