# Dependency Manager for iOS

- CocoaPods
- Carthage
- Swift Package Manager
- VendorKit
- CocoaSeeds
- GitSubmodule
- Xcode Maven

## CocoaPods
CocoaPods는 iOS, macOS등의 플랫폼에서 개발을 할 때, 오픈소스 라이브러리를 좀 더 쉽게 찾고 사용할 수 있게 중앙 집중화된 환경을 제공하는 의존성 관리도구이다. 이러한 CocoaPods는 Podfile을 통해 라이브러리들을 관리하는데 Podfile은 현재 내가 진행중인 프로젝트에 생성하며 내용은 다음과 같다.
```
//Podfile example
platform :ios, '10.0'
use_frameworks!

target 'MyApp' do
  pod 'AFNetworking', '~> 2.6'
  pod 'ORStackView', '~> 3.0'
  pod 'SwiftyJSON', '~> 2.3'
end
```
어떤 라이브러리가 해당 프로젝트에 종속되고 버전이 어떻게 되는지 그리고 새로운 버전의 라이브러리가 존재할 경우 어떻게 설치할 것인지 등에 대한 정보를 담고 있어 명시적으로 의존성을 확인할 수 있다. (라이브러리에 대한 정보는 https://cocoapods.org/ 사이트를 통해 확인할 수 있다)
```
pod install
```
xCode 기존 프로젝트 디렉토리에서 위의 명령어로 프로젝트와 라이브러리들을 연결할 수 있다. 이 때, Podfile에 포함된 라이브러리들은 4가지 소스(HTTP/SVN/Git/Mercurial) 타입으로 다운로드가 가능하다.
명령어를 통해 연결을 하면 xcworkspace 확장자의 xCode 프로젝트가 생성되는데 이 프로젝트에서 라이브러리들을 import해서 사용할 수 있다.
각 오픈소스가 어떤 의존성과 설정이 필요한지를 알고 싶다면 Spec을 확인해 보면 된다. key-value 방신의 맵으로 이루어져 있기 때문에 프로그래밍은 불가능하며 제공되는 설정만 사용할 수 있다.


## Carthage
#### 특징
- Swift로 작성된 패키지
- Available on iOS 8 or later (or any version of OS X).

#### 장단점

##### 장점

- 프로젝트를 통합하지 않음.

- Supports submodules. 

- 카르타고의 경우 lib파일을 생성해주고 그것을 추가하는 형태로 기존 방식유지.

- Decentralized. There is no single point of failure. Your dependencies are fetched from their original repositories.

- 환경 의존도 낮음. (100% Swift로 되어 있어 CocoaPods와 다르게 각각의 환경에서 Ruby버전차이로 발생하는 문제가 없음)

- 커뮤니티 활성화가 높음(버그가 있으면 대체로 1일이내 수정 PR이 전송됨)

##### 단점

- Run Script를 설정해줘야 한다는 것

- 등록된 라이브러리의 양이 CocoaPods에 비해 빈약

#### 사용 방법

1. carthage 설치 

    1-1-1. Homebrew (brew로 설치하는 방법)
    
        $ brew update
        $ brew install carthage

    1-1-2. Installer (pkg로 설치하는 방법)

        $ https://github.com/Carthage/Carthage/releases
        
    1-1-3. From source (직접 설치파일 생성)
    
        clone the master branch of the repository, then run make install. Requires Xcode 8.3 (Swift 3.1).
        
        
2. 라이브러리 프레임워크 설치

    2-1. 라이브러리를 설치 할 프로젝트 root에서 touch 커맨드를 이용하여 빈 Cartfile 을 생성
    
        $ touch Cartfile
        
    2-2. Xcode 를 이용하여 Cartfile 을 수정

        $ open -a Xcode Cartfile
        
    2-3. Cartfile 안에 다운받을 라이브러리들을 추가 하기 위해 해당 라인들을 입력

        github "Alamofire/Alamofire" == 2.0
        github "SwiftyJSON/SwiftyJSON" ~> 2.3.0

    - == 2.0 - 2.0 버전을 내려받아라
    - \>= 2.0 - 2.0 버전보다 큰 버전을 내려 받아라
    - ~> 2.0 - 2.0 버전과 호환되는 어떤 버전을 내려받아라

    2-4. 저장 후에 커맨드 라인에서 carthage 를 update

        $ cartfile update //전체 빌드
        $ carthage update --platform iOS //iOS만 빌드

    - 옵션에 따라 선택

3. 라이브러리 프레임워크 추가

    3-1. Carthage 폴더에 있는 프레임워크 (.framework) 파일들을 Project Setting 에서 Linked Frameworks and Libraries 에 추가
    
    3-2. 그리고 프로젝트 타겟의 Build Phases 탭에서 + 버튼을 눌러서 Run Script 를 추가 하고, 다음 줄을 입력

        /usr/local/bin/carthage copy-frameworks
        
    3-3. 마지막으로, Input files 에 + 버튼을 눌러서 프레임워크 주소 들을 입력

        $(SRCROOT)/Carthage/Build/iOS/Alamofire.framework
        $(SRCROOT)/Carthage/Build/iOS/SwiftyJSON.framework
        
4. 프레임워크 업데이트

        carthage update Charts 또는 carthage update Charts Result



## Swift Package Manager
스위프트 패키지 매니저는 소스코드의 배포를 위한 툴입니다. 자신의 코드를 공유하고 다른 사람들의 코드를 모듈이라는 단위로 재활용하기 쉽게 도와준다. 이 툴은 스위프트 패키지들을 컴파일하고 링크하고, 의존성과 버전을 관리하고, 유연한 배포와 협업 모델을 지원하게 된다. 스위프트 패키지 매니저는 Apple이 공식적으로 지원하는 라이브러리 관리 툴로, 스위프트로 작성해서 사용한다. Cross-platform을 지원한다. 아직 Xcode와의 완벽한 연동은 지원되지 않는다.

### 용어
#### 패키지
소프트웨어, 응용프로그램, 데이터의 ‘배포판’을 칭한다. 또한 패키지는 메타 데이터를 포함하는 특성을 지니고 있다.
#### 패키지 매니저
설치, 업데이트, 설정, 삭제를 자동화해주는 툴이다. 보통 패키지 매니저는 소프트웨어의 의존성이나 버전정보를 관리한다.
#### 패키지 컨벤션
의존성 문제 해결과 같이 원활한 배포를 도와주는 역할을 수행한다. 사용자 입장에서 패키지 매니저 사용방법만 알게 되면 쉽게 쓸 수 있게 된다.


### 프로젝트 폴더 구조
![](https://koenig-media.raywenderlich.com/uploads/2016/12/Flag-%E2%94%9C%E2%94%80%E2%94%80-Package.swi_.png)
- Package.swift
패키지에 대한 설명과 다른 패키지와의 의존성을 포함한다. 스위프트 언어로 패키지 매니저의 매니페스트(메타데이터를 가지고 있는 파일)를 정의

- Sources/
모든 swift 소스 파일이 위치한다. main.swift 또한 생성되는데, 이는 앱의 entry 포인트가 될 것이다. 이를 실행하여 터미널에 hello, world를 출력할 수 있다.

- Tests/
XCTest를 이용하여 작성할 수 있는 유닛 테스트를 포함한다. 곧 테스트를 작성할 수 있을 것이다.

- .build/debug/
기본적으로 숨겨져 있는 빌드 폴더. build의 debug 폴더 안에 빌드(swift build)된 결과물이 위치한다.

### Conceptual Overview
#### Modules
Swift는 코드를 모듈로 구성한다. 각 모듈은 네임 스페이스를 지정하고 해당 코드의 일부를 모듈 외부에서 사용할 수 있는 액세스 제어를 실행한다.

프로그램은 하나의 모듈에 모든 코드를 포함 할 수도 있고 다른 모듈을 종속성으로 가져올 수도 있다. MacOS의 Darwin이나 Linux의 Glibc와 같이 시스템이 제공하는 소수의 모듈 외에도 대부분의 의존성을 위해서는 코드를 다운로드하여 사용해야 한다.

특정 문제를 해결하는 코드에 대해 별도의 모듈을 사용하면 다른 상황에서 해당 코드를 다시 사용할 수 있다. 예를 들어 네트워크 요청 기능을 제공하는 모듈을 사진 공유 앱과 날씨 앱간에 공유 할 수 있다. 모듈을 사용하면 동일한 기능을 직접 구현하는 대신 다른 개발자의 코드를 기반으로 구축할 수 있다.

#### Packages
패키지는 Swift 소스 파일과 매니페스트 파일로 구성된다. 매니페스트 파일인 'Package.swift'는 PackageDescription 모듈을 사용하여 패키지의 이름과 그 내용을 정의한다.

패키지에는 하나 이상의 target이 있다. 각 target은 product를 지정하며 하나 이상의 종속성을 선언할 수 있다.

#### Products
Target은 라이브러리 또는 실행 파일을 product로 빌드 할 수 있다. 라이브러리에는 다른 Swift 코드로 가져올 수 있는 모듈이 들어 있다. 실행 파일은 운영 체제에서 실행할 수 있는 프로그램이다.

#### Dependencies
Target의 종속성은 패키지의 코드에 필요한 모듈이다. 종속성은 패키지 원본에 대한 상대 또는 절대 URL과 사용할 수있는 패키지 버전에 대한 요구 사항 집합으로 구성된다. 패키지 관리자의 역할은 프로젝트의 모든 종속성을 다운로드하고 빌드하는 프로세스를 자동화하여 조정 비용을 줄이는 것이다. 이것을 재귀적 프로세스라고 한다. 종속성은 고유한 종속성을 가질 수 있으며 각 종속성은 종속성 그래프를 형성하여 종속성을 가질 수도 있다. 패키지 관리자는 전체 종속성 그래프를 충족시키는 데 필요한 모든 것을 다운로드하고 빌드한다.

### 활용 예
![데모 예제 구조](https://realm.io/assets/img/news/kr/letswift_package_manager_swift_build.jpg)

- [PlayingCard](https://github.com/apple/example-package-playingcard) - Defines `PlayingCard`, `Suit`, and `Rank` types.
- [FisherYates](https://github.com/apple/example-package-fisheryates) - Defines an extension that implements the `shuffle()` and `shuffleInPlace()` methods.
- [DeckOfPlayingCards](https://github.com/apple/example-package-deckofplayingcards) - Defines a `Deck` type that shuffles and deals an array of PlayingCard values.
- [Dealer](https://github.com/apple/example-package-dealer) - Defines an executable that creates a `DeckOfPlayingCards`, shuffles it, and deals the first 10 cards.

#### PlayingCard - Package.swift
```swift
import PackageDescription

let package = Package(
    name: "PlayingCard"
)
```

#### FisherYates - Package.swift
```swift
import PackageDescription

let package = Package(
    name: "FisherYates"
)
```

#### DeckOfPlayingCards - Package.swift
```swift
import PackageDescription

let package = Package(
    name: "DeckOfPlayingCards",
    dependencies: [
        .Package(url: "https://github.com/apple/example-package-fisheryates.git", majorVersion: 2),
        .Package(url: "https://github.com/apple/example-package-playingcard.git", majorVersion: 3),
    ]
)
```

#### Dealer - Package.swift
```swift
import PackageDescription

let package = Package(
    name: "Dealer",
    dependencies: [
        .Package(url: "https://github.com/apple/example-package-deckofplayingcards.git", majorVersion: 3),
    ]
)
```

#### swift build 'Dealer'
```swift
$ swift build
$ ./.build/debug/Dealer
♠︎6
♢K
♢2
♡8
♠︎7
♣︎10
♣︎5
♢A
♡Q
♡7
```

[참고: Swift - Package Manager - Example Usage](https://swift.org/package-manager/#example-usage)


## VendorKit

Cocoapod는 라이브러리의 이름과 버전 번호를 포함하는 표준화 된 Podfiles를 사용한다. 이 Pod 파일은 각 라이브러리에 대한 정보를 자세히 설명하는 Pod를 가져온다. VendorKit을 사용하면 라이브러리 이름, 라이브러리의 위치, 다른 종속성이 있는지 여부를 지정할 수 있다. 


## CocoaSeeds


CocoaSeeds는 Seedfile에 작성된 의존성을 기반으로 소스코드를 다운받고, 프로젝트에 자동으로 임베드시켜주는 기능을 한다. CocoaSeeds는 static library나 dynamic framework를 전혀 사용하지 않기 때문에 iOS 7 프로젝트에서도 Swift로 작성된 라이브러리를 문제없이 사용할 수 있게 해준다. 또한, CocoaPods이나 Carthage와 같은 다른 의존성 관리 도구와도 함께 사용될 수 있다.

## Git Submodules

## Xcode Maven


## Reference
> CocoaPod

https://cocoapods.org/
https://github.com/CocoaPods/CocoaPods
https://calyfactory.github.io/xcode-dependency-Manager/


> Carthage

https://github.com/Carthage/Carthage
https://www.raywenderlich.com/109330/carthage-tutorial-getting-started
http://krazie99.github.io/2016/02/22/Carthage.html
https://a-coding.com/a-review-of-ios-dependency-managers/

> Swift Package Manager

https://swift.org/package-manager/
https://news.realm.io/kr/news/swift-package-manager/

> Git Submodules 

https://git-scm.com/book/en/v2/Git-Tools-Submodules

> CocoaSeeds

https://github.com/devxoul/CocoaSeeds
http://blog.xoul.kr/2015/06/14/cocoaseeds.html

> CocoaPods vs Carthage vs Git Submodules

https://medium.com/real-life-programming/carthage-vs-cocoapods-vs-git-submodules-9dc341ec6710


