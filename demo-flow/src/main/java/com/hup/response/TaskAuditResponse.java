package com.hup.response;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-12
 * Time: 20:12
 */
public class TaskAuditResponse {

    private String title;
    private String content;
    private List<String> comments;
    private String audits;


    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public List<String> getComments() {
        return comments;
    }

    public void setComments(List<String> comments) {
        this.comments = comments;
    }

    public String getAudits() {
        return audits;
    }

    public void setAudits(String audits) {
        this.audits = audits;
    }
}
