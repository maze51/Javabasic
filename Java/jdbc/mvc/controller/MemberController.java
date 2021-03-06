package mvc.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Scanner;

import mvc.service.IMemberService;
import mvc.service.MemberServiceImpl;
import mvc.vo.MemberVO;
import util.DBUtil;
import util.DBUtil3;

public class MemberController {
	Scanner scan = new Scanner(System.in);
	private IMemberService service;
	
	public MemberController() {
		//service = new MemberServiceImpl();
		service = MemberServiceImpl.getInstance();
	}
	
	public static void main(String[] args) {
		new MemberController().startMember();
	}
	
	// 메뉴를 출력하는 메서드
	public int displayMenu(){
		System.out.println();
		System.out.println("=== 작업 선택 (MVC) ===");
		System.out.println("  1. 자료 입력 ");
		System.out.println("  2. 자료 삭제 ");
		System.out.println("  3. 자료 수정 ");
		System.out.println("  4. 전체 자료 출력 ");
		System.out.println("  0. 작업 끝. ");
		System.out.println("-------------------");
		System.out.print("작업 선택 >> ");
		int num = scan.nextInt();
		return num;
	}
	
	// 작업을 시작하는 메서드
	public void startMember(){
		while(true){
			int choice = displayMenu();
			switch(choice){
				case 1 : // 자료 입력
					insertMember();
					break;
				case 2 : // 자료 삭제
					deleteMember();
					break;
				case 3 : // 자료 수정
					updateMember();
					break;
				case 4 :  // 전체 자료 출력
					displayAllMember();
					break;
				case 0 :  // 작업 끝.
					System.out.println("작업을 마칩니다.");
					return;
				default : System.out.println("작업 번호를 잘못 입력했습니다. 다시 입력하세요.");
				
			}
		}
	}
	
	// 회원 정보를 수정하는 메서드
	public void updateMember(){
		
		System.out.print("수정할 회원 ID 입력 >> ");
		String memId = scan.next();
		boolean chk = service.getMember(memId);
		
		if(chk==false){  // 대상회원이 없을 때
			System.out.println(memId + "은(는) 없는 회원입니다.");
			System.out.println("수정 작업 종료...");
			return;
		}
		
		// 대상회원이 있을 때
		System.out.print("새로운 이름 >> ");
		String memName = scan.next();
		
		System.out.print("새로운 전화번호 >> ");
		String memTel = scan.next();
		
		scan.nextLine();
		System.out.print("새로운 주소 >> ");
		String memAddr = scan.nextLine();
		
		MemberVO memVo = new MemberVO();
		memVo.setMem_id(memId);
		memVo.setMem_name(memName);
		memVo.setMem_tel(memTel);
		memVo.setMem_addr(memAddr);
		
		int cnt = service.updateMember(memVo);
		
		if(cnt>0){
			System.out.println(memId + "회원의 회원정보를 수정했습니다.");
		}else{
			System.out.println("수정작업 실패!!");
		}
	}
	
	
	// 회원 정보를 삭제하는 메서드
	public void deleteMember(){
		System.out.print("삭제할 회원 ID 입력 >> ");
		String memId = scan.next();
		
		int cnt = service.deleteMember(memId);
		if(cnt>0){
			System.out.println(memId + "를(을) 삭제했습니다.");
		}else{
			System.out.println(memId + " 회원이 없거나 삭제 실패입니다.");
		}
		
	}
	
	
	
	// 전체 회원 정보를 출력하는 메서드
	public void displayAllMember(){
		System.out.println();
		System.out.println("------------------------------------------------");
		System.out.println("  ID     이름      전화번호       주소");
		System.out.println("------------------------------------------------");
		List<MemberVO> memList = service.getAllMember();
		for(MemberVO memVo : memList){
			String memId = memVo.getMem_id();
			String memName = memVo.getMem_name();
			String memTel = memVo.getMem_tel();
			String memAddr = memVo.getMem_addr();
			System.out.println( memId + "    " + memName + "    " 
						+ memTel + "    " + memAddr);
		}
		System.out.println("------------------------------------------------");
		System.out.println("출력 작업 끝...");
	}
	
	
	// 회원 정보를 추가(입력)하는 메서드
	public void insertMember(){
		System.out.println("추가할 회원 정보를 입력하세요.");
		boolean chk = false;
		String memId;
		do{
			System.out.print("회원 ID >> ");
			memId = scan.next();
			chk = service.getMember(memId);
			
			if(chk==true){
				System.out.println(memId + "은(는) 이미 등록된 ID입니다.");
				System.out.println("다시 입력해 주세요.");
			}
		}while(chk==true);
		
		System.out.print("회원 이름 >> ");
		String memName = scan.next();
		System.out.print("회원 전화번호 >> ");
		String memTel = scan.next();
		
		scan.nextLine();  // 버퍼 내용 비우기
		System.out.print("회원 주소 >> ");
		String memAddr = scan.nextLine();
		
		MemberVO memVo = new MemberVO();
		memVo.setMem_id(memId);
		memVo.setMem_name(memName);
		memVo.setMem_tel(memTel);
		memVo.setMem_addr(memAddr);
		
		
		int cnt = service.insertMember(memVo);
		
		if(cnt>0){
			System.out.println(memId + "회원 정보를 추가했습니다.");
		}
					
		
	}
}
