package y_exam;

public class Exam_05 {
	public static void main(String[] args) {
		
		/*
		[5-1] 다음은 배열을 선언하거나 초기화한 것이다. 잘못된 것을 고르고 그 이유를 설명
		하시오.
		
		a. int[] arr[];
		바름
		b. int[] arr = {1,2,3,}; 
		바름	,뒤에 아무것도 없으면 방으로 처리하지 않음. 그러므로 arr의 length는 3
		c. int[] arr = new int[5];
		바름
		d. int[] arr = new int[5]{1,2,3,4,5};
		잘못. 선언과 생성을 동시에 할 경우 배열의 길이는 중괄호 안에 몇 개가 생성되었는가를 따라간다.
		e. int arr[5];
		잘못. 배열의 크기 지정은 선언하면서 할 수 없음.
		f. int[] arr[] = new int[3][];
		바름. 현재 상태는 큰 배열 안에 작은 배열 세 개가 생성되어 있고, 작은 배열은 null만 있을 뿐
		@추가: f번에서 arr안에 길이가 2, 4, 3인 작은 배열 3개를 생성하라
		arr[0] = new int[2];
		arr[1] = new int[4];
		arr[2] = new int[3];
		이 때 배열의 모양은
		{
			{0, 0}
			{0, 0, 0, 0}
			{0, 0, 0}
		}
		*/
		int[] arr[];
		int[] arraa = {1,2,3,};
		int[] arrbb = new int[5];
//		int[] arrcc = new int[5]{1,2,3,4,5};
//		int arrdd[5];
		int[] arree[] = new int[3][];
		
		/*
		[5-2] 다음과 같은 배열이 있을 때, arr[3].length의 값은 얼마인가? // 네번째 작은 배열의 길이 = 2
		int[][] arr = {
		{ 5, 5, 5, 5, 5},
		{ 10, 10, 10},
		{ 20, 20, 20, 20},
		{ 30, 30}
		};
		 */
		
		/*
		[5-3] 배열 arr에 담긴 모든 값을 더하는 프로그램을 완성하시오.
		
		int[] arr = {10, 20, 30, 40, 50};
		int sum = 0;

		for(int i=0;i<arr.length;i++){
			sum += arr[i];
		}
		System.out.println("sum="+sum);
		 */
		int[] arr3 = {10, 20, 30, 40, 50};
		int sum = 0;

		for(int i=0;i<arr3.length;i++){
			sum += arr3[i];
		}
		System.out.println("sum="+sum);
		
		/*
		[5-4] 2차원 배열 arr에 담긴 모든 값의 총합과 평균을 구하는 프로그램을 완성하시오.
		[실행결과] total 325 avg 16.25
		int[][] arr = {
		{ 5, 5, 5, 5, 5},
		{10,10,10,10,10},
		{20,20,20,20,20},
		{30,30,30,30,30}
		};
		int total = 0;
		float average = 0;
		
		for(int i=0;i<arr.length;i++){			// i는 큰 배열을 표현
			for(int j=0;j<arr[i].length;j++){	// j는 작은 배열을 표현
				total += arr[i][j];
			}
		}
		average = (int)((float)total/(arr.length*arr[0].length)*100+0.5f)/100f;
		
		System.out.println("total="+total);
		System.out.println("average="+average);
		 */
		int[][] arr4 = {
				{ 5, 5, 5, 5, 5},
				{10,10,10,10,10},
				{20,20,20,20,20},
				{30,30,30,30,30}
				};
				int total = 0;
				float average = 0;
				
				for(int i=0;i<arr4.length;i++){			// i는 큰 배열을 표현
					for(int j=0;j<arr4[i].length;j++){	// j는 작은 배열을 표현
						total += arr4[i][j];
					}
				}
				average = (int)((float)total/(arr4.length*arr4[0].length)*100+0.5f)/100f;
				
				System.out.println("total="+total);
				System.out.println("average="+average);
				
		/*
		[5-5] 다음은 1과 9사이의 중복되지 않은 숫자로 이루어진 3자리 숫자를 만들어내는 프로그램이다. 
		(1)~(2)에 알맞은 코드를 넣어서 프로그램을 완성하시오.
		int[] ballArr = {1,2,3,4,5,6,7,8,9};
		int[] ball3 = new int[3];
		
		// 배열 ballArr의 임의의 요소를 골라서 위치를 바꾼다.
		for(int i=0; i< ballArr.length;i++) {
			int j = (int)(Math.random() * ballArr.length); // 0~배열 길이 사이의 임의의 수
			int tmp = 0;
			
			tmp = ballArr[j];
			ballArr[j] = ballArr[i];			// 두 숫자의 위치 바꾸기
			ballArr[i] = tmp;
			
		}
		
		// 배열 ballArr의 앞에서 3개의 수를 배열 ball3로 복사한다.
		for(int i=0;i<3;i++){
			ball3[i] = ballArr[i];
		}
		for(int i=0;i<ball3.length;i++) {
			System.out.print(ball3[i]);
		}
		 */
				int[] ballArr = {1,2,3,4,5,6,7,8,9};
				int[] ball3 = new int[3];

				for(int i=0; i< ballArr.length;i++) {
					int j = (int)(Math.random() * ballArr.length);
					int tmp = 0;

					tmp = ballArr[j];
					ballArr[j] = ballArr[i];
					ballArr[i] = tmp;

				}

				for(int i=0;i<3;i++){
					ball3[i] = ballArr[i];
				}
				for(int i=0;i<ball3.length;i++) {
					System.out.print(ball3[i]);
				}
				
		/*
		[5-6] 다음은 거스름돈을 몇 개의 동전으로 지불할 수 있는지를 계산하는 문제이다. 변
		수 money의 금액을 동전으로 바꾸었을 때 각각 몇 개의 동전이 필요한지 계산해서 출력하
		라. 단, 가능한 한 적은 수의 동전으로 거슬러 주어야한다. (1)에 알맞은 코드를 넣어서
		프로그램을 완성하시오.
		[Hint] 나눗셈 연산자와 나머지 연산자를 사용해야 한다.
		
		// 큰 금액의 동전을 우선적으로 거슬러 줘야한다.
		int[] coinUnit = {500, 100, 50, 10};
		
		int money = 2680;
		System.out.println("money="+money);
		
		for(int i=0;i<coinUnit.length;i++) {
			System.out.println(coinUnit[i]+"원: "+money/coinUnit[i]);	//나눈 몫을 동전과 출력
			money %= coinUnit[i];				// 나머지는 저장해서 다음 반복으로
		}
		
		@@ 다른 풀이
		int sh = 0;
		sh = money/coinUnit[0]; // 5
		money -= coinUnit[0]*sh; // 180
		
		sh = money/coinUnit[1]; // 1
		money -= coinUnit[1]*sh; // 80
		
		sh = money/coinUnit[2]; // 1
		money -= coinUnit[2]*sh; // 30
		
		sh = money/coinUnit[3]; // 3
		money -= coinUnit[3]*sh; // 0
		
		반복되는 부분을 반복문으로 바꾸면
		for( int i=0;i<coinUnit.length;i++){
			sh = money/coinUnit[i];
			money -= coinUnit[i]*sh;
			System.out.println(coinUnit[i] +"원 : "+sh);
		}
		*/
				int[] coinUnit = {500, 100, 50, 10};

				int money = 2680;
				System.out.println("money="+money);

				for(int i=0;i<coinUnit.length;i++) {
					System.out.println(coinUnit[i]+"원: "+money/coinUnit[i]);
					money %= coinUnit[i];
				}
		/*
		[5-7]
		문제 5-6에 동전의 개수를 추가한 프로그램이다. 커맨드라인으로부터 거슬러 줄 금액을 입력받아 계산한다. 보유한 동전의 개수로 거스름돈을 지불할 수 없으면,
		‘거스름돈이 부족합니다.’라고 출력하고 종료한다. 지불할 돈이 충분히 있으면, 거스름돈을 지불한 만큼 가진 돈에서 빼고 남은 동전의 개수를 화면에 출력한다.
		(1)에 알맞은 코드를 넣어서 프로그램을 완성하시오.
		
		if(args.length!=1) {
			System.out.println("USAGE: java Exercise5_7 3120");
			System.exit(0);
					}
		
		// 문자열을 숫자로 변환한다. 입력한 값이 숫자가 아닐 경우 예외가 발생한다.
		int money = Integer.parseInt(args[0]);
		
		System.out.println("money="+money);
		
		int[] coinUnit = {500, 100, 50, 10 }; // 동전의 단위
		int[] coin = {5, 5, 5, 5}; // 단위별 동전의 개수
		
		
		for(int i=0;i<coinUnit.length;i++) {
			int coinNum = 0;
			
		//여기서 coinNum은 위 다른 풀이의 sh와 같은 역할
		// 6 = 3170/500;
		// cn = money/CU[0];
		// if(cn>coin[0]) {
		//	cn=coin[0];
		//}
		
		
		// 1. 금액(money)을 동전단위로 나눠서 필요한 동전의 개수(coinNum)를 구한다.
		
			coinNum = money/coinUnit[i];
		
		// 2. 배열 coin에서 coinNum만큼의 동전을 뺀다.
		//(만일 충분한 동전이 없다면 배열 coin에 있는 만큼만 뺀다.)
			if(coin[i] >= coinNum){
				coin[i] -= coinNum;
			} else {
				coinNum = coin[i];		// coinNum값을 바꿔줘야 거스름돈이 부족하다고 정상적으로 출력됨
				coin[i] = 0;
			}
		// 3. 금액에서 동전의 개수(coinNum)와 동전단위를 곱한 값을 뺀다.
			money -= coinNum * coinUnit[i];
		
			System.out.println(coinUnit[i]+"원: "+coinNum);
		}
		if(money > 0) {
			System.out.println("거스름돈이 부족합니다.");
			System.exit(0); // 프로그램을 종료한다.
		}
		System.out.println("=남은 동전의 개수 =");
		
		for(int i=0;i<coinUnit.length;i++) {
			System.out.println(coinUnit[i]+"원:"+coin[i]);
		}
		 */
				if(args.length!=1) {
					System.out.println("USAGE: java Exercise5_7 3120");
					System.exit(0);
							}
				
				
				int money7 = Integer.parseInt(args[0]);
				
				System.out.println("money="+money7);
				
				int[] coinUnit1 = {500, 100, 50, 10 };
				int[] coin = {5, 5, 5, 5};
				
				
				for(int i=0;i<coinUnit1.length;i++) {
					int coinNum = 0;
				
				// 1. 금액(money)을 동전단위로 나눠서 필요한 동전의 개수(coinNum)를 구한다.
				
					coinNum = money7/coinUnit1[i];
				
				// 2. 배열 coin에서 coinNum만큼의 동전을 뺀다.
				//(만일 충분한 동전이 없다면 배열 coin에 있는 만큼만 뺀다.)
					if(coin[i] >= coinNum){
						coin[i] -= coinNum;
					} else {
						coinNum = coin[i];
						coin[i] = 0;
					}
				// 3. 금액에서 동전의 개수(coinNum)와 동전단위를 곱한 값을 뺀다.
					money7 -= coinNum * coinUnit1[i];
				
					System.out.println(coinUnit1[i]+"원: "+coinNum);
				}
				if(money > 0) {
					System.out.println("거스름돈이 부족합니다.");
					System.exit(0);
				}
				System.out.println("=남은 동전의 개수 =");
				
				for(int i=0;i<coinUnit.length;i++) {
					System.out.println(coinUnit1[i]+"원:"+coin[i]);
				}
				
		/*
		[5-8]
		다음은 배열 answer에 담긴 데이터를 읽고 각 숫자의 개수를 세어서 개수만큼 ‘*’
		을 찍어서 그래프를 그리는 프로그램이다. (1)~(2)에 알맞은 코드를 넣어서 완성하시오.
		int[] answer = { 1,4,4,3,1,4,4,2,1,3,2 };
		int[] counter = new int[4];
		
		for(int i=0; i < answer.length;i++) {
			counter[answer[i]-1]++;				//answer[0]에서 불러온 값이 1이라면, 1-1=0, counter[0](1번자리)에 +1됨
		}
		
		for(int i=0; i < counter.length;i++) {
		
		System.out.print(counter[i]);
			for(int j=0;j<counter[i];j++){
				System.out.print("*");
			}
			System.out.println();
		}
		 */
				int[] answer = { 1,4,4,3,1,4,4,2,1,3,2 };
				int[] counter = new int[4];

				for(int i=0; i < answer.length;i++) {
					counter[answer[i]-1]++;				//answer[0]에서 불러온 값이 1이라면, 1-1=0, counter[0](1번자리)에 +1됨
				}

				for(int i=0; i < counter.length;i++) {

					System.out.print(counter[i]);
					for(int j=0;j<counter[i];j++){
						System.out.print("*");
					}
					System.out.println();
				}
		
		/*
		[5-9] 주어진 배열을 시계방향으로 90도 회전시켜서 출력하는 프로그램을 완성하시오.
		char[][] star = {
			{'*','*',' ',' ',' '},
			{'*','*',' ',' ',' '},
			{'*','*','*','*','*'},
			{'*','*','*','*','*'}
		};
		
		char[][] result = new char[star[0].length][star.length];
		
		for(int i=0; i < star.length;i++) {
			for(int j=0; j < star[i].length;j++) {
				System.out.print(star[i][j]);
			}
			System.out.println();
		}
		
		System.out.println();
		
		for(int i=0; i < star.length;i++) {
			for(int j=0; j < star[i].length;j++) {
		
				알맞은 코드를 넣어 완성
			}
		}
		
		for(int i=0; i < result.length;i++) {
			for(int j=0; j < result[i].length;j++) {
				System.out.print(result[i][j]);
			}
			System.out.println();
		}
		 */
				char[][] star = {
						{'*','*',' ',' ',' '},
						{'*','*',' ',' ',' '},
						{'*','*','*','*','*'},
						{'*','*','*','*','*'}
					};
					
					char[][] result = new char[star[0].length][star.length];
					
					for(int i=0; i < star.length;i++) {
						for(int j=0; j < star[i].length;j++) {
							System.out.print(star[i][j]);
						}
						System.out.println();
					}
					
					System.out.println();
					
					for(int i=0; i < star.length;i++) {
						for(int j=0; j < star[i].length;j++) {
								result[j][i] = star[3-i][j];
						}
					}
					
					for(int i=0; i < result.length;i++) {
						for(int j=0; j < result[i].length;j++) {
							System.out.print(result[i][j]);
						}
						System.out.println();
					}
		/*
		[5-11] 주어진 차원 배열의 데이터보다 가로와 세로로 이 더 큰 배열을 생성해서 배열 2 1
		의 행과 열의 마지막 요소에 각 열과 행의 총합을 저장하고 출력하는 프로그램이다. (1)
		에 알맞은 코드를 넣어서 완성하시오.
		int[][] score = {
				{100, 100, 100}
				, {20, 20, 20}
				, {30, 30, 30}
				, {40, 40, 40}
				, {50, 50, 50}
				};
		int[][] result = new int[score.length+1][score[0].length+1];
		
		for(int i=0; i < score.length;i++) {
			for(int j=0; j < score[i].length;j++) {
				result[i][j] = score[i][j];					//score를 result로 복사
				result[i][score[0].length] += result[i][j];	//[0][3]에 들어갈 결과값은 [0][0]~[0][2]의 합. 아래 행도 동일
				result[score.length][j] += result[i][j];	//[5][0]에 들어갈 결과값은 [0][0]~[4][0]의 합. 아래 행도 동일
				result[score.length][score[0].length] += result[i][j];	//양 방향 전체의 합
		
		
			}
		}
		for(int i=0; i < result.length;i++) {
			for(int j=0; j < result[i].length;j++) {
				System.out.printf("%4d",result[i][j]);
			}
			System.out.println();
		}
		힌트)
		result[0][4] += score[0][0]
					+= score[0][1]
					+= score[0][2]
					+= score[0][3]
			[1][4] += [1][0]
		
		 */
		int[][] score = {
				{100, 100, 100}
				, {20, 20, 20}
				, {30, 30, 30}
				, {40, 40, 40}
				, {50, 50, 50}
				};
		int[][] result2 = new int[score.length+1][score[0].length+1];
		
		for(int i=0; i < score.length;i++) {
			for(int j=0; j < score[i].length;j++) {
				result2[i][j] = score[i][j];					//score를 result로 복사
				result2[i][score[0].length] += result2[i][j];	//[0][3]에 들어갈 결과값은 [0][0]~[0][2]의 합. 아래 행도 동일
				result2[score.length][j] += result2[i][j];	//[5][0]에 들어갈 결과값은 [0][0]~[4][0]의 합. 아래 행도 동일
				result2[score.length][score[0].length] += result2[i][j]; //전체의 합
		
		
			}
		}
		for(int i=0; i < result2.length;i++) {
			for(int j=0; j < result2[i].length;j++) {
				System.out.printf("%4d",result2[i][j]);
			}
			System.out.println();
		}
	}
}

