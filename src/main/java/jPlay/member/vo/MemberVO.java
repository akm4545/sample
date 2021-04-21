package jPlay.member.vo;

import java.util.Date;

public class MemberVO extends MemberDefaultVO{
    private static final long serialVersionUID = 1L;
    
    /** member_idx */
    private int memberIdx;
    
    /** member_id */
    private String memberId;
    
    /** member_pwd */
    private String memberPwd;
    
    /** member_name */
    private String memberName;
    
    /** member_email */
    private String memberEmail;
    
    /** member_tel */
    private String memberTel;
    
    /** membet_joinDate */
    private Date memberJoindate;
    
    /** member_del */
    private String memberDel;
    
    private Date memberDeldate; 
    
    public int getMemberIdx() {
        return this.memberIdx;
    }
    
    public void setMemberIdx(int memberIdx) {
        this.memberIdx = memberIdx;
    }
    
    public String getMemberId() {
        return this.memberId;
    }
    
    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }
    
    public String getMemberPwd() {
        return this.memberPwd;
    }
    
    public void setMemberPwd(String memberPwd) {
        this.memberPwd = memberPwd;
    }
    
    public String getMemberName() {
        return this.memberName;
    }
    
    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }
    
    public String getMemberEmail() {
        return this.memberEmail;
    }
    
    public void setMemberEmail(String memberEmail) {
        this.memberEmail = memberEmail;
    }
    
    public String getMemberTel() {
        return this.memberTel;
    }
    
    public void setMemberTel(String memberTel) {
        this.memberTel = memberTel;
    }
    
    public Date getMembetJoindate() {
        return this.memberJoindate;
    }
    
    public void setMembetJoindate(Date membetJoindate) {
        this.memberJoindate = membetJoindate;
    }
    
    public String getMemberDel() {
        return this.memberDel;
    }
    
    public void setMemberDel(String memberDel) {
        this.memberDel = memberDel;
    }

	public Date getMemberDeldate() {
		return memberDeldate;
	}

	public void setMemberDeldate(Date memberDeldate) {
		this.memberDeldate = memberDeldate;
	}

	@Override
	public String toString() {
		return "MemberVO [memberIdx=" + memberIdx + ", memberId=" + memberId + ", memberPwd=" + memberPwd
				+ ", memberName=" + memberName + ", memberEmail=" + memberEmail + ", memberTel=" + memberTel
				+ ", memberJoindate=" + memberJoindate + ", memberDel=" + memberDel + ", memberDeldate=" + memberDeldate
				+ "]";
	}
}