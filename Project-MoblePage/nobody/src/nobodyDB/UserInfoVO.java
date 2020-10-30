package nobodyDB;

public class UserInfoVO {
	   //   필드
	   private String user_Name;
	   private String user_Id;
	   private String user_Part;
	   private String user_Password;
	   private String user_Birth;
	   
	   //   생성자
	   public UserInfoVO(String user_Id,String user_Password,String user_Name,String user_Part,String user_Birth) {
	      super();
	      this.user_Id = user_Id;
	      this.user_Name = user_Name;
	      this.user_Part = user_Part;
	      this.user_Password = user_Password;
	      this.user_Birth = user_Birth;
	   }
	   public UserInfoVO(String user_Id, String user_Password) {
	      super();
	      this.user_Id = user_Id;
	      this.user_Password = user_Password;
	   }
	   public UserInfoVO(String user_Id,String user_Name , String user_Part,String user_Birth) {
	      super();
	      this.user_Id = user_Id;
	      this.user_Name = user_Name;
	      this.user_Part = user_Part;
	      this.user_Birth = user_Birth;
	   }
	   
	   //   Getters/Setters
	   public String getUser_Part() {
	      return user_Part;
	   }

	   public void setUser_Part(String user_Part) {
	      this.user_Part = user_Part;
	   }

	   public String getUser_Name() {
	      return user_Name;
	   }

	   public void setUser_Name(String user_Name) {
	      this.user_Name = user_Name;
	   }

	   public String getUser_Id() {
	      return user_Id;
	   }

	   public void setUser_Id(String user_Id) {
	      this.user_Id = user_Id;
	   }
	   public String getUser_Password() {
	      return user_Password;
	   }

	   public void setUser_Password(String user_Password) {
	      this.user_Password = user_Password;
	   }
	   public String getUser_Birth() {
	      return user_Birth;
	   }

	   public void setUser_Birth(String user_Birth) {
	      this.user_Birth = user_Birth;
	   }
	}