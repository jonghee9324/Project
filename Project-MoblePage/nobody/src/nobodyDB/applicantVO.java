package nobodyDB;

import java.sql.Date;

public class applicantVO {
      private Long ac_No;
      private String ac_Name;
      private String ac_Phone;
      private Date ac_Birth;
      private String ac_Lang;
      
      public applicantVO(Long ac_No,String ac_Name,String ac_Phone, Date ac_Birth,String ac_Lang) {
            super();
            this.ac_No = ac_No;
            this.ac_Name = ac_Name;
            this.ac_Phone = ac_Phone;
            this.ac_Birth = ac_Birth;
            this.ac_Lang = ac_Lang;
         }
      public applicantVO(String ac_Name,String ac_Phone, Date ac_Birth, String ac_Lang) {
            super();
            this.ac_Name = ac_Name;
            this.ac_Phone = ac_Phone;
            this.ac_Birth = ac_Birth;
            this.ac_Lang = ac_Lang;
      }
         
      
      //   Getters/Setters
      public Long getNo() {
         return ac_No;
      }
      public void setNo(Long ac_No) {
         this.ac_No = ac_No;
      }
      
            public String getName() {
            return ac_Name;
         }

         public void setName(String ac_Name) {
            this.ac_Name = ac_Name;
         }

         public String getPhone() {
            return ac_Phone;
         }

         public void setPhone(String ac_Phone) {
            this.ac_Phone = ac_Phone;
         }
         
         public Date getBirth() {
            return ac_Birth;
         }

         public void setBirth(Date ac_Birth) {
            this.ac_Birth = ac_Birth;
         }
         
         public String getLang() {
               return ac_Lang;
            }

        public void setLang(String ac_Lang) {
               this.ac_Lang = ac_Lang;
            }
         
         @Override
         public String toString() {
               return "applicantVO [ac_No=" + ac_No + ", ac_Name=" + ac_Name + ", ac_Phone=" + ac_Phone + ", ac_Birth=" + ac_Birth + ", ac_Lang=" + ac_Lang +"]";
            }
}
