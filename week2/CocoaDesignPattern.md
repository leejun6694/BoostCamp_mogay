# Cocoa Touch Framework's Design Pattern

![Cocoa version of MVC as a compound design pattern](https://developer.apple.com/library/content/documentation/General/Conceptual/CocoaEncyclopedia/Art/cocoa_mvc.gif)

기존의 MVC 디자인 패턴은 Model이 View에게 직접적인 Notify가 가능하고 View가 Model에게 데이터의 변화를 전해줄 수 있었다. 하지만 Cocoa Touch Framework에서의 MVC 디자인 패턴은 Model과 View간의 직접적인 연결을 불가하고 반드시 Controller를 통해 각각을 update한다.

## MVC as a Compound Design Pattern
#### Composite
![The view hierarchy, visual and structural](https://developer.apple.com/legacy/library/documentation/Cocoa/Conceptual/CocoaFundamentals/Art/view_hierarchy.gif)

Composite pattern이란 객체들의 관계를 트리 구조로 구성하여 부분-전체 계층을 표현하는 패턴으로, 사용자가 단일 객체와 복합 객체 모두 동일하게 다루도록 한다. Composite pattern은 대표적으로 중첩된 view로 이루어진 view hierarchy에서 사용된다. 이러한 디스플레이 구성 요소는 window부터 table view와 같은 복합 view, button과 같은 개별 view들에 이르기까지 다양하다. 사용자의 입력 및 표시는 어떤 수준의 복잡한 구조에서도 수행될 수 있다.

#### Strategy
strategy 패턴은 동적으로 알고리즘을 교체할 수 있는 디자인 패턴이다.
컨트롤러 객체는 하나 이상의 뷰 객체에 대한 전략 패턴을 구현한다. 뷰 객체는 시각적 측면을 유지하고, interface behavior의 응용 프로그램 별 의미에 대한 모든 결정을 컨트롤러에 위임한다.
유저가 view를 조작하면 결과적으로 이벤트가 생성된다. 컨트롤러 객체는 이 이벤트를 받아서 특정 방식으로 해석한다 즉, Strategy 를 적용한다. 이 Strategy는 모델의 객체 상태를 변화시키거나, 뷰 객체의 동작이나 모양을 변경시키도록 요청한다.


#### Observer
대부분 객체 상태 또는 내부 값이 바뀌면 그 값을 참조하는 의존적인 객체에 알려주고 새로운 값으로 변경해야만 한다. 이런 경우 관련된 객체들 사이 결합성이 높아진다. 옵저버 패턴은 특정 객체의 상태가 바뀌었을 때, 해당 객체와 관련이 있는 다수 객체에 한꺼번에 알려주기 위해서 자주 사용하는 패턴이다. Publish-Subscribe 패턴이라고도 한다. 특정 객체의 상태 변화에 대해 미리 구독할 객체들(observers)을 등록(subscribe)해놓고, 상태 변화가 발생하면 통보(publish)하는 방식으로 동작한다.

#### Command
![](https://upload.wikimedia.org/wikipedia/commons/8/8e/Command_Design_Pattern_Class_Diagram.png)

Command design pattern은 command, receiver, invoker, client로 구성된다. command 객체는 receiver 객체를 가지고 있으며 receiver의 method를 호출하고 이에 receiver는 자신의 method를 수행한다. command 객체는 별도로 invoker 객체에 전달되어 command를 발동하며 필요에 따라 invoker 객체는 command에 대한 기록을 남길 수 있다. 한 invoker 객체에 다수의 command 객체가 전달될 수 있다. client 객체는 invoker 객체와 하나 이상의 command 객체를 가지고 있는데 어느 시점에 command를 수행할지 결정한다.

#### Mediator
Mediator 디자인 패턴은 객체들이 상호 작용하는 방식을 캡슐화한 객체를 정의한다. 각각의 객체가 서로 일대일 통신하지 않고 중간에 중재자를 둬서 개별 객체간의 결합을 느슨하게 만들고 독립적으로 상호작용하게 한다. 따라서 이러한 객체는 재사용이 가능한다.
이 패턴의 "중재자 객체"는 시스템의 객체 간 복잡한 통신 및 제어 로직을 중앙 집중화한다. 이러한 객체는 중재자 객체의 상태가 변경 될 때, 이를 알려주고 중재자 객체의 요청에 응답한다.

## Cocoa Design Pattern
- 객체 사이의 결합성을 줄여주는 패턴 - 예
    - singleton: FileManager, UIApplication, UIScreen 등
        - 싱글턴은 '인스턴스가 딱 하나만 있는 객체'를 의미한다. 앱 내부에서 공통적으로 사용하는 객체 인스턴스가 딱 하나만 있기 때문에 다른 객체들이 서로 공유해서 사용할 수 있다.
    - Observer: Notification, KVO
        - 옵저버 패턴은 특정 객체의 상태가 바뀌었을 때, 해당 객체와 관련이 있는 다수 객체에 한꺼번에 알려주기 위해서 자주 사용하는 패턴이다. 옵저버의 메서드를 지정하기 위해 셀렉터 패턴도 함께 사용된다.
        - Otherwise, 대부분 객체 상태 또는 내부 값이 바귀면 그 값을 참조하는 의존적인 객체에 알려주고 새로운 값으로 변경해야만 한다. 이런 경우 관련된 객체들 사이 결합성이 높아지는 문제점 발생 -> 옵저버 사용
    - Chain of Responsibility: UIResponder
        - 응답할 가능성이 있는 객체들을 체인 형태로 차례대로 확인하고 더 이상 응답할 객체가 없을 때까지 반복해서 확인하는 방식.
        - Otherwise, 특정한 메시지에 응답할 객체를 바인드하거나 지정하게되면 결합성이 높아진다. -> 체인
        - Interface빌더에 1이 그려진 사각형 모양: 처음 응답 객체(First Responder)  = 응답 체인의 처음 항목을 지칭하는 프락시 객체.
    - Invocation(Command): NSInvocation(Target-Action)
        - 커맨드 패턴: 요청객체(client), 수신객체(receiver) 호출객체(invoker), 객체 명령(command) 기존 명명
        - selector와 target을 지정, 인자값을 넘겨 타깃의 셀렉터 호출

- 객체 내부의 복합성을 감춰주는 패턴 - 예
    - Cluster : NSNumber, NSData, NSArray, NSDictionary,
        - 세부 클레스를 지정하지 않고 관련된 클래스 패밀리를 생성할 수 있는 인터페이스를 제공한다.
        - 팩토리 추상화 = 클래스 클러스터
    - Facade : UIImage
        - 객체 생성을 하나의 팩토리 클래스에서 추상화했던 클래스 클러스터와 비슷하다. 내부 객체들의 복잡한 관계를 감추고 하나의 클래스가 인터페이스를 모두 담당하는 패턴이다.
        - 여러 이미지 포맷 처리, 압축 데이터 처리, 그리는 방식, 헤더 데이터 구조 등 이미지와 관련된 내부 구조를 자세히 모르더라도 이미지 클래스 인터페이스 하나로 거의 모든 동작을 실행한다.
    - Bundle : Info.plist
        - 실행파일과 프로그램에서 사용하는 인터페이스, 문자열, 이미지, 음악 같은 리소스를 디렉터리에 구조적으로 묶어놓은 것
    - Proxy : UIAppearance, NSProxy, NSDistanceObject
        - 다른 객체를 감싸거나 대신해서 접근하는 기능을 제공

## 출처

- strategy 패턴
https://zetawiki.com/wiki/Strategy_패턴
- Apple developer
https://developer.apple.com/legacy/library/documentation/Cocoa/Conceptual/CocoaFundamentals/CocoaDesignPatterns/CocoaDesignPatterns.html#//apple_ref/doc/uid/TP40002974-CH6-SW6
