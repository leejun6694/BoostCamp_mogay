# Tutoring log

- apple 정책들의 변화에 관심을 갖고 근본적인 이유를 생각해보자

- Team Study
  - Bundle
  - Asset

- Networking Day
  - 내가 구현한 앱을 시현 in 판교
  - 기술담당자 or 인사담당자
  - 디자인보다는 내가 어떤 기술을 사용했는지
  - 외부 라이브러리는 최대한 쓰지 말자
    - 라이브러리에 대한 정보를 다 소개할 수 있으면 사용
    - 외부 라이브러리에 의존해야하는 현상이 일어날 수 있기 때문
  - 코드 한줄 한줄을 허투루 쓰지 말자
    - 코드 한 줄만으로도 한시간 면접이 가능
    - 코드 한 줄을 완전히 이해하고 사용
    - 아는척 하지말고 실수하자
  - 나중에 취업 공고에 조건이 많더라도 버리지 말자
    - 이상적인 사람은 거길 안가
    - 구인 공고가 안올라와 있더라도 가고싶으면 찔러보자
    - 공고가 안올라와도 메일이라도 한번 보내보고 견학이라도 가보자
    - 세 문단 정도의 약빤 자기소개서
  - 자기 명함 만들기 (독특하게?)
  - 주변 지인이 있다면 먼저 물어봐서 사전 조사를 하는 것도 하나의 방법
    - iOS 컴포넌스 참여 등

- WillTerminate
  - 자료를 저장해야함
  - Terminate는 보장이 안되므로 background
  - 앱이 백그라운드에 진입 시 자료를 저장
  - [참고자료](https://developer.apple.com/library/content/samplecode/StateRestore/Introduction/Intro.html)
  - [참고자료](https://developer.apple.com/library/content/featuredarticles/ViewControllerPGforiPhoneOS/PreservingandRestoringState.html)
  - [참고자료](https://www.raywenderlich.com/117471/state-restoration-tutorial)

- MVC pattern의 이점
  - 객체지향프로그램의 이점과 다른 것이 없다?
  - 객체지향
    - program paradigm
    - 우리가 프로그램을 어떤 시각으로 바라보는지
    - 객체 단위 상호작용
  - MVC
    - design pattern
    - 객체지향 기반을 가지고 개념적으로 나눔
  - 두 개를 비교할 수는 없음
  - Swift
    - 멀티 타입을 나타낼 수 있는 프로그램 언어
    - ~~내부는 class로 이루어져 있음~~ `틀렸습니다. 다시 확인해보세요`

- addTarget에 closure가 아닌 selector가 왜 쓰일까
  - setTarget이 아니고 addTarget인 이유 : 버튼 하나에 여러개 Target 가능
  - addTarget: Any?:selector
    - viewController -> selector를 찾아감 dynamic dispatch
    - 어떤 상황에서는 target, selector에 조건을 줄 수도 있음
    - 실행 중에도 selector가 바뀔 수 있기 때문
    - UIButton이 만들어질 때 closure가 없었음
    - Target -> self : controller가 인스턴스가 됬을 때의 자기 자신
    - swift는 안전한 코딩을 지향하므로 selector의 경로를 알려줘야함
    - storyboard에 버튼을 만들었다가 코드 상에서 연결을 지워버리면 버튼을 눌렀을 때 죽어버림 : unrecognized selector
    - 에러 부분에서 멈추는 디버깅을 이용
    - closure 또한 재사용이 가능

- Unit Test 실무에서 어떻게 사용
  - UI Test는 사용이 힘듬
  - [참고자료](https://www.objc.io/issues/15-testing/xctest/)
  - [참고자료](https://developer.apple.com/library/content/documentation/DeveloperTools/Conceptual/testing_with_xcode/chapters/04-writing_tests.html)
  - 기본 알고리즘 문제로 일단 테스트 하고 적용이 되면 프로젝트 모듈에 도입하자

- Bound vs Frame
  - Bound : 자신 좌표계의 크기
  - Frame : 슈퍼뷰에서의 크기와 좌표

- Responder Chain
  - view 어디든지 event 발생 가능
  - First Responder : 첫번째로 respond을 받을 대상, 주요 event를 누가 받을 것인가
  - becomeFirstResponder : 첫번째로 respond를 받겠다
  - Responder Chain에 대해서 이해하고 넘어가자
  - touch vs tap recognizer : tap을 인식, 조정 가능

- required init?
  - encoding, decoding
  - 아카이브 되어있던 정보를 decode를 할 때 정보들을 새로 정의해서 형식에 맞춰줘야 불러올 수 있다 (ex 상속)
  - vs awakeFromeNib

- Modal View
  - present
  - completion : 어디다 써먹을 수 있을까 고민해보기 (ex 화면 전환 - closure)

- UIControl vs UIResponder
  - UIResponder : 포괄적인 개념 - UIView 상속
  - UIControl : 항상 선택지가 존재 (state) - UIResponder 상속

- 180 Rotation
  - override var supportedInterfaceOrientations: UIInterfaceOrientationMask { return .all }
  - Orientation (버전마다 다르기 때문에 회전처리는 유의)

- Size Class 도 공부할 것

- annotation
  - delegate
  - alert

- 과제랑 상관없는 내용도 README에 추가하자
