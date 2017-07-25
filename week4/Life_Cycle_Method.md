# Life Cycle Method

![ViewController 생명주기](https://developer.apple.com/library/content/referencelibrary/GettingStarted/DevelopiOSAppsSwift/Art/WWVC_vclife_2x.png)

## UIViewController 클래스를 상속받은 클래스에서 부모의 Life Cycle Method를 호출하는 이유

* Apple의 UIViewController를 기반으로 Subclassing 하려고
* Custom UIViewController를 상속 하려고

## 부모클래스의 메서드를 호출하지 않으면 발생할 수 있는 일에 대해 탐구해보세요

* Apple이 UIViewController를 다루는 정책이 달라졌을때
    * 만약 애플이 super class의 구현을 바꾸게 되면 코드가 이상하게 작동될 수도 있음

* 임의로 지정한 UIViewController를 상속 받았을 때
```swift
class PrintingViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view has loaded")
    }
}

class UserViewController: PrintingViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // do view setup here
        // If you don`t call super.viewDidLoad()
        // You can`t print("view has loaded")
    }

}
```

## LoadView()
뷰 컨트롤러는 view property가 요청될 때 loadView()를 부른다.
loadView()의 역할은 Controller가 가지고 있는 view 프로퍼티에 view를 생성하고 할당한다.

뷰를 수동으로 만들려면 이 메서드를 재정의 할 수 있다. 생성 한 뷰는 고유 한 인스턴스 여야하며 다른 뷰 컨트롤러 객체와 공유하면 안된다. 이 메서드를 사용자 지정 구현하면 super를 호출하면 안된다.

뷰의 추가 초기화를 수행하려면 viewDidLoad () 메소드에서 수행하라