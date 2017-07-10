# MVC/MVP/MVVM Design Pattern

## MVC
![](http://cfile4.uf.tistory.com/image/2752874556C180140319E4)

> 개요

MVC 디자인 패턴은 제록스 팰러앨토 연구소에서 스몰토크 관련 일을 하던 Trygve Reenskaug이 1979년 최초로 소개했다.
MVC(Model-View-Controller)는 소프트웨어 공학에서 사용되는 디자인 패턴이며 사용자 인터페이스로부터 비즈니스 로직을 분리하여 애플리케이션의 시각적 요소나 그 이면에서 실행되는 비즈니스 로직을 서로 영향 없이 쉽게 고칠 수 있는 애플리케이션을 만들 수 있다.

> 구성요소

- Model : Application의 정보(데이터)를 나타내며 모델의 상태에 변화가 있을 때 Controller와 View에 이를 통보한다. 이와 같은 통보를 통해서 View는 최신의 결과를 보여줄 수 있고, Controller는 모델의 변화에 따른 적용 가능한 명령을 추가, 제거, 수정할 수 있다.
- Controller : View가 Controller에게 event 발생을 알리면 Controller는 그에 따라 어떻게 Model과 상호작용을 결정한다. Model에서 데이터가 변화되는 것에 따라 Controller는 View의 상태를 적절하게 업데이트하도록 결정할 수 있다.
- View : Model의 표현으로써 사용자가 Application과 상호작용할 때 Controller와 통신하는 책임 맡는다. View는 MVC 구조에서 Model에 대한 지식이나 상태에 대한 이해가 없고 종속되지 않으므로 보다 변화에 유연할 수 있다. Model의 정보는 Controller를 통해 가져온다.

> 장점

- 많은 사람들이 친숙하게 사용하기도하며 경험해보지 못했던 개발자도 쉽게 접근할 수 있다.
- 다른 패턴들에 비해 코드의 양이 가장 적다.
- 동시 개발이 가능하다.
- 분리된 역할로 인해 수정이 용이하다.
- 하나의 Model은 다수의 View를 가질 수 있다.

> 단점

- 대부분의 코드를 View에서 Model을 직접 호출하여 사용하므로 View와 Model 간의 결합도가 높다.
- View와 Model간의 높은 결합도로 테스트 코드를 작성하기 어렵다.
- Controller가 비대해지고 복잡도가 증가하여 MVC란 말이 Massive View Controller라고 이야기하기도 한다.

> 대표 프레임워크
- Spring MVC
- Ruby on Rails


## MVP
![](http://cfile2.uf.tistory.com/image/2550864556C18013059C89)

> 개요

MVC는 여러 파생 패턴을 가지고 있다. 그 중 (마이크로소프트가 사용했기 때문에) 가장 널리 알려진 것은 1990년대 초기부터 등장하기 시작한 MVP 패턴이다. 이 패턴은 View와 Model간의 coupling을 완화하기 위해 일련의 workflow wpdj rhkwjddmf Controller가 전부 담당하여 재사용성을 떨어뜨리는 MVC 패턴의 약점을 해결하기 위해 고안되었다.

> 구성요소

- Model : MVC와 동일하며 변화가 없습니다.
- View : MVC 디자인 패턴과 다르게 입력이 View에서 처리된다.
- Presenter : 본질적으로는 MVC의 Controller와 같지만, Presenter는 View의 인스턴스를 갖고 있으며 View와 1:1 관계이고, 그에 해당하는 Model의 인스턴스 또한 갖고 있기 때문에 View와 Model 사이에서 다리와 같은 역할을 한다. View에서 이벤트가 발생하면 Presenter에게 전달해주고 Presenter는 해당 이벤트에 따른 Model을 조작하고 그 결과를 바인딩을 통해 View에게 통보하여 View를 업데이트 시켜준다. MVC 패턴과는 다르게 Presenter를 통해 Model과 View를 완벽히 분리해 주기 때문에 View는 Model을 따로 알고 있지 않아도 된다.

> 장점

- Model과 View의 의존성이 완전이 사라졌다.
- Model은 Presenter의 요청만 수행하면 되므로 다른 요소와의 상호작용에 대해서 신경쓸 필요 없다.

> 단점

- Presenter와 View 간의 의존성이 크다. (View와 1대1 관계이기 때문에)
- MVC에 비해 필요한 Class의 수 증가.

> 파생

- Passive View Variant
- MVP Supervising Controller

> 대표 프레임워크

- .NET framework

## MVVM
![](http://cfile1.uf.tistory.com/image/25507E4556C1801305482E)

> 개요

MVVM(Model View ViewModel) 디자인 패턴은 2005년 Microsoft의 John Gossman이 소개한 WPF(Windows Presentation Foundation) 응용프로그램을 개발하기 위해 만들어진 아키텍쳐 설계 패턴이다. MVVM 패턴에서 뷰모델(ViewModel)은 뷰에 데이터를 제공하고 프리젠테이션 논리를 담당한다. 뷰는 양방향 바인딩(2-way Binding)과 바인딩 전파(Binding Propagation)를 사용해 이들과 뷰 요소를 연결한다. 뷰모델은 양방향 바인딩의 도움으로 뷰에 대한 정보 없이 작성되기 때문에 뷰 인스턴스 없이도 동작하고 테스트 가능하다. 최근에는 WPF와 Silverlight 외에도 Xamarin Forms(iOS/ Android/ Windows Phone), Angular.js, Ember.js, Knockout.js, RoboBinding(Android) 등의 도구를 통해 다양한 플랫폼에서 사용된다.

> 구성 요소

- Model : MVC와 동일하며 변화가 없습니다.
- View : 뷰는 뷰모델에 의해 보여지는 옵저버블 변수와 액션에 유연하게 바인딩됩니다.
- ViewModel : 뷰모델은 모델을 래핑하고 뷰에 필요한 옵저버블 데이터를 준비합니다. 또한 뷰가 모델에 이벤트를 전달할 수 있도록 훅(hook)을 준비합니다. 그러면서도 뷰모델이 뷰에 종속되지는 않습니다.

> 장점

- 개발기간 동안 개발자와 디자이너가 독립적으로 동시에 작업 할 수 있다. 디자이너는 View 쪽에 더 집중할수 있고 개발자들이 View model 과 Model 컴포넌트를 개발할때 샘플 데이터를 쉽게 생성할 수 있다.
- 개발자들이 View를 사용하지 않고도 ViewModel과 Model에 대해 유닛 테스트를 생성 가능하다. 또 ViewModel 에 대한 유닛 테스트는 View에서 사용할 때와 동일한 기능을 수행 할수 있다.
- View 코드를 건드리지 않고 응용 프로그램의 UI를 쉽게 재 디자인 할 수 있다. View의 새 버젼 기존 ViewModel과 함께 작동해야한다.
- 뷰의 추상화는 재사용할 수 있고(reusable) 테스트하기 쉽다(testable).
- 응용프로그램의 많은 부분이 뷰 독립적으로 설명되고 구현된다. 따라서 응용프로그램은 복잡한 컨트롤러 논리 없이 단순한 구조를 유지할 수 있다.

> 단점

- ViewModel 설계하는 것이 쉽지 않다.
- View 에 대한 처리가 복잡해질수록 ViewModel 에 거대해지게 되어 오버스펙이 될 수 있다.
- 플랫폼 제한적인 요소가 있다.


> 이건 몰랐지?

추상화(abstraction)는 MVVM 패턴의 뷰모델을 설명하며 빠뜨릴 수 없는 용어이다. 뷰모델이란 이름은 ‘뷰의 모형’을 뜻한다. 즉, 추상화된 뷰라는 의미다. 구동되는 응용프로그램에서 뷰는 UI 플랫폼이 제공하는 컨트롤들을 조합해 사용자에게 시각적으로 접근하지만 뷰모델은 이러한 뷰를 플랫폼 독립적인 공간에서 추상화한다. 뷰모델은 뷰를 추상화하기 위해 추상화된 뷰 상태(ViewState)를 유지한다. 예를 들어 뷰모델은 읽기와 쓰기가 가능한 문자열 속성을 통해 텍스트 입력기 컨트롤을 추상화한다. 데이터 목록을 보여주는 컨트롤에 대해서는 각 요소의 뷰 상태가 들어있는 컬렉션이 사용된다.

MVVM 패턴은 Data-Binding 방식을 통한 View와 Model간의 원천적인 코드 분리를 목적으로 한다. MVP에서 Presenter가 Model의 변화에 따라 View를 갱신하는 중계자 역할로서 View와 Model 사이의 loose-coupling을 지향했다면, MVVM의 ViewModel은 View의 속성을 ViewModel에 바인딩하여 ViewModel이 View를 갱신하는 코드가 불필요해지고, 따라서 ViewModel의 재사용성이 높아지고 단위 테스트도 훨씬 수월해진다는 장점이 있다.

> 대표 프레임워크

- ReactiveX

## Summary

| Parameter | MVC | MVP | MVVM |
| -------- | -------- | -------- | -------- |
| Input | Controller | View | View |
| Releationship | View and | View and Presenter | ViewModel and |
| View knows the Middle layer | No, View has no idea of controller  | Yes, View and Presenter know     | No, View doesn't know ViewModel |
| View knows the Data | Yes | No | No |

## 프로그램 설계에서 디자인 패턴이 왜 필요할까?

- 재사용성 : 각각의 객체들로 나누어져 있으므로 필요한 부분의 객체만 불러 다시 사용할 수 있다.
- 변화에 대비한 유연한 구조 : 코드간에 결합도가 낮으므로 코드 수정 발생시 해당 부분만 수정 가능 하다.
- 개발자와 디자이너 간의 역할분배 : 비즈니스 로직과 프레젠테이션 로직이 분리되게 되면 개발자는 비즈니스 로직에 더 집중할 수 있고 디자인이 바뀌는 경우에는 프레젠테이션 로직만 수정하면 된다.
- 유닛 테스트 : 모듈화되어 작은 단위로 테스트가 가능. 오류의 원인을 찾기가 쉬워진다.
- 협업 개발자들간의 의사소통 : 보편화된 디자인 패턴을 사용함으로써 개발자 간의 협업이 용이하고 많은 시간을 절약할 수 있다.


## 출처
- 프로그래머 이규원: envicase CTO
https://justhackem.wordpress.com/2017/03/05/mvvm-architectural-pattern/

- MVVM Pattern
https://msdn.microsoft.com/en-us/library/hh848246.aspx

- Xenomity Blog
http://blog.xenomity.com/entry/MVWModel-View-Whatever%EC%9D%98-%EC%9D%B4%ED%95%B4

- 공대인들이 직접쓰는 컴퓨터공부방
http://hackersstudy.tistory.com/71

- iOS Architecture Patterns - Bohdan Orlov
https://medium.com/ios-os-x-development/ios-architecture-patterns-ecba4c38de52
