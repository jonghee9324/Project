package nobodyDB;

import java.util.ArrayList;
import java.util.List;
public interface NobodyDAO {
	
	// 업로드 게시판 관련 메소드
	public ArrayList<UploadVO> upload_getList();	
	public boolean upload_insert(UploadVO uploadVO);
	
	// 공지사항 관련 메소드
	public boolean notice_insert(noticeVO noticeVO);
	public List<noticeVO> notice_getList();
	
	// 로그인, 회원가입 관련 메소드
	public ArrayList<UserInfoVO> info_getList();
	public boolean info_insert(UserInfoVO userinfoVO);
	public UserInfoVO getInfo(String id);
	
	//교육 신청 관련 메소드
	public List<applicantVO> getList();
	public applicantVO get(Long ac_No);
	public boolean insert(applicantVO applicantvo);
}
