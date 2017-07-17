# Thread

## Thread란
    프로그램 내에서 실행되는 흐름의 단위
    모든 프로세스의 내부에는 최소 하나 이상의 thread가 작동

## Thread가 필요한 이유
- MultiThread의 장점
    - Responsiveness : 하나의 thread가 block되어도 다른 thread는 계속 수행 가능
    - Resource Sharing : 하나의 process 내에서 thread들은 코드, 데이터, 파일 등의 자원을 서로 공유
    - Economy : process 전환 속도보다 thread의 전환 속도가 빠름, 따로 메모리가 필요치 않음
    - Utilization : CPU 여러개를 활용 가능

- process 내에 main thread만 있다면 여러 작업을 끝내기 위해 process 작동이 일시적으로 멈출 수 있는데 multithread 방법을 이용하면 위와 같은 장점을 얻으면서 여러 작업을 동시에 처리할 수 있다

## iOS Thread
- Alternatives to Threads
: Thread는 concurrency를 지원하는 방법 중 상대적으로 low-level이며 복잡한 방법임. thread를 사용할 때 설계에 만전을 기하지 않는다면 동기화와 타이밍 문제에 직면하게 됨. 또 thread를 굳이 써야할 정도의 task인지를 확실하게 정의해야함. thread는 CPU와 메모리에 어마어마한 overhead를 부여하게된다. 굳이 이런 overhead를 감내할 필요가 없다면 아래 설명하는 Alternatives to Threads를 고려해보자.
    
    - Operation objects
        : Operation & OperationQueue 

    - Grand Central Dispatch (GCD)
        : Grand Central Dispatch

    - Idle-time notifications
        : NSNotificationQueue에 Notification을 넣고 idle-time 옵션을 준다. 해당 NSNotificationQueue는 run loop가 idle 상태가 되었을 때, notification을 전달하여 수행한다.

    - Asynchronous functions
        : Cocoa API상에서 함수 자체가 asynchronous excution을 하게 설계된 것들이 있다. 이들을 thread 대용으로 활용할 수 있다.

    - Timers
        : NSTimer나 CFRunLoopTimer를 사용하면 thread를 사용하기에 너무 하찮은 작업들을 주기적으로 반복 동작 시킬 수 있다.

    - Separate processes
        : threads보다 조금 무겁지만 task가 당신의 애플리케이션과 미약하게 관련되어 있는 거라면 유용하다.

- Thread 구현

    - Cocoa threads
        : NSThread 클래스를 통하여 구현한다. 또는 NSObject 클래스에서 'performSelectorInBackground:withObject:' 메소드를 사용하여 새로운 thread에 실행 로직을 부여할 수 있다.

    - POSIX threads
        : POSIX thread는 thread를 생성하기 위한 C기반의 인터페이스이다. Cocoa application을 구현하지 않는다면 POSIX thread가 thread를 사용할 수 있는 가장 손쉬운 방법이 될 것이다.

    - Multiprocessing Services
        : 이는 오래된 방식으로 OS X에서만 사용 가능하다. 

        - POSIX (Portable Operating System Interface) : 서로 다른 UNIX OS의 공통 API를 정리하여 이식성 높은 유닉스 응용 프로그램을 개발하기 위한 목적으로 IEEE가 책정한 애플리케이션 인터페이스 규격.


- Inter-thread Communication

    - Direct messaging
        : 다른 thread에게 seletor를 수행하게 만들 수 있다. 이 방식을 통하여 해당 thread에 메시지를 전달할 수 있다.

    - Global variables, Shared memory & objects
        : thread 사이에 전역 변수, 공유 객체, 메모리 shared block을 이용하여 정보를 교환할 수 있다. 이 방법은 다른 통신 방법에 비해 단순하고 빠르지만 동기화 문제에 대한 무결성을 보장해야 한다. 이를 보장하지 못할 경우엔 race condition, 데이터 오류, crash 등의 문제를 발생시킬 수 있다.

    - Conditions 
        : condition은 thread가 코드의 일부분을 제어하기 위한 동기화 수단이다. 

    - Run loop sources 
         : 사용자 정의 Run loop source 는 스레드에서 응용 프로그램 특정 메시지를 수신하도록 설정 한 것이다. 스레드가 이벤트 중심이기 때문에 loop source 를 사용하면 스레드가 자동으로 절전 모드로 전환되어 스레드의 효율성이 향상된다.

    - Ports & sockets 
        : 포트 기반 통신은 두 스레드 간의 통신에보다 정교한 방법이지만 매우 신뢰할 수있는 기술이기도합니다. 더 중요한 것은 포트와 소켓을 사용하여 다른 프로세스 및 서비스와 같은 외부 엔터티와 통신 할 수 있다는 것입니다. 효율성을 위해 포트는 실행 루프 소스를 사용하여 구현되므로 포트에서 대기중인 데이터가 없을 때 스레드가 잠자기 상태가됩니다.

    - Message queues
        : 데이터를 넣고 빼기 쉬운 추상적 구조의 큐이다. 메시지 큐는 단순하고 편리하지만 다른 communication에 비해 효율적이지 않다.

    - Cocoa distributed objects
        : port-based 방식인 쌍당한 overhead를 발생시키므로 사용을 지양하자. 프로세스간 Communitate 할때 사용하자.


- Design Tips

    - Thread의 직접 생성을 피해라
    - Thread를 계속 일하게 만들어라
    - 공유 데이터 구조를 피해라
    - User Interface는 main-thread에서 관리해라
    - 예외 처리를 명확하게 해라
    - Thread를 없앨 때는 명확하게 해라
    - Thread-safe를 보장하는 라이브러리를 사용해라

## Cocoa Touch Framework Thread ex

- main method 실행 시 스레드가 자동생성 된다.

- event 발생할 때 스레드가 자동생성 된다.

- delegate 프로토콜을 구현한 뷰를 클릭할 때 스레드가 자동생성 된다.

## Foundation Framework Thread ex

### Foundation Framework 에서 Thread를 다루는 방식

- Run Loop Scheduling
    - class RunLoop : 입력(event, notification)을 관리하는 프로그래밍 방식의 인터페이스 제공
    - class Timer : 시간 간격이 경과 한 후에 시작되어 지정된 메시지를 대상 객체로 보내는 타이머
    
- Threads and Locking
    - class Thread : 실행 스레드
    - protocol NSLocking : Lock object를 정의하는 클래스에 의해 구현되는 프로토콜
    - class NSLock : 동일한 app 내에서 여러 스레드 실행 작업 조정
    - class NSRecursiveLock : 교착 상태가 없이 동일한 스레드에서 여러 번 획득 할 수있는 Lock.
    - class NSDistributedLock : 여러 호스트의 여러 응용 프로그램이 파일 같은 일부 공유 자원에 대한 액세스를 제한하는 데 사용할 수있는 Lock
    - class NSConditionLock : 특정 사용자 정의 조건과 연관 될 수있는 잠금
    - class NSCondition : POSIX 스타일 조건에 사용되는 의미를 따르는 조건 변수

- Operations
    - class OperationQueue : 일련의 작업 실행을 조정하는 큐
    - class Operation : 단일 작업과 관련된 코드 및 데이터를 나타내는 추상 클래스
    - class BlockOperation : 하나 이상의 블록의 동시 실행을 관리하는 작업


### Details
#### Thread
Objective-C, Swift 메서드를 자체 실행 스레드에서 실행할 때 사용한다. 스레드는 긴 태스크를 수행 할 필요가있을 때 유용하지만, 나머지 애플리케이션의 실행을 막지는 못한다. 특히, 스레드를 사용하여 사용자 인터페이스 및 이벤트 관련 조치를 처리하는 응용 프로그램의 메인 스레드의 실행을 막기위해 사용할 수 있다. 또한 스레드를 사용하여 큰 작업을 여러 개의 작은 작업으로 나눌 수 있으므로 멀티 코어 컴퓨터에서 성능이 향상 될 수 있습니다.

- 첫 번째 방법: Thread 클래스를 subclassing한 후 main() 메소드를 override하고 새로운 인스턴스를 생성한 후 start() 메소드를 호출
```swift
class BackgroundTaskThread: Thread {
    override func main() {
        // Background Task
    }
}

let thread = BackgroundTaskThread()
thread.start()
```

- 두 번째 방법: background에서 실행할 작업을 메소드로 구현한 후 새로운 Thread 인스턴스를 생성할 때 전달
```swift
let thread = Thread(target: 타깃, selector: #selector(백그라운드에서 실행할 메서드), object: 호출 시점에 전달할 객체)
thread.start()
```

- 세 번째 방법: detachNewThreadSelector(_:) 메소드를 호출 (두 번째 방법과 달리 호출과 동시에 background thread가 자동으로 시작되므로 별도로 start() 메소드를 호출할 필요가 없다)
```swift
Thread.detachNewThreadSelector(#selector(백그라운드에서 실행할 메서드), toTarget: 타깃, with: 호출 시점에 전달할 객체)
```

- 네 번째 방법: detachNewThreadWithBlock(_:) 메소드를 통해 background thread에서 실행할 작업을 block으로 구현
```swift
Thread.detachNewThread {
   // Background Task
}
```

#### Operation
Operation 클래스는 모두 스레드에 안전한 클래스이다. 그래서 별도의 동기화를 구현하지 않고 여러 스레드에서 안전하게 접근할 수 있다.

```swift
class MyOperation: Operation {
    var index: Int?
    
    override func main() {
        if let index = self.index {
            print("From My Operation \(index)")
        }
    }
    
    init(index: Int) {
        super.init()
        self.index = index
    }
}

```

MyOperation이라는 Operation을 정의

#### OperationQueue
Operation Queue는 Operation의 실행을 관리한다.
직렬큐(serial Queue), 동시큐(Concurrent Queue) 타입으로 나누어진다.

```swift 
class MyWork {
    let queue = OperationQueue()
    init() {
        self.queue.addOperation(MyOperation(index: 0))
        self.queue.addOperation(MyOperation(index: 1))
        self.queue.addOperation(MyOperation(index: 2))
        self.queue.addOperation(MyOperation(index: 3))
        self.queue.addOperation(MyOperation(index: 4))
    }
}

let work = MyWork()
```

실제로 큐를 만들어서 인스턴스를 만들면 병렬작업이 실행된다.

##### 결과
From My Operation 3
From My Operation 0
From My Operation 4
From My Operation 1
From My Operation 2

Operation Queue는 대개 Operation 을 수행하는 데 사용되는 **스레드**를 제공한다. Operation Queue는 **libdispatch** 라이브러리 (**Grand Central Dispatch**라고도 함)를 사용하여 Operation의 실행을 초기화합니다. 따라서 비동기 또는 동기 작업으로 지정되었는지 여부에 관계없이 Operation 은 항상 별도의 스레드에서 실행됩니다.

#### BlockOperation
BlockOperation 클래스는 블록(클로저)으로 구현된 코드를 캡슐화한다.
```swift
let op = BlockOperation {
    // Background Task
}

op.addExecutionBlock {
    // Background Task
}
 ```


## 출처

https://developer.apple.com/documentation/foundation/processes_and_threads

http://horajjan.blog.me/220888295104

http://dolfalf.tistory.com/145 [악당잰의 연구실]

http://seorenn.blogspot.kr/2014/06/swift-nsoperationqueue.html