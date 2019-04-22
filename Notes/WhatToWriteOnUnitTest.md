# Unit Test

:sweat: unit test 작성해야하는데 test 파일 앞에 앉아 뭘 써야되는지 1도 몰으겠는 나와 같은처지에 있는 분을 위해 작성한 글입니다.

### :pushpin: ​목차

[What is Unit Test?](#white_check_mark-what-is-unit-test-)

[What to Test?: Right - BICEP](#confused-what-to-test-----right---bicep)

[Boundary Condtion - CORRECT](#alien-boundary-condition---correct)

[What is CLEAN Unit Test ?](#what-is-clean-unit-test-)

[그외 고려할 점](#그외-고려할-점)

&nbsp;

&nbsp;

## :white_check_mark: What is Unit Test ?

작성한 코드 중에, 테스트 대상인 의미있는 부분을 실행해보는, 개발자가 작성한 코드 조각이다.

- 목적 : 개발자가 의도한 기능을 수행하는지 확인한다.
  그래서 가장 낮은 level의 테스트 라고도 한다. 성능, 인수테스트는 나중의 일이고 일단 개발자가 생각한대로 작동하는지 확인하는 테스트이기 때문이다.

- 왜 unit ? 의미 있는 단위의 코드를 대상으로 test 를 하기 때문이다.

&nbsp;

&nbsp;

## :confused: What to TEST ? :   Right - BICEP

이제 Test 필요성은 알겠는데 뭘 테스트 하라는거야…. 할 때 생각해 볼 질문들

'**무엇을 테스트해야 하는가?**' 에서 '**무엇**'을 생각나게 해줄 질문들 

&nbsp;

### :o: ​Right - 결과가 내가 의도한 것과 맞을까? 

코드가 내가 예상한 결과대로 나오는지 결과의 유효성 검사를 한다. 즉, 생각한대로 동작한다는 것을 증명하는 과정이다.

코드가 옳게, 맞게 동작하는지 알 수 있다는 것은 이미 요구사항과 예측되는 결과를 파악하고 있다는 의미이다. 
따라서 내가 짠 코드인데 맞게 동작하는지 아닌지 모른다면 코드랑 테스트코드를 짜는 것 자체가 시간낭비라고 한다. :fearful:

- Example
  - ladder game에서 height 5 설정했으면 buildLadder() method는 높이 5인 사다리가 return 해야 한다. (내 의도)
    사다리 높이가 5인지 검증한다. (test)

- 유의할 점 
  - 수정중인 시스템, 코드라면 테스트 데이터가 테스트 대상 코드보다 정확하지 않을 가능성이 높다.
  - 해당 테스트 데이터에서 실패가 나온다면, 코드를 보기 전에 데이터가 유효한지 먼저 확인해야 한다.

&nbsp;

### :straight_ruler: ​Boundary Condition - 경계 조건에서 잘 동작할까?

대부분의 버그가 보통 경계에 존재한다. 에러가 발생할 가능성이 큰 케이스를 테스트 해본다.

경계값 example

 - 제한된 숫자 크기 - 매개변수는 Int type인데 Int.max 보다 큰 값으로 호출하면?
 - 0으로 나누는 상황
 - array index boundary 등등...

&nbsp;

가능한 경계조건을 떠올릴 때, **CORRECT** 만 기억하자! :star:

 - **C**onformation 형식 일치 : 값의 형식이 기대한 형식과 일치하는가?
 - **O**rdering 순서 : 적절히 순서대로 되어 있거나 그렇지 않은 값인가?
 - **R**ange 범위 : 적당한 최솟값과 최댓값 사이에 있는 값인가?
 - **R**eference 참조 : 코드가 자기가 직접 제어하지 않는 외부 코드를 참조하는가?
 - **E**xistence 존재성: 값이 존재하는가 (null혹은 0이 아님, 집합안에 존재함 등)
 - **C**ardinality 개체수 : 확실히 충분한 값이 존재하는가?
 - **T**ime 시간 : 모든 것이 순서대로 일어나는가? 제시간에? 때 맞추어?

(자세한 CORRECT 항목에 대한 내용은 밑에 있다)

&nbsp;

### :left_right_arrow: Inverse 역관계 확인 - 반대로 해서 처음의 값이 나올까?

논리적 역 사용을 한다. 

- p -> q 방법을 테스트 할 땐,  반대로 q -> p 해서 처음의 값이 나오면 테스트 성공~

- Example
   - 매개변수의 제곱을 return하는 함수가 제대로 작동하는지 테스트

     제곱한 수의 제곱근 == 원래 수 

     ```swift
     func getSquare(of num: Double) {
       	return num * num
     }
     
     // unit test
     func testGetSqure() {
        Double num = 4.0
        Double squareNum = getSquare(of: num)
        XCTAssertEqual(num, sqrt(squareNum))
     }
     ```

- 유의할 점 : 두 루틴의 공통 에러가 있을 수 있음에 유의

&nbsp;

### :negative_squared_cross_mark: Cross-check 교차확인 - 다른 방법도 내 메소드랑 같은 값을 낼까?

다른 수단, 방법을 이용해서 메소드의 결과를 교차확인하는 검증 방법

어떤 값을 계산하는 방법은 여러가지 존재한다.

내가 방법1로 A라는 값을 구하면, A라는 결과를 내는 다른 방법2로 검증하는 방법이다.

Test 대상 메소드 이외의 다른 방법으로 구하는 메소드를 사용해서 결과가 같은지 확인하는 방법

- Example
  - 매개변수의 제곱값을 return 하는 함수 테스트 

    제곱값을 구하는 다른 방법 : swift library - pow()를 사용한 값과 같은지 확인

    ```swift
    func getSquare(of num: Double) {
      	return num * num
    }
    
    // unit test
    func testGetSqure() {
       Double num = 4.0
       Double testSqure = getSquare(of: num)
       Double librarySqure = pow(num, 2)
       XCTAssertEqual(testSqure, librarySqure)
    }
    ```

  - 각 방법별로 부분 합을 구해 전체 합이 맞는지 확인하기



### :heavy_exclamation_mark: ​Error 에러조건 강제로 만들어내기 - 이 조건에서 에러 처리를 잘 할까?

에러 조건을 강제로 만들어 내어, 해당 상황에서 적절히 핸들링, 처리 되는지 확인하는 방법

&nbsp;

&nbsp;

## :alien: Boundary condition - CORRECT

경계 값 케이스를 좀더 세분화 해서 질문해보기

&nbsp;

### 형식 일치 Conformance

특정 형식을 따르는 데이터를 형식에 맞게 처리하거나 생성할 수 있을까?

형식에 맞게 데이터를 잘 처리 하거나 잘 체크하는지 테스트한다.

형식에 맞지 않을 때 처리 방법도 생각해야 한다.

- Example
  - email 형식 데이터 - @의 위치를 기준으로 문자열 파싱하기, @가 없는 경우… 
  - ladder game - player 이름 쉼표,로 구분하여 입력 받기, 파싱 후 이름배열에 공백이 있는 경우..

&nbsp;

### 순서 Ordering

큰 데이터 모음에서 의도한 순서나 위치대로 데이터가 들어가는가?

- Example

  - ladder game에서 step(Bool)을 연속해서 나오게 하지 않기로 구현했다면, 이를 검증하는 테스트가 필요. 연속해서 step이 있는 사다리에 대해서 적절한 처리가 필요하다.

    ```swift
    func testCreateStepsInRow() {
      let steps: [LadderStep] = ladderGame.createStepsInRow()
      for i in 1..<steps.count {
        XCTAssertEqual(steps[i-1].exists && steps[i].exists, false)
        //true가 연속으로 나오면 fail
      }
    }
    ```

  - 정렬된 상태로 항상 유지되어야 하는 데이터라면, 제대로 된 순서로 정렬되어 있는지 검증하는 테스트가 필요하다.

&nbsp;

### 범위 Range

해당 변수가 의도에 맞는 범위의 값만 가지는가?

어떤 변수형이 필요하거나 원하는 값보다 더 크게 범위를 허용하는 상황을 말한다.

- Example

  나이를 표현하는 변수인데 Int로 선언해서 받는 경우, 음수나 2000살도 허용할 수 있게 된다

  좋은 객체 지향 설계에서는 이런 경우 단순히 기본형을 사용하지 않고 범위를 의도한대로 유지해주는 코드가 구현되어 있어야 한다.

&nbsp;

### 참조 Reference

메서드가 자신이 속한 객체가 아닌, 외부의 객체를 참조할 경우 해당 메서드가 제대로 동작할까?

자기 영역을 벗어난 외부의 객체를 참조할 경우, 이 객체에 따른 메서드의 동작도 테스트 해야한다.

- Example
  - ResultView에서는 이미 생성된 LadderGame 객체를 참조한다 - LadderGame객체가 생성되지 않았다면?
  - 웹 어플리케이션에서 고객 정보를 보여주려면 일단 고객이 먼저 로그인해 있는 상태를 기대한다.

&nbsp;

### 존재성 Existence

"주어진 것이 존재하는가?"

넘겨받거나 가지고 있는 모든 값에 대해 그 값이 존재하지 않거나, nil이거나, 0이라면?

- Example
  - InputView 에서 return 받은 player 이름 담긴 배열이 빈 배열이라면?

&nbsp;

### 개체 수 Cardinality

개수 세기

ex. player가 n명일 때, ladder의 step 개수는 n-1이어야 한다.

ex. 최근 순 주문 10개씩 전송하는 프로그램 - 언제 전송해야 하는지, 10개가 안채워져도 전송할 수 있는 지 등...

&nbsp;

### 시간 Time

메서드들 순서가 뒤섞여 호출시에 어떤 일이 일어날까?

&nbsp;

&nbsp;

## What is CLEAN Unit Test ?

좋은, clean한 unit test의 특성 - **FIRST**

&nbsp;

####  Fast

unit test는 실행속도가 빨라야 함. 그래야 자주 실행해보고 확인할 수 있다.

&nbsp;

####  Independent 

unit test는 각 test method가 독립적이어야 한다. 즉, 서로에게 영향을 주거나 상호의존적이면 안된다.

문제가 하나라면 한 method만 통과 못하도록 해야함.

서로 의존적이라면 한 test method의 fail이 연속적인 여러개의 test method를 fail로 이어질 수 있다.

test 하는 목적이 error의 위치를 쉽게 파악하기 위함인데 이러면 test하는 의미가 없다.

&nbsp;

####  Repeatable

어떤 환경에서든 repeatable해야 한다. (반복해서 실행할 수 있어야 한다)

니 컴에서 안돼? 내 컴에서는 되는데? :x: 

&nbsp;

####  Self-Output

test는 boolean output을 내야 함 - **pass** or **fail**

Test 성공했는지 여부를 성공/실패로 알아야지 log 파일을 매번 확인해서 알 수 있으면 **망**:poop:이라는 뜻

&nbsp;

####  Timely 

시기적절하게.. happens at a moment when it's useful, effective, or relevant

그 시기 = production code 작성 전

Test code 작성 후, production code 작성!

순서가 바뀌면 production code가 test 불가능한 코드가 되어있을 수도 있다..

&nbsp;

## 그외 고려할 점

#### Single Assert Rule

- one assert per test : 한 test method 당, assert method를 한번만 사용해야된다는 학파도 있음
- 장점 : 빠르고 쉽게 이해할 수 있음
- 좋은 가이드라인이 될 수 있다
- assert를 최소화 하는 노력으로 실천 가능

&nbsp;

### Single concept per Test

- independent 특성과 일맥상통하는 개념
- 한 test는 한가지 개념의 test만 하도록!

&nbsp;

### Clean test

- Can be documentation
  클린테스트는 그 자체만드로 documentation이 될 수 있다.
- when it's supposed to pass, when it's supposed to be fail.
  실패와 성공 케이스를 보여주기 때문
- all about Readability
  가독성이 좋아진다면 계속해서 유지하고 제 기능을 하는 test code를 사용할 수 있을 것

&nbsp;

&nbsp;

## Reference

- _Clean Code by Robert.C.Martin_

- _실용주의 프로그래머를 위한 단위 테스트 with JUnit by David Thomas and Andrew Hunt_