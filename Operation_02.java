package b_operation;

public class Operation_02 {
	public static void main(String[] args) {
		/*
		 1. 증감 연산자(++, --)
		  - 증가 연산자(++) : 피연산자의 값을 1 증가시킨다. 1을 더하는 것이 아님. 타입이 변하지 않음.
		  - 감소 연산자(--) : 피연산자의 값을 1 감소시킨다.

		 */
		int i1 = 3;
		i1++; // 4
		System.out.println(i1);
		++i1; // 5								단독으로 쓸 때는 앞이나 뒤나 같은 결과
		System.out.println(i1);

		// 다른 변수와 함께 쓰일 때의 용례
		int i2 = 5;
		int i3 = ++i2; // i2 = 6, i3 = 6		이 때는 i2를 먼저 증가시키고 대입한다

		int i4 = 4;
		int i5 = i4++; // i5 = 4, i4 = 5		이 때는 i4를 먼저 대입하고 증가시킨다
		System.out.println("i4 : "+i4);
		System.out.println("i5 : "+i5);

		int i6 = 36;
		int i7 = 12;
		int i8 = ++i6 + ++i7 + i6++; // i6 = 38, i7 = 13, i8 = 37 + 13 + 37 = 87

		/*
		 2. 부호 연산자(+, -)
		  - boolean형과 char형에는 사용할 수 없다.

		 3. 비트전환 연산자 (~ : 틸트)					비트라는 말이 나오면 2진수로 바꾼다고 생각할 것
		  - 정수형과 char형에만 사용할 수 있다.
		  - 피연산자를 2진수로 표현했을 때 0은 1로 1은 0으로 바꾼다. 실제로는 4바이트보다 작으면 int타입으로 변환함.
		  - 양수를 음수로 바꾸고 1을 더 뺀 값이 나옴(1의 보수). 그러므로 ~10+1하면 10의 음수값이 나옴(2의 보수).

		  10	: 00001010
		  ~10	: 11110101 => -11 10의 1의 보수
		  ~10+1	: 11110110 => -10 10의 2의 보수
		 */
		byte b2 = 10;
		byte b3 = (byte)~b2; // -11

		/*
		 4. 논리부정 연산자( ! )
		 - boolean형에만 사용 가능하다.
		 - true -> false, false -> true
		 */

		boolean power = false;
		System.out.println(!power); // true

		power = !power;
		System.out.println(power); // true

		power = !power;
		System.out.println(power); // false

		/*
		 5. 산술연산자
		  - 사칙연산자(+,-,*,/), 나머지 연산자(%), 쉬프트연산자(<<,>>,>>>)
		  - 이항연산자 임으로 피연산자의 크기가 4byte보다 작으면 4byte형으로 변환후 연산을 수행한다.

		 6. 사칙연산자 (+,-,*,/)
		  - 두 개의 피연산자중 자료형의 표현범위가 큰 쪽에 맞춰서 형변환후 연산을 수행
		   : int + float => float + float => float

		  - int형(4byte)형보다 작은 크기의 자료형간의 연산시에는 int형으로 변환 후 연산을 수행한다.
		   : byte + char => int + int => int

		  - 나눗셈의 경우 0으로 나누는 것은 금지되어 있다.

		 */
		int a = 10;
		long b = 30L;
		byte c = 50;
		short d = 600;

		// b와 c의 합을 저장할 수 있는 변수 e를 만들어라
		int e = (int)(b + c);

		// c와 d의 합계를 변수 f에 저장하라
		int f = c + d;

		// 'D', '가', 3.14f 의 합을 변수 g에 저장
		float g = 'D' + '가' + 3.14f;


		/*
		 7. 나머지 연산자(%)
		  - 왼쪽의 피연산자를 오른쪽 피연산자로 나누고 난 나머지 값을 돌려준다.
		  - boolean형에는 사용할 수 없다.			홀/짝 구할 때 많이 사용됨. + x의 배수를 구할 때
		 */

		int aa = 20;
		int bb = 8;
		int cc = aa/bb; // 2
		int dd = aa%bb; // 4

		// 20을 8로 나눈 몫은 2이고 나머지는 4이다.
		System.out.println(aa + "을 " + bb + "로 나눈 몫은 " + cc + "이고 나머지는 " + dd + "이다.");

		/*
		 8. 쉬프트 연산자(<<, >>, >>>)
		  - 정수형 변수에만 사용 가능하다.
		  - 피연산자의 각자리 (2진수)를 오른쪽 또는 왼쪽으로 이동한다.
		  - 곱셈과 나눗셈을 할 때 연산 속도가 좋음으로 사용한다.
		  - << : x<<n은 x*2^n
		  - >> : x>>n은 x/2^n
		  - 쉬프트 연산자는 은행권에서 많이 사용됨. 	>>>는 화면 명암 바꿀때 사용. 프로그래밍에는 거의 사용되지 않음.


		 */
		byte bbb = 10;
		System.out.println(bbb<<3);

		/*
		 9. 비교 연산자
		  - 두 개의 변수 또는 리터럴을 비교하는데 사용되는 연산자
		  - 주로 조건문과 반복문의 조건식에 사용되며 boolean형의 결과를 얻는다.
		  - 이항연산자이다.

		 10. 대소비교 연산자(<, >, <=, >=)
		  - 기본형의 boolean형을 제외한 나머지 자료형에 사용 가능

		 11. 등가비교 연산자( ==, != )
		  - 모든 자료형에 사용 가능하다(참조형도 가능).

		  		수식		|		연산결과
		  		x < y	|	x가 y보다 작을때만 true 그 외에는 false	
		  		x > y	|	x가 y보다 클때만 true 그 외에는 false	
		  		x <= y	|	x가 y보다 작거나 같을때만 true 그 외에는 false	
		  		x >= y	|	x가 y보다 크거나 같을때만 true 그 외에는 false	
		  		x == y	|	x와 y가 같을때만 true 그 외에는 false	
		  		x != y	|	x와 y가 다를때만 true 그 외에는 false

		 */

		System.out.println('0' == 0);
		System.out.println(0.1 == 0.1f);
		System.out.println(0.5 == 0.5f);

		/*
		 12. 논리연산자 ( &&, || )
		  - 피연산자로 boolean형 또는 boolean형 값을 결과로 하는 조건식만을 허용한다.
		  - && (AND결합) : 피연산자 양쪽 모두 true일때 true의 결과를 얻는다.
		  - || (OR결합) : 피연산자중 어느 한 쪽만 true이면 true이다.

		  - &&의 연산 우선순위가 ||의 연산 우선순위보다 높다.
		 */

		int x = -10;
		// x의 값이 0이상 15이하이면 true의 결과를 얻도록 만들어라.
		// 0 <= x <= 15
		// 0 <= x && x <= 15
		boolean result = 0 <= x && x <= 15;
		System.out.println("결과: "+result);
		
		//1. 'J'를 저장할 수 있는 변수 ddd를 선언 및 초기화하라.
		char ddd = 'J';
		
		//2. ddd의 값이 영어 대문자일 때 true인 조건식을 만들어라.
		boolean big = 'A' <= ddd && ddd <= 'Z';
		System.out.println("result: "+big);
		
		//3. ddd의 값이 영어 소문자일 때 true인 조건식을 만들어라.
		boolean small = 'a' <= ddd && ddd <= 'z';
		System.out.println("result: "+small);
		
		//4. ddd의 값이 영문자일 때 true인 조건식을 만들어라.
		boolean alphabet = 'A' <= ddd && ddd <= 'Z' || 'a' <= ddd && ddd <= 'z';
		System.out.println("result: "+alphabet);
		
		//5. ddd의 값이 숫자형일 때 true인 조건식을 만들어라.  힌트) J는 char형 
//		boolean number = 
		
		//6. ddd의 값이 영문자 또는 숫자형일 때 true인 조건식을 만들어라.
	}

}
