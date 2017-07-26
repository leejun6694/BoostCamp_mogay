# Life Cycle Method

![ViewController 생명주기](https://developer.apple.com/library/content/referencelibrary/GettingStarted/DevelopiOSAppsSwift/Art/WWVC_vclife_2x.png)

## 부모의 Life Cycle Method를 호출하는 이유

* Apple의 UIViewController life cycle method 정책을 기반으로 상속받아 코드를 작성하기 위해
    * 매 출시마다, Apple은 운영 체제를 구동하는 프레임 워크와 라이브러리를 조정 및 최적화 한다. 이것은 대개 low level API에 영향을 주는 변경을 포함한다. 이러한 low level API를 기반으로 구축 된 API가 자주 변경되지는 않지만, Apple이 구축 한 API에 대한 Apple의 개선 사항으로 인해 여전히 이점이 있다.
* Custom UIViewController를 상속받아 사용할 때 부모 UIViewController에서 재정의된 Life Cycle Method를 포함하기 위해

## 부모 클래스의 메서드를 호출하지 않으면 발생할 수 있는 일
기본적으로 부모 클래스에서 작성된 Life Cycle Method은 무시되고 자식 클래스에서 재정의한 Life Cycle Method로 호출된다.

> 임의로 지정한 UIViewController를 상속 받았을 때
##### CODE
```swift
class PrintingViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print("PrintingViewController")
    }
}

class UserViewController: PrintingViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        print("UserViewController")
    }
}
```
UserViewController를 initial view controller로 실행해보자.

##### 출력결과
```
PrintingViewController
UserViewController
```
UserViewController가 실행되면서 상속받은 PrintingViewController의 viewDidLoad() 내용도 실행된다.
따라서 "PrintingViewController", "UserViewController" 모두 출력.

##### CODE
```swift
class PrintingViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print("PrintingViewController")
    }
}

class UserViewController: PrintingViewController {
    override func viewDidLoad() {
        // super.viewDidLoad()

        print("UserViewController")
    }
}
```
이번엔 UserViewController의 viewDidLoad()에서 super class의 내용을 상속받지 않고 실행해보자.
예상되는 결과로는 "PrintingViewController"이 출력되지 않는 것이다.

##### 출력결과
```
UserViewController
```
예상과 같이 super class 내용을 상속받지 않았으므로 "PrintingViewController"이 출력되지 않았다.

> 결론

UIViewController의 life cycle method를 보면 다음과 같다
```swift
open func viewWillAppear(_ animated: Bool) // Called when the view is about to made visible. Default does nothing

open func viewDidAppear(_ animated: Bool) // Called when the view has been fully transitioned onto the screen. Default does nothing

open func viewWillDisappear(_ animated: Bool) // Called when the view is dismissed, covered or otherwise hidden. Default does nothing

open func viewDidDisappear(_ animated: Bool) // Called after the view was dismissed, covered or otherwise hidden. Default does nothing
```
각 method의 주석 내용과 같이 UIViewController의 method들이 가지고 있는 default 값은 아무것도 없다. 허나 우리가 Apple의 UIViewController를 상속받아 사용하고 있는 이상 method 사용 시에 부모 클래스의 내용을 상속 받아 쓰는 것은 좋은 습관이라 할 수 있겠다.

## 번외 - LoadView()
뷰 컨트롤러는 view property가 요청될 때 loadView()를 부른다.
loadView()의 역할은 Controller가 가지고 있는 view 프로퍼티에 view를 생성하고 할당한다.

뷰를 수동으로 만들려면 이 메서드를 재정의 할 수 있다. 생성한 뷰는 고유 한 인스턴스 여야하며 다른 뷰 컨트롤러 객체와 공유하면 안된다.
이 메서드를 사용자 지정 구현하면 super를 호출하면 안된다.
