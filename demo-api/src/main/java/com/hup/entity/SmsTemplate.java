package com.hup.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-06
 * Time: 9:55
 */
public class SmsTemplate {

    private Long id;
    private String code;   //模板编码
    private String content;       //模板内容
    private Date createDate;

    public SmsTemplate(Long id, String code, String content, Date createDate) {
        this.id = id;
        this.code = code;
        this.content = content;
        this.createDate = createDate;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }


    public static List<SmsTemplate> getAllSmsTemplate(){
        List<SmsTemplate> templates = new ArrayList<>();
        templates.add(new SmsTemplate(1L, "code-1", "你的验证码是：{code}, 请在10分钟内进行操作，逾期无效！", new Date()));
        templates.add(new SmsTemplate(2L, "code-2", "你的验证码是：{code}, 请在10分钟内进行操作，逾期无效！", new Date()));
        templates.add(new SmsTemplate(3L, "code-3", "你的验证码是：{code}, 请在10分钟内进行操作，逾期无效！", new Date()));
        templates.add(new SmsTemplate(4L, "code-4", "你的验证码是：{code}, 请在10分钟内进行操作，逾期无效！", new Date()));
        templates.add(new SmsTemplate(5L, "code-5", "你的验证码是：{code}, 请在10分钟内进行操作，逾期无效！", new Date()));
        templates.add(new SmsTemplate(6L, "code-6", "你的验证码是：{code}, 请在10分钟内进行操作，逾期无效！", new Date()));
        templates.add(new SmsTemplate(7L, "code-7", "你的验证码是：{code}, 请在10分钟内进行操作，逾期无效！", new Date()));
        templates.add(new SmsTemplate(8L, "code-8", "你的验证码是：{code}, 请在10分钟内进行操作，逾期无效！", new Date()));
        templates.add(new SmsTemplate(9L, "code-9", "你的验证码是：{code}, 请在10分钟内进行操作，逾期无效！", new Date()));
        templates.add(new SmsTemplate(10L, "code-10", "你的验证码是：{code}, 请在10分钟内进行操作，逾期无效！", new Date()));
        templates.add(new SmsTemplate(11L, "code-12", "你的验证码是：{code}, 请在10分钟内进行操作，逾期无效！", new Date()));
        templates.add(new SmsTemplate(12L, "code-11", "你的验证码是：{code}, 请在10分钟内进行操作，逾期无效！", new Date()));
        templates.add(new SmsTemplate(13L, "code-13", "你的验证码是：{code}, 请在10分钟内进行操作，逾期无效！", new Date()));
        return templates;
    }
}
