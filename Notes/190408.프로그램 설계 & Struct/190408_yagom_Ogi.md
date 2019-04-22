
```import Cocoa
import Foundation

// Foundation : Foundation이 어떻게 구성되어 있는가, 왜 이것을 사용하는가 ?

struct Rabbit {
    
    let name: String // 고정되어있는 값이기 때문에 var(변수) 보다는 let(상수)이 상황적으로 맞다 !
    // 고정적으로 사용할 것 같으면 let을 사용할 수 있도록 한다.
    // 굳이 let과 var를 분리해놓은 이유는 무엇일까 ? : 1. let은 절때 바꿀 수 없다는 의미를 담고 있다.(나든 다른 사람이든간) , 바꿀 수 없겠다 라고 생각을 했을 때 let을 써야겠다는 생각을 갖는 습관.
    
    // developter.apple.com 활용법
    // 1. overview(어떤역할을 하는지 실체가 무엇인지!)  2. 필요한 부분 직접 topic을 통해 검색 3. reference를 통해 guide 문서 확인
    
    func jump() {}
    func hop(){
    print(name+"가 뜁니다.")
    }
    
    func sleep() {}
    
    func eat(something: String = "당근"){
        
    }
}

let banny: Rabbit = Rabbit.init(name: "바니")
let bunny: Rabbit = Rabbit.init(name: "버니")

print()


banny.hop()
bunny.hop()
// 메서드: 같은 함수더라도 객체의 특성에 따라 결과가 달라질 수 있다. (객체지향에서의 메서드 특성)
// 함수 : print와 같은 공용함수는 (위치가 어디든)어디서 출력을 하든 같은 결과값을 낼 수 있다.
// 어딘가에 속해있는 method는 자신이 호출되어지는 주체에따라 결과값이 다를 수 있다.

// 함수형 프로그래밍에서는 항상 똑같은 결과만 주는 함수를 가지고 프로그래밍을 한다.
// string이 어떤 타입으로 구성되어있는지 알아보기 !!(*** 찾아보기 ***)
```





