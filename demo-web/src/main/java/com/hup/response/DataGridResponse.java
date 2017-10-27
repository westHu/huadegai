package com.hup.response;

import java.util.ArrayList;
import java.util.List;

public class DataGridResponse {

	private Integer total = 0;
	private List rows = new ArrayList();

	public DataGridResponse() {
	}

	public DataGridResponse(Integer total, List rows) {
		this.total = total;
		this.rows = rows;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	public List getRows() {
		return rows;
	}

	public void setRows(List rows) {
		this.rows = rows;
	}

}
