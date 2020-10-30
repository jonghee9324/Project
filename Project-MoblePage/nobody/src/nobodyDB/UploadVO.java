package nobodyDB;

public class UploadVO {
	private String up_title;
	private String up_task;
	private String up_date;
	private String up_content;
	private int up_rownum;
	
	public UploadVO(String title, String content, String task) {
		up_title = title;
		up_task = task;
		up_content = content;
	}
	public UploadVO(String title, String content, String task, String date, int num) {
		up_title = title;
		up_task = task;
		up_content = content;
		up_date = date;
		up_rownum = num;
	}

	
	public int getUp_rownum() {
		return up_rownum;
	}
	public void setUp_rownum(int up_rownum) {
		this.up_rownum = up_rownum;
	}
	public String getUp_content() {
		return up_content;
	}

	public void setUp_content(String up_content) {
		this.up_content = up_content;
	}
	
	public String getUp_title() {
		return up_title;
	}

	public void setUp_title(String up_title) {
		this.up_title = up_title;
	}

	public String getUp_task() {
		return up_task;
	}

	public void setUp_task(String up_task) {
		this.up_task = up_task;
	}

	public String getUp_date() {
		return up_date;
	}

	public void setUp_date(String up_date) {
		this.up_date = up_date;
	}
	
}
