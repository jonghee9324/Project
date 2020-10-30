package nobodyDB;

public class noticeVO {
	   //   필드
	   private Long nt_no;
	   private String nt_Title;
	   private String nt_Content;
	   private String nt_Date;
	   //   생성자
	   public noticeVO(Long nt_no ,String nt_Title , String nt_Content ,String nt_Date) {
	      super();
	      this.nt_no = nt_no;
	      this.nt_Title = nt_Title;
	      this.nt_Content=nt_Content;
	      this.nt_Date = nt_Date;
	   }
	   public noticeVO(String nt_Title, String nt_Content) {
		   super();	      
	      this.nt_Title = nt_Title;
	      this.nt_Content=nt_Content;
	   }
	   
	   //   Getters/Setters
	   public Long getnt_no() {
	      return nt_no;
	   }

	   public void setnt_no(Long nt_no) {
	      this.nt_no = nt_no;
	   }

	   public String getnt_Date() {
	      return nt_Date;
	   }

	   public void setnt_Date(String nt_Date) {
	      this.nt_Date = nt_Date;
	   }

	   public String getnt_Title() {
	      return nt_Title;
	   }

	   public void setnt_Title(String nt_Title) {
	      this.nt_Title = nt_Title;
	   }
	   public String getnt_Content() {
	      return nt_Content;
	   }

	   public void setnt_Content(String nt_Content) {
	      this.nt_Content = nt_Content;
	   }

	   //   출력용 오버라이드
	   @Override
	   public String toString() {
	      return "noticeVO [nt_no=" + nt_no +", nt_Title=" + nt_Title +", nt_Content"+nt_Content+ "]";
	   }
	}