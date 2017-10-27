package com.hup.request;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-09-25
 * Time: 16:26
 */
public class PageRequest {

    private String currentPage;         //当前第几页
    private String pageSize;            //每页多少条

    public String getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(String currentPage) {
        this.currentPage = currentPage;
    }

    public String getPageSize() {
        return pageSize;
    }

    public void setPageSize(String pageSize) {
        this.pageSize = pageSize;
    }

    /** easyUi的传参方式**/
    private String page;
    private String rows;

    public String getPage() {
        return page;
    }

    public void setPage(String page) {
        this.page = page;
    }

    public String getRows() {
        return rows;
    }

    public void setRows(String rows) {
        this.rows = rows;
    }
}
