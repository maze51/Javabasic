package e_OOP;

public class OOPBasic {
	public static void main(String[] args) {
		
		/*
		OOP : Object-Orinted Programming (객체 지향 프로그래밍)
		
		1. 객체지향언어
		  - 기존의 프로그램 언어에 몇 가지 새로운 규칙을 추가한 보다 발전된 형태이다.
		  - 규칙들을 이용해서 코드간에 서로 관계를 맺어줌으로써 보다 유기적으로 프로그램을 구성한다. // 7장
		  - 객체지향 언어의 특징
		   : 코드의 재사용성이 높다.
		   : 코드의 관리가 용이하다.
		   : 신뢰성이 높은 프로그래밍을 가능케 한다.
		   
		2. 클래스와 객체
		 1) 클래스란?
		   : 객체를 정의해 높은 것이다.
		   : 객체의 설계도 또는 틀이다.
		   
		      클래스		객체
		    TV 설계도		TV
		    
		 2) 객체란?
		   : 실제로 존재하는 것, 사물 또는 개념
		   : 객체의 구성요소
		     - 속성(멤버변수, 특성, 필드, 상태)
		          크기, 길이, 색상, 무게, 전원, 채널, 볼륨...
		     - 메서드
		          켜기, 끄기, 볼륨높이기, 채널 변경...
		 
		3. 인스턴스란?
		   - 클래스로부터 객체를 만드는 과정을 클래스의 인스턴스화라고 한다.
		   - Tv클래스로부터 만들어진 객체를 Tv클래스의 인스턴스라고 한다.
		   - 인스턴스 생성방법
		        클래스명 변수명;       => 클래스의 객체를 참조하기 위한 참조변수를 선언
		     Tv t;
		        변수명 = new 클래스명()=> 클래스의 객체를 생성 후, 객체의 "주소"를 참조변수에 저장
		     t = new Tv();
		        
		   - 인스턴스는 참조변수를 통해서만 다룰 수 있다.
		       참조변수의 타입은 인스턴스의 타입과 일치해야 한다.
		       
		4. 선언 위치에 따른 변수의 종류 
		   - 지역변수, 전역변수(클래스변수, 인스턴스변수)
		   - 인스턴스변수
		     : 클래스의 영역에 선언되며, 클래스의 인스턴스를 생성할 때 만들어진다.
		     : 인스턴스 변수의 값을 읽어오거나 변경하기 위해서는 먼저 인스턴스화를 진행해야 한다.
		     : 인스턴스는 "독립적"인 저장공간을 가지므로 서로 다른 값을 가질 수 있다.
		           그럼으로 인스턴스마다 고유한 상태를 유지해야하는 속성의 경우 인스턴스 변수로 선언한다.
		   
		   - 클래스변수
		     : 모든 인스턴스가 공통된 저장공간을 "공유"하게 된다.
		 	     한 클래스의 모든 인스턴스들이 공통적인 값을 유지해야 하는 경우 클래스변수로 선언한다.
		 	 : 인스턴스 변수앞에 static만 붙이면 된다.
		 	 
		   - 지역변수
		     : 메서드내에 선언되면 메서드 내에서만 사용가능하다.
		     : 메서드 종료시 소멸되게 된다.
		
		5. 메서드
		   - 어떠한 작업을 수행하기 위한 명령문의 집합
		   - 주로 어떤 값을 입력받아서 처리하고 그 결과를 돌려준다.
		   - 입력되는 값이 없을수도, 결과를 반환하지 않을수도 있다.
		   - 반복적으로 사용되는 코드를 줄이기 위해서 사용된다.
		   - 작성방법
		   반환타입 메서드명(매개변수(들): 변수타입 변수명, 변수타입 변수명, ...){		//반환타입 void는? 나는 너에게 아무것도 안 줄 거다. 이때는 return생략도 가능
		     	수행될 문장
		     	return; // 생략가능
		   }
		   
		   void changeColor(Sting color){		// 돌려줄 게 없으므로 void
		   		color2 = color;
		   }
		   이러면 이걸 쓰려면 우리가 문자열을 줘야 한다.
		   
		   int add(int a, int b){		//이러면 이건 두 개 받는 녀석. 돌려줄 게 있으면 반환타입이 맨 앞에 온다. 단 이때 return값과 반환타입은 일치해야 한다.
		   		int result = a + b;
		   		return result; // return옆에 올 것은 반환값
		   }
		   <메서드 만드는 순서> 메서드명 쓰고, 변수타입 변수명 쓰고, 안에 로직 작성하고
		   돌려줄게 있다면 return뒤에 값을 쓰고, 그거 보고 맨 앞에 반환타입을 써 준다.
		   
		 6. return
		   - 메서드가 정상적으로 종료되는 경우
		     : 메서드 블럭{} 내의 마지막 부분까지 수행하였을 때.
		     : 메서드의 블럭{} 내에서 return문을 만났을 때. // 반복문의 break;같은 기능으로 사용할 수 있다
		   - 반환값
		     : 없는 경우에는 return문만 써 주면 된다.
		     	return; // 생략가능하다
		     : 있는 경우에는 return문 뒤에 반환값을 써 주면 된다.
		     	return 5;
		   - 메서드의 반환타입과 반환값의 타입은 같아야 한다.
		 
		 7. 메서드의 호출
		   - 클래스메서드 호출
		        클래스명.메서드명(변수타입 변수명, 변수타입 변수명,(없어도 됨));
		   - 인스턴스메서드 호출
		        클래스명 참조변수 = new 클래스명();
		        참조변수.메서드명(변수타입 변수명, 변수타입 변수명,(없어도 됨));
		        
		 8. JVM 메모리 구조
		    - 메서드영역(method area)
		      : 프로그램 사용 중 class의 정보가 저장된다
		      : 클래스변수, 클래스메서드도 같이 로드(생성된다, 만들어진다)된다.
		    - 호출스택(call stack)
		      : 메서드 작업에 필요한 메모리 공간을 제공한다.
		      : 메서드가 호출되면 호출스택에 호출된 메서드를 위한 메모리가 할당되며 
		            메서드가 작업을 수행하는 동안 지역변수들과 연산의 중간결과 등을 저장한다.
		    - 힙영역(heap)
		      : 인스턴스가 생성되는 공간이다.
		      : 인스턴스변수, 인스턴스메서드도 같이 로드된다.
		      
		 9. 매개변수
		 	- 메서드를 호출할 때 매개변수로 지정한 값(인자값)을 메서드의 매개변수에 복사해서 넘겨준다.
		 	- 기본형 매개변수
		 	  : 단순하게 저장된 값만 복사된다.
		 	  : 변수의 값을 읽기만 할 수 있다.
		 	- 참조형 매개변수
		 	  : 인스턴스의 주소가 복사된다.
		 	  : 변수의 값을 읽고 변경할 수 있다.
		 	  
		 10. 메서드의 종류
		   - 클래스메서드
		     : 객체생성 없이 '클래스명.메서드명()'으로 호출한다.
		     : 인스턴스 변수나 인스턴스 메서드와 관련없는 작업을 수행한다.
		     : 클래스 메서드 내에서는 인스턴스 변수를 사용할 수 없다.
		     : 메서드내에서 인스턴스 변수를 사용하지 않는다면 static을 붙이는 것을 고려한다.
		   - 인스턴스메서드
		 	 : 인스턴스를 생성 후, '참조변수.메서드명()'으로 호출한다.
		 	 : 인스턴스변수나 인스턴스 메서드와 관련된 작업을 수행한다.
		 	 : 메서드 내에서 인스턴스 변수나 메서드를 사용할 수 있다.
		 	 
		 11. 클래스멤버와 인스턴스 멤버 간의 참조와 호출
		   - 같은 클래스의 멤버간에는 객체 생성이나 참조변수 없이 참조할 수 있다(클래스명을 굳이 앞에 쓸 필요가 없다 InterVari참조).
		   - 클래스 멤버에서는 인스턴스 멤버를 호출할 수 없다
		     : 인스턴스의 멤버가 존재하는 시점에는 클래스멤버들이 항상 존재한다.
		          클래스멤버들이 존재하는 시점에는 인스턴스 멤버들이 존재하지 않을 수도 있다. 그래서 로드를 막은 것. 
		   
		 12. 메서드 오버로딩
		   - 한 클래스내에 같은 이름의 메서드를 여러 개 정의하는 것을 '메서드 오버로딩'이라고 한다.		   
		   - println()이 가장 대표적인 예이다.
		   - 조건
		     : 메서드명은 동일해야 한다
		     : 매개변수의 타입 또는 개수가 달라야 한다.
		     : 리턴 타입은 상관없다.
		   - 오버로딩의 장점
		     : 메서드의 이름으로만 구별된다면, 모든 메서드의 명칭이 달라야 한다.
		     : 근본적으로 같은 기능을 하는 것인데, 다른 이름으로 표현되면 기억하기가 어렵다.
		     : 메서드 이름을 짓는 데 고민을 덜 수 있다.
		     
		 13. 재귀호출 (recursive call)
		   - 메서드 내부에서 메서드 자신을 다시 호출하는 것		  
	  
	  	 14. 생성자
	  	   - 인스턴스가 생성될 때 호출되는 인스턴스 초기화 메서드이다.
	  	   - 특징
	  	     : 메서드처럼 클래스 내에 선언된다.
	  	     : 리턴값이 없다.
	  	       (생성자도 메서드이기 때문에 리턴값이 없는 void를 적어야 하나 모든 생성자가 리턴값이 없어 생략한다)
	  	     : 생성자의 명칭은 클래스의 명칭과 동일해야 한다.
	  	   - 정의방법
	  	     : 기본생성자
	  	        클래스명(){
	  	        
	  	     }
	  	     : 매개변수가 있는 생성자
	  	        클래스명(변수타입 변수명, 변수타입 변수명,...){
	  	        
	  	     }
	  	     
	  	   - 생성자에서 다른 생성자 호출하기 this()
	  	     : 같은 클래스의 멤버들 간에 서로 호출할 수 있는 것 처럼 생성자 간에도 서로 호출이 가능하다.
	  	     : 조건
	  	          생성자의 이름으로 클래스명 대신 this를 사용한다.
	  	          한 생성자에서 다른 생성자를 호출할 때는 첫 줄에서만 호출이 가능하다.
	  	       
	  	 15. 변수의 초기화
	  	   - 변수를 선언하고 처음으로 값을 저장하는 것을 '변수의 초기화'라고 한다.
	  	   - 초기화 방법
	  	     : 명시적 초기화 => 변수의 선언과 동시에 초기화 => int a = 5;
	  	     : 생성자를 이용한 초기화
	  	   - 초기화 블럭을 이용한 초기화
	  	     : 클래스초기화 블럭
	  	     : 인스턴스초기화 블럭
	  	     
	  	     
	  	     
	  	     
	  	   - Tv t = new Tv() / Tv() 부분이 생성자. 클래스명에 소괄호()있으면 다 생성자.
	  	   	  실질적으로 인스턴스화해주는 부분. 호출할 수 있는 것과 역할(인스턴스화 할 때)이 메서드의 일종
	  	   	  
		 */   
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
