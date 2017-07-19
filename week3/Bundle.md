# Bundle

## About Bundles
concept of bundles and packages and how they are used by the system

### Bundle

Bundle은 macOS와 iOS에서 소프트웨어를 제공하는 편리한 기능이다.
Bundle은 사용자에게 간단한 인터페이스를 공급하고, 개발을 지원해준다.

### Bundle & Package

Bundle과 Package는 가끔 서로 바꿔 쓸 수 있지만 실제로 매우 다른 개념을 나타낸다.
  - Package : Finder가 마치 단일 파일처럼 제공하는 디렉터리
  - Bundle : 실행 가능한 코드와 해당 코드에서 사용하는 리소스를 저장하는 표준화 된 계층 구조가있는 디렉터리

Package는 macOS를 더 쉽게 사용하도록 하는 기본적인 추상화 중의 하나이다. 컴퓨터에 응용프로그램이나 플러그인을 볼때 실제로 보이는 것은 디렉터리이다. Package 디렉터리 안쪽에는 응용프로그램과 플러그인이 실행할수 있게하는 코드와 리소스 파일들이 있다. 그러나 Package 디렉터리를 사용할 때 Finder는 디렉터리를 단일 파일 처럼 취급한다. 이 행동은 사용자가 Package의 내용들에 악영향끼치는 변화를 만드는 것을 방지한다. 예를들어 사용자들이 리소스들을 삭제하고 바꾸고, 응용 프로그램이 정상적으로 실행되는 것을 방해하는 모듈을 코딩하는 것을 방해한다.

Packages들이 사용자 경험을 향상시키는 요소가 있는 반면에 Bundle은 개발자들이 그들의 코드를 패키징하고, 그 코드를 OS가 접근하는데 도움을 준다. Bundle은 코드와 소프트웨어와 관련된 작업들를 관리하기 위한 기본 구조를 정의한다. 이 구조는 지역화 처럼 중요한 특성들을 가능하게 한다. 정확한 Bundle Structrue는 응용프로그램, 프레임워크, 플러그인의 생성에 의존하고, 또 대상 플랫폼과 플러그인 같은 다른 요인이 영향을 미칠 수 있다.

Bundle과 Package는 가끔 혼용해서 쓰기도 하는 이유는 Bundle의 대다수의 종류 또한 Package이기 때문이다. 예를 들어서 응용프로그램과 로드할 수 있는 Bundle 보통 시스템에 의해 불투명한 디렉터리들로 관리되기 때문에 그것 들은 Package이다. 그러나 모든 Bundle이 Package는 아니고, 그 반대도 아니다.

### How the System Identifies Bundles and Packages

Finder는 다음 조건 중 하나라도 해당되면 디렉터리를 Package로 간주한다.

* 디렉터리에 .app, .bundle, framework, .plugin., .kext들 알려진 파일이름 확장자를 가지고 있다.  
* 디렉터리에는 Package Type을 표현하는 확장자를 가진다.
* 디렉터리에 Package bit set이 있다

Package를 지정하는 좋은 방법은 package 디렉터리에 알려진 파일이름 확장자를 주는 것이다. Xcode는 올바른 확장자를 적용하는 템플릿을 제공해서 이 문제를 다룬다. 개발자는 적절한 유형의 Xcode 프로젝트를 생성하기만하면 된다.

대부분의 Bundle은 Package이다. 예를들어 응용 프로그램과 플러그인은 일반적으로 Finder에서 단일 파일로 제공된다. 그러나 모든 Bundle 유형에 해당하는 것은 아니다. 특히 Framework는 link 및 runtime 사용을 위해 단일 유닛으로 다루어지는 Bundle 유형이지만 Framework는 투명해서 개발자들이 Framework에 포함된 다른 리소스와 헤더파일을 볼 수 있다.

### The Advantages of Bundles

Bundle은 개발자들에게 다음과 같은 이점이 있다.
 * Bundle은 파일시스템 내의 디렉터리이기 때문에 Bundle은 파일만 포함한다. 따라서 개발자는 다른 유형의 파일을 열 때 처럼 Bundle resource를 열 수 있다. 동일한 파일 기반 인터페이스를 사용하기 때문이다.
* Bundle 디렉토리 구조는 여러 지역화를 쉽게 지원한다. 개발자는 새롭게 현지화된 리소스를 쉽게 추가 하거나 원치 않는 리소스를 제거 할 수 있다.
* Bundle은 HFS, HFS+, AFP 같은 여러 fork format과, UFS, SMB, NFS같은 single-fork format 을 포함하여, 여러 다른 포맷들의 파일 시스템에 상주할 수 있다.
* 사용자는 Bundle을 Finder에서 드래그하여 설치, 재배치, 제거를 할 수 있다.
* Package 이기도 해서 불투명한 파일로 취급되는 Bundle은 중요한 리소스의 제거, 수정, 이름변경과 같은 우발적인 사용자의 실수에 영향을 덜 받는다.
* Bundle은 multi chip 아키텍쳐 (PowerPC, Intel) 및 (32-bit/64-bit) 아키텍쳐를 지원할 수 있다. 또한 특수 실행 파일(예 : 특정 벡터 명령어 집합에 최적화 된 라이브러리) 을 포함할 수 도 있다.
* 대부분 (전부x) 실행코드는 Bundle로 제공될 수 있다. 응용프로그램, 프레임워크, 플러그인은 모두 bundle model을 지원한다. 정적 라이브러리, 셀 스트립트, unix command line tool은 bundle 구조를 사용하지 않는다.
* Bundle로 제공된 응용프로그램은 서버에서 직접 실행 할 수 있다. 특별하게 공유를 하지 않는한, 라이브러리, 확장자, 리소스들은 로컬시스템에 설치되야 한다. 

### Types of Bundles

모든 Bundle이 동일한 기본 기능을 지원하지만, 특정 용도로 Bundle을 정의하고 생성하는 방식에는 차이가 있다. 

* Application : Application bundle은 실행 가능함 프로세스들과 연관된 코드와 리소스들을 관리한다. 이 Bundle의 정확한 구조는 platform(iOS 또는 macOS)에 따라 다르다
* Frameworks : Framework Bundle은 동적 공유 라이브러리와 그것과 연관된 파일들(헤더파일)을 관리한다. 응용 프로그램은 프레임워크에 포함된 코드를 이용하기 위해 하나 이상의 프레임워크를 링크할 수 있다.
* Plug-Ins : macOS는 많은 시스템 기능을 위해 plug-in을 지원한다. plug-in은 응용프로그램이 커스텀 코드 모듈을 로드시키기 위한 방법이다. 다음 목록은 개발하고자 하는 주요 plug-in 유형이다.
    * Custom plug-in
    * Image Unit plug-in
    * Interface Builder plug-ins
    * Preference Pane plug-ins
    * Quartz Composer plug-ins
    * Quick Look plug-ins
    * Spotlight plug-ins
    * WebKit plug-ins
    * Widgets

### Creating a Bundle

대부분 Bundle이나 Package는 수동으로 만들지 않는다. 새 Xcode 프로젝트를 만들거나 기본 프로젝트에 대상을 추가 할 때 Xcode는 필요할 때 필요한 Bundle structure를 자동으로 만든다. 예를 들어, 응용 프로그램, 프레임 워크 및 로드 가능한 Bundle 대상은 모두 연관된 Bundle structure를 가지고 있다. 이 타겟중에 하나를 빌드할 때 Xcode는 자동으로 해당하는 Bundle을 생성한다.

```
일부 Xcode 대상 (예: shell tools and static libraries)은 Bundle 또는 Package를 만들지 않는다.
이는 정상적이고, 이러한 대상 유형에 맞게 Bundle을 만든 필요가 없다.
이러한 대상에 대해 생성된 결과 바이너리는 그대로 사용하도록되어 있다.
```
Xcode 대신 make 파일을 사용하여 프로젝트를 빌드하면, Bundle을 생성하지 않는다. Bundle은 잘 정의된 구조와 Bundle 디렉터리 이름 끝에 특정한 파일 확장자를 가진 파일시스템 내의 디렉터리다. 최상위 Bundle 디렉터리를 생성하고 Bundle의 내용을 적절하게 구조화하기만 하면, 개발자는 Bundle에 접근하기 위한 프로그래밍 방식의지원으로 그 내용들에 접근할 수 있다.

### Programmatic Support for Accessing Bundles
Bundle을 참조하거나 Bundle로 묶인 프로그램은 Cocoa 와 Core Foundation의 인터페이스를 이용해서 Bundle의 내용에 접근할 수 있다. Bundle 리소스를 확인할 수 있는 인터페이스를 사용해서 Bundle 설정에 대한 정보를 얻을 수 있고 실행가능한 코드를 로드할 수 있다. Object-C 응용 프로그램에서는 bundle 정보를 관리하기 위해 NSBundle 클래스를 사용한다. C 기반 응용 프로그램에서는 Bundle을 관리하기 위해 Opaque Type인 CFBundle의 함수를 사용할 수 있다.

## Bundle Structures
structure and contents of the standard bundle types

### Application Bundles
Application Bundle은 앱이 실행되기 위한 모든 데이터들을 담고 있는 Bndle이라고 보면 된다. 상세 구조는 개발하는 Platform(MacOS, iOS)에 따라 달라질 수 있지만 사용하는 방법은 같다.

#### Types of files in an application bundle
| File | Description |
| -------- | -------- |
| Info.plist file | (Required) **information property list file**. 앱의 설정 정보를 담고 있는 구조화된 파일이다. |
| Executable | (Required) 앱은 반드시 이 파일을 포함해야 한다. 이 파일은 앱의 main entry point와 app target으로 링크된 code가 포함되어 있다. |
| Resource files | Resource file은 data file로 executable file 바깥에 존재한다. 대표적으로 image, icon, sound, nib file, string file, configuration file, data file 등이 포함된다. 대부분의 resource file 들은 사용 언어, 지역에 따라 localized 될 수 있다. |
| Other support files | custom data resource를 iOS application Bundle에 포함 시킬 수 있다. 하지만 custom framework나 plug-in은 포함하지 못한다. |

#### The iOS Application Bundle Structure
Bundle structure of an iOS application
```
MyApp.app
   MyApp
   MyAppIcon.png
   MySearchIcon.png
   Info.plist
   Default.png
   MainWindow.nib
   Settings.bundle
   MySettingsIcon.png
   iTunesArtwork
   en.lproj
      MyImage.png
   fr.lproj
      MyImage.png
```

#### The Information Property List File
* Contents of a typical iOS application Bundle

| File | Description |
| -------- | -------- |
| MyApp | (Required) application 코드가 포함되어 있는 executable file이다. 파일 이름은 application name에 ".app" extension을 제외한 문자열이다. |
| Application icons (MyAppIcon.png, MySearchIcon.png, and MySettingsIcon.png) | (Required/Recommended) Application Icon은 특정 시점에 앱을 나타내는 데 사용된다. 예로 홈 스크린, 앱 검색, 설정 앱 등에서 다른 사이즈의 앱 아이콘이 보여진다. 모든 icon이 필수인 것은 아니지만 대부분 포함하기를 권고하고 있다. |
| Info.plist | (Required) 이 파일은 앱에 대한 bundle ID, version number, display name 등의 설정 정보를 포함하는 파일이다. |
| Launch images (Default.png) | (Recommended) 앱이 처음 켜질때 보여지는 하나 또는 그 이상의 이미지들이다. 시스템은 앱이 window과 user interface를 load할 때까지 제공된 launch image 중에서 임시 배경으로 사용한다. launch image를 포함하지 않았다면 앱이 launch될 때 블랙 스크린이 보여진다. |
| MainWindow.nib | (Recommended) 앱의 main nib file이다. 대표적으로, 이 파일은 app의 main window object, application delegate object를 포함한다. |
| Settings.bundle | 설정 앱에 추가하고 싶은 컨텐츠를 설정하고 싶을 때 사용하는 특별한 타입의 plug-in이다. property list, other resource file 등을 포함한다. |
| Custom resource files | Non-localized resource들은 top level directory에 위치하고, localized resource들은 language-specific subdirectory 안에 위치한다. Resource는 nib file, image, sound files, configuration files, string files, any custom data file들로 구성된다. |

* Required keys for the Info.plist file

| Key | Value |
| -------- | -------- |
| CFBundleDisplayName (Bundle display name) | 앱 아이콘 밑에 보여지는 이름이다. 이 값은 지원되는 모든 언어에 대해 지역화(localization)가 요구된다. |
| CFBundleIdentifier (Bundle identifier) | 시스템이 앱을 구분하기 위한 고유한 문자열이다.UTI 규격에 맞춰서 알파벳과 하이픈(-), 마침표(.)만 가능하다. 보통은 DNS 이름 역순으로 표기한다. 예) com.Ajax.Hello |
| CFBundleVersion (Bundle version) | 번들의 빌드 버전 넘버에 대한 문자열이다. 이 값은 하나 이상의 마침표(.)로 구분된 정수로 구성되며 단조롭게 증가하는 문자열이다. |
| CFBundleIconFiles | 애플리케이션 아이콘 이미지의 파일명 또는 목록이다. |
| LSRequiresIPhoneOS (Application requires iOS environment) | iOS에서만 실행할 번들인지 나타내는 Boolean 값이다. Xcode가 자동으로 value가 true인 이 key를 생성한다. 이 key에 대한 value를 변경하면 안된다. |
| UIRequiredDeviceCapabilities | 앱 실행 동안 디바이스에서 사용할 항목을 설정하는 부분이다. 예) telephony, wifi, sms, accelerometer, gyroscope, location-services, gps, microphone 등 |

* Keys commonly included in the Info.plist file

| Key | Description |
| -------- | -------- |
| NSMainNibFile (Main nib file base name) | 앱 메인 nib 파일명 |
| UIStatusBarStyle | 애플리케이션 실행 시 상태바 스타일 |
| UIStatusBarHidden | 애플리케이션 실행 시 상태바를 숨길 지의 여부 |
| UIInterfaceOrientation | 앱이 구동될 때 초기 사용자 인터페이스가 가로 방향인지 세로 방향인지 구분 |
| UIPrerenderedIcon | 이미 번들 아이콘에 광택 효과 유무 |
| UIRequiresPersistentWiFi | 앱이 Wi-Fi 연결을 필요로 하는지 여부 |
| UILaunchImageFile | 앱이 구동될 때 나타날 인트로 이미지 파일명 |

#### Resources in an iOS Application
An iOS application with localized and nonlocalized resources
```
MyApp.app/
   Info.plist
   MyApp
   Default.png
   Icon.png
   Hand.png
   MainWindow.nib
   MyAppViewController.nib
   WaterSounds/
      Water1.aiff
      Water2.aiff
   en.lproj/
      CustomView.nib
      bird.png
      Bye.txt
      Localizable.strings
   jp.lproj/
      CustomView.nib
      bird.png
      Bye.txt
      Localizable.strings
```

## Accessing a Bundle’s Contents

번들 기반의 코드를 작성할 때, 원하는 파일의 경로를 얻기 위해 NSBundle 클래스 혹은 CFBundle opaque 타입을 사용한다.
이와 같이 사용하는 이유는 각각의 파일이 언어나 위치에 따라 다르기 때문이다. 번들이 파일의 위치를 결정함으로써 사용자가 올바른 파일을 적재하는 것을 보증한다.

다음은 번들에 접근하기 위한 절차이다.
1. 번들 찾기 및 열기
번들 자원에 액세스하려면 먼저 적절한 NSBundle 오브젝트 또는 CFBundle opaque type을 확보해야한다. 이러한 유형 중 하나에 대한 참조를 얻을 수 있는 여러 가지 방법이 있다.
  - 메인 번들 가져오기
    - 기본 번들은 실행중인 애플리케이션의 코드와 리소스가 포함 된 번들이다. 응용 프로그램 개발자인 경우 가장 많이 사용되는 번들이다. 메인 번들은 정보를 제공 할 필요가 없기 때문에 가장 쉽게 검색 할 수 있다.
    - 코코아 애플리케이션에서 메인 번들을 얻으려면 NSBundle 클래스의 mainBundle 클래스 메소드를 호출한다.
    - 메인 번들을 가져올 때, 돌아 오는 값이 유효한 번들을 나타내는 지 확인하는 것이 좋다. 모든 응용 프로그램에서 메인 번들을 검색 할 때 다음 상황에서는 반환 값이 NULL 일 수 있다.
    - 
          - 프로그램이 번들되지 않은 경우 기본 번들을 가져 오려고하면 NULL 값이 반환 될 수 있다. 
            번들 코드는 프로그램의 내용을 나타내는 메인 번들을 만들려고 시도하지만 모든 경우에 그렇게 할 수는 없다.
            
          - 프로그램을 시작한 에이전트가 argv 매개 변수에서 프로그램의 실행 파일에 대한 전체 경로를 지정하지 않은 경우, 기본 번들 값은 NULL 일 수 있다. 
            번들은 argv [0]에있는 실행 파일의 경로 나 PATH 환경 변수에있는 실행 파일 경로의 존재 여부에 의존한다. 
            둘 다 존재하지 않으면 번들 루틴이 주 번들 디렉토리를 찾지 못할 수도 있다. 
            xinetd가 실행 한 프로그램은 xinetd가 현재 디렉토리를 /로 바꿀 때 종종 이 문제를 경험한다. 
  - 경로를 통해 번들 가져오기
    - 메인 번들 이외의 번들에 액세스하려면 번들 디렉토리에 대한 경로를 알고있는 경우 적절한 번들 객체를 만들 수 있다. 경로별로 번들을 생성하는 것은 프레임워크나 다른 loadable 번들을 정의하고 해당 번들의 위치를 미리 알고있는 상황에서 유용하다.
    - Cocoa를 사용하여 특정 경로에서 번들을 얻으려면 NSBundle 클래스의 init?(path: String) 메소드를 호출하면 된다. 이 메서드를 사용하여 새 번들 객체를 초기화 할 수도 있다.이 메서드는 번들 디렉토리의 전체 경로를 나타내는 문자열 매개 변수를 사용한다.
  - 알려진 디렉토리에서 번들 가져오기 
      - 번들에 대한 정확한 경로를 모를지라도 알려진 위치에서 검색 할 수 있다. 예를 들어, PlugIns 디렉토리가 있는 응용 프로그램은 해당 디렉토리의 모든 번들 목록을 가져올 수 있다. 일단 디렉토리에 대한 경로가 있으면 해당 루틴을 사용하여 해당 디렉토리를 반복하고 번들을 리턴 할 수 있다.
      - 특정 디렉토리에서 모든 번들을 찾는 가장 간단한 방법은 CFBundleCreateBundlesFromDirectory 함수를 사용하는 것입니다. 이 함수는 주어진 디렉토리에있는 모든 번들에 대해 새로운 CFBundle 유형을 리턴합니다.
   - 식별자로 번들 가져오기
       - 번들 식별자를 사용하여 번들을 찾는 것은 과거에 이미 메모리에 로드 된 번들을 찾는 효율적인 방법이다. 번들 식별자는 번들의 Info.plist 파일에 있는 bundleIdentifier 키에 할당 된 문자열이다. 이 문자열은 일반적으로 다른 회사의 개발자와 이름 공간 충돌을 방지하기 위해 역 DNS 표기법을 사용하여 형식이 지정된다.
       - 예를 들어 Apple의 Finder 플러그인은 번들 식별자로 com.apple.Finder.MyGetInfoPlugin 문자열을 사용할 수 있다. 코드에 번들 객체 포인터를 전달하는 대신, 번들에 대한 참조가 필요한 클라이언트는 번들 식별자를 사용하여 간단히 검색 할 수 있다.
       - 이미 열어 놓은 번들을 찾으려면 번들 식별자만 사용할 수 있다. 예를 들어, 이 기술을 사용하여 정적으로 링크 된 모든 프레임워크의 기본 번들 및 번들을 열 수 있다. 하지만, 아직 로드되지 않은 플러그인에 대한 참조는 가져올 수 없다.
    - 관련 번들 검색
        - Cocoa 응용 프로그램을 작성하는 경우 NSBundle의 allBundles 및 allFrameworks 프로퍼티를 호출하여 응용 프로그램과 관련된 번들 목록을 얻을 수 있다. 이 프로퍼티는 애플리케이션에서 현재 사용하고있는 번들이나 프레임 워크에 해당하는 NSBundle 객체의 배열을 만든다. 로드 된 번들 컬렉션을 직접 관리하지 않고 편의 기능으로 이 프로퍼티를 사용할 수 있다.
        - init(for aClass: AnyClass)는 Cocoa 어플리케이션에서 관련 번들 정보를 얻는 또 다른 방법이다. 이 메소드는 특정 클래스가 정의 된 번들을 리턴한다. 
2. 번들 리소스에 대한 참조 얻기
번들 객체에 대한 참조가 있는 경우 해당 객체를 사용하여 번들 내부의 자원 위치를 결정할 수 있다. Cocoa와 Core Foundation은 둘 다 번들 내에서 리소스를 찾는 다양한 방법을 제공한다. 또한 빌드 할 때 파일을 올바른 위치에 놓을 수 있도록 해당 프레임워크가 번들 내의 리소스 파일을 찾는 방법을 이해해야 한다.

  - 번들 검색 패턴
      - 리소스를 찾기 위해 NSBundle 객체나 CFBundle의 opaque type을 사용한다면, 번들 코드는 리소스가 번들에서 검색되는 방법에 신경 쓰지 않아도 된다. NSBundle과 BundleRef는 사용 가능한 사용자 설정 및 번들 구성을 기반으로 적절한 언어 별 리소스를 자동 검색한다. 그러나 모든 언어 관련 리소스를 번들에 넣어야하기 때문에, 검색 방법을 파악하는 것이 중요하다.
      - 번들 프로그래밍 인터페이스는 특정 검색 알고리즘을 따라 번들 내의 리소스를 찾는다. 글로벌 리소스가 가장 우선 순위가 높고 지역 및 언어 별 리소스가 뒤따른다. 지역 및 언어 별 리소스를 고려할 때 알고리즘은 현재 사용자의 설정과 번들 Info.plist 파일의 개발 영역 정보를 모두 고려한다.
      - 먼저, 번들은 전체 응용 프로그램에 사용할 지역화를 결정한다. 기본 언어에 대한 .lproj 폴더가 있으면 해당 지역화가 적용된다. 그렇지 않으면 번들은 다음 기본 언어와 일치하는 .lproj 폴더를 검색한다. 기본 언어에 대한 지역화가 없으면 번들은 개발 언어 현지화를 선택한다
      - 그런 다음 번들은 다음 순서로 자원을 검색한다.
         ```
        글로벌 자원 (지역화되지 않은 자원)
        지역별 지역화 된 리소스 (사용자의 지역별 환경 설정에 따라 다름)
        언어 별 지역화 된 리소스 (사용자의 언어 기본 설정에 따라 다름)
        개발 언어 리소스 (번들 Info.plist 파일의 CFBundleDevelopmentRegion에 의해 지정됨)
        ```
  - iOS의 기기 별 리소스
      - iOS 4.0 이상에서는 개별 리소스 파일을 특정 유형의 장치에서만 사용할 수있는 것으로 표시 할 수 있다. 이 기능을 사용하면 Universal 응용 프로그램에 대해 작성해야하는 코드가 간단해진다. 별도의 코드 경로를 만들어 iPhone 용 리소스 파일의 한 버전과 iPad 용 파일의 다른 버전을로드하는 대신 번들로드 루틴이 올바른 파일을 선택할 수있게 할 수 있다. 리소스 파일의 이름을 올바르게 지정하기만 하면 된다.
      - 리소스 파일을 특정 장치와 연결하려면 파일 이름에 사용자 지정 수정 자 문자열을 추가합니다. 이 수정 자 문자열을 포함하면 다음 형식의 파일 이름이 생성된다.
        ```
        <basename> <device>. <filename_extension>
         ```
        <basename> 문자열은 리소스 파일의 원래 이름을 나타낸다. 또한 코드에서 파일에 액세스 할 때 사용하는 이름을 나타낸다. 마찬가지로 <filename_extension> 문자열은 파일 형식을 식별하는 데 사용되는 표준 파일 이름 확장명이다. <device> 문자열은 대 / 소문자를 구분하는 문자열이며 다음 값 중 하나 일 수 있다.

    - MyImage.png라는 이미지가 있다고 가정하면, iPad와 iPhone에서 서로 다른 버전의 이미지를 지정하기 위해 MyImage ~ ipad.png 및 MyImage ~ iphone.png라는 이름의 리소스 파일을 생성하여 둘 다 번들에 포함시킨다. 이미지를 로드하려면 코드에서 리소스를 계속 MyImage.png로 참조하고 시스템이 적절한 버전을 선택하게 한다.

3. 번들의 다른 파일 찾기
유효한 번들 객체를 사용하면 최상위 번들 디렉토리의 경로뿐만 아니라 여러 하위 디렉토리의 경로를 검색 할 수 있다. 사용 가능한 인터페이스를 사용하여 디렉토리 경로를 검색하면 코드가 번들의 정확한 구조 또는 시스템에서의 위치를 ​​알지 못하도록 한다. 또한 다른 플랫폼에서 동일한 코드를 사용할 수 있다. 예를 들어 동일한 코드를 사용하여 번들 구조가 다른 iOS 응용 프로그램 또는 Mac 응용 프로그램에서 자원을 검색 할 수 있다.

    Cocoa를 사용하여 최상위 번들 디렉토리의 경로를 얻으려면 해당 NSBundle 객체의 bundlePath 메소드를 사용한다. builtInPlugInsPath, resourcePath, sharedFrameworksPath 및 sharedSupportPath 메소드를 사용하여 번들의 주요 하위 디렉토리에 대한 경로를 얻을 수도 있다. 이 메소드는 NSString 객체를 사용하여 경로 정보를 반환한다. NSString 객체는 대부분의 다른 NSBundle 메서드에 직접 전달하거나 필요에 따라 NSURL 객체로 변환 할 수 있다.
    
   또한 Core Foundation은 여러 가지 내부 번들 디렉토리를 검색하는 기능을 정의합니다. 번들 자체의 경로를 가져 오려면 CFBundleCopyBundleURL 함수를 사용할 수 있다. CFBundleCopyBuiltInPlugInsURL, CFBundleCopyResourcesDirectoryURL, CFBundleCopySharedFrameworksURL 및 CFBundleCopySupportFilesDirectoryURL 함수를 사용하여 번들의 주요 서브 디렉토리 위치를 확보 할 수도 있다. Core Foundation은 항상 번들 경로를 CFURLRef 불투명 유형으로 반환한다. 이 유형을 사용하여 다른 핵심 기반 루틴에 전달할 수있는 CFStringRef 유형을 추출 할 수 있다.
4. 번들의 Info.plist 얻기
모든 번들에 포함되어야 하는 파일은 정보 속성 목록 (Info.plist) 파일이다. 이 파일은 특정 유형의 키 - 값 쌍을 포함하는 XML 기반 텍스트 파일이다. 이러한 키 - 값 쌍은 ID 문자열, 버전 번호, 개발 영역, 유형 및 기타 중요한 속성과 같은 번들에 대한 정보를 지정한다. (이 파일에 포함 할 수있는 키 목록은 런타임 구성 지침을 참조) 번들에는 대부분 XML 기반 등록 정보 목록으로 구성된 다른 유형의 구성 데이터도 포함될 수 있다.

    NSBundle 클래스는 Info.plist 파일에서 정보를 검색하기위한 object(forInfoDictionaryKey:) 및 infoDictionary 메서드를 제공한다. objectForInfoDictionaryKey: 메서드는 키의 지역화 된 값을 반환하며 호출하는 데 선호되는 메서드이다. infoDictionary 메서드는 속성 목록의 모든 키가있는 NSDictionary를 반환한다. 그러나 이러한 키에 대해 지역화 된 값을 반환하지는 않는다.
    
    Core Foundation은 번들의 ID 문자열, 버전 및 개발 영역을 포함하여 번들의 정보 속성 목록 파일에서 특정 데이터 조각을 검색하는 기능도 제공한다. CFBundleGetValueForInfoDictionaryKey 함수를 사용하여 키의 지역화 된 값을 검색 할 수 있다. CFBundleGetInfoDictionary를 사용하여 지역화되지 않은 키의 사전 전체를 검색 할 수도 있다. (자세한 내용은 CFBundle Reference 참조)
    
5. 실행 코드 로드 및 언로드
외부 번들에서 코드를 로드하는 핵심은 번들의 실행 파일에 적절한 진입점을 찾는 것이다. 다른 플러그인 방식과 마찬가지로, 이것은 애플리케이션 개발자와 플러그인 개발자간에 약간의 조정이 필요하다. 번들에 대한 사용자 정의 API를 공개하여 공식 플러그인 인터페이스를 구현하거나 정의 할 수 있다. 두 경우 모두 적절한 번들 또는 플러그인이 있으면 NSBundle 클래스 (또는 CFBundle opaque type)를 사용하여 외부 코드로 구현된 함수나 클래스에 액세스한다.
---

## Document Packages
   ![File Package](https://developer.apple.com/library/content/documentation/DataManagement/Conceptual/DocumentBasedAppPGiOS/Art/document_file_package_2x.png)

### Document Packages

    - document file formats이 종류가 다른 타입의 data때문에 다루기 힘들면 package format을 고려해볼만하다.
    - document packages는 single document의 환영을 제공한다.
    - 이때 document data를 내부적으로 저장하는 방식에서 유연함을 제공해준다.
    - 만약 JPEG, GIF, or XML같은 여러 포멧을 사용하면 document package가 데이터를 다루기 쉽게 해줄 것이다.

### Registering Your Document Type

    - 애플이 Document packages를 위한 구체적인 구조를 정해놓진 않았다.
    - package directory의 내용과 구조는 개발자에게 달렸다.
    - 기왕이면 flat directroy를 만들거나 Resources 최상위 Resource Resources 하위 디렉토리를 포함하고 있는 framework bundle structure를 사용해라.
 
### Defining Your Document Directory Structure
 
    - document를 package로 등록하기 위해서는 Info.plist에 있는document type infomation을 바꿔야 한다.
    
    - The CFBundleDocumentTypes(Xcode: Document types) key가 애플리케이션이 지원하는 document type 정보를 저장한다.
    
    - document package type마다 LSTypeIsPackage(Xcode: Document is a package or bundle) key를 적절한 값으로 설정해줘야한다.
    이 Key는 Finder와 Launch Services에게 주어진 파일 확장자를 가진 디렉토리를 package로 취급하도록 알려준다.

    - Document packages는 항상 식별할 수 잇는 확장자를 가져야한다.(사용자에게는 보이지 않을 지라도)

- Creating a New Document Package
    
    1. NSFileWrapper(FileWrapper)를 사용해서 document package 생성
    
    2. Create the document package manually.

### Accessing Your Document Contents

    - document package는 directory이기 때문에 document의 contents에 file-system routines을 사용하여 접근가능하다.
    - 만약 bundle structure라면 NSBundle, CFBundleRef를 사용해서 접근가능하다.
    - bundle structrure의 사용은 여러 localizations를 저장하는 documents에 적절하다.

---

## Bundle
### Getting Standard Bundle Objects
- class var main: Bundle
    - 현재 실행 중인 번들 객체를 반환
- class var allFrameworks: [Bundle]
    - 프레임워크를 나타내는 모든 응용프로그램의 번들의 배열을 반환
- class var allBundles: [Bundle]
    - 프레임워크를 나타내지 않는 모든 응용프로그램의 번들의 배열을 반환

### Creating and Initializing a Bundle
- init(for: AnyClass)
    - 지정된 class와 관련된 NSBundle 인스턴스를 반환 
- init?(identifier: String)
    - 지정된 번들 indentifier를 가지고 있는 NSBundle 인스턴스를 반환
- init?(url: URL)
    - 지정된 파일 url에 맞게 초기화된 NSBundle 객체를 반환
- init?(path: String)
    - 지정된 디렉토리 경로에 맞게 초기화된 NSBundle 객체를 반환

### Loading Nib Files
- func loadNibNamed(String, owner: Any?, options: [AnyHashable : Any]? = nil)
    - 수신 번들에 있는 nib file의 내용을 불러옴
    - nib file? 
        - cocoa application에서 사용하는 파일
        - 인터페이스빌더에서 생성한 윈도우, 메뉴, 컨트롤과 사용자가 만든 오브젝트들의 레이아웃과 속성등의 정보와 오브젝트간의 연결과 바인딩등의 정보를 포함하고 있는 파일
- func loadNibName(String, owner: Any?, topLevelObjects: AutoreleasingUnsafeMutablePointer<NSArray>?)
    - 파일 이름과 소유자로 번들에서 nib file을 불러옴

### Finding Resource Files
    url vs path

    forResource : 리소스 파일 이름 (String?)
    withExtension : 파일 확장자 (String?) - url
    forResourcesWithExtension : 리소스 파일 이름과 확장자 (String?) - url
    subdirectory : 번들 디렉토리 (String?) - url
    localization : 리소스 지역화 (String?) - url
    in : 파일의 위치 url (URL)
    ofType : 파일 확장자 (String?) - path
    inDirectory : 번들 디렉토리 (String?) - path
    forLocalization : 리소스 지역화 (String?) - path

- func url(forResource: String?, withExtension: String?, subdirectory: String?)
- func url(forResource: String?, withExtension: String?)
- func urls(forResourcesWithExtension: String?, subdirectory: String?)
- func url(forResource: String?, withExtension: String?, subdirectory: String?, localization: String?)
- func urls(forResourcesWithExtension: String?, subdirectory: String?, localization: String?)
- class func url(forResource: String?, withExtension: String?, subdirectory: String?, in: URL)
    - create and return
- class func urls(forResourcesWithExtension: String?, subdirectory: String?, in: URL)
- func path(forResource: String?, ofType: String?)
- func path(forResource: String?, ofType: String?, inDirectory: String?)
- func path(forResource: String?, ofType: String?, inDirectory: String?, forLocalization: String?)
- func paths(forResourcesOfType: String?, inDirectory: String?)
- func paths(forResourcesOfType: String?, inDirectory: String?, forLocalization: String?)
- class func path(forResource: String?, ofType: String?, inDirectory: String)
- class func paths(forResourcesOftype: String?, inDirectory: String)

### Finding Image Resources
- func urlForImageResource(String)
    - 지정한 이미지 리소스의 위치를 NSURL로 반환
- func pathForImageResource(String)
    - 지정한 이미지 리소스의 위치를 String(pathname)으로 반환
- func image(forResource: String)
    - 지정한 이미지 리소스를 NSImage로 반환

### Finding Sound Resources
- func path(forSoundResource: String)
    - 지정된 사운드 리소스의 경로를 반환

### Fetching Localized Strings
- func localizedString(forKey: String, value: String?, table: String?)
    - 지정된 키를 가지고 있고 지정된 테이블에 존재하는 문자열을 리소스 지역화에 알맞게 반환

### Fetching Context Help Resources
- func contextHelp(forKey: String)
    - 번들의 도움말 파일에서 지정된 키에 대한 상황에 맞는 도움말을 반환

### Getting the Standard Bundle Directories
- var resourceURL: URL?
    - 리소스 파일의 url
- var executableURL: URL?
    - 실행 파일의 url
- var privateFrameworksURL: URL?
    - private framework의 url
- var sharedFrameworksURL: URL?
    - 공유 framework의 url
- var builtInPlugInsURL: URL?
    - plug in의 url
- func url(forAuxiliaryExecutable: String)
    - 지정된 이름을 가진 실행 파일의 url 반환
- var sharedSupportURL: URL?
    - 공유 지원 파일의 url
- var appStoreReceiptURL: URL?
    - app store의 영수증 url
- var resourcePath: String?
    - 리소스 파일의 pathname
- var executablePath: String?
- var privateFrameworksPath: String?
- var sharedFrameworksPath: String?
- var builtInPlugInsPath: String?
- func path(forAuxiliaryExecutable: String)
- var sharedSupportPath: String?

### Getting Bundle information
- var bundleURL: URL
    - 번들 디렉토리의 전체 url
- var bundlePath: String
    - 번들 디렉토리의 전체 pathname
- var bundleIdentifier: String?
    - 번들의 식별자
- var infoDictionary: [String : Any]?
    - Dictionary
    - 번들의 Info.plist file
- func object(forInfoDictionaryKey: String)
    - receiver's Info.plist 안에 지정된 key와 연관된 값을 리턴

### Getting Localization Information
- var localizations: [String]
    - 번들에 포함된 지역화들의 배열
- var preferredLocalizations: [String]
    - 번들에 포함된 선호 지역화의 정렬된 배열
- var developmentLocalization: String?
    - 개발 언어의 지역화
- var localizedInfoDictionary: [String : Any]?
    - Dictionary
    - 번들의 지역화된 속성 정보
- class func preferredLocalizations(from: [String])
    - 번들 객체가 현재 사용자의 자원을 찾는 데 사용할 지정된 목록에서 하나 이상의 지역화를 반환
- class func preferredLocalizations(from: [String], forPreferences: [String]?)

### Getting Classes from a Bundle
- func className(String)
    - 지정된 이름의 클래스 객체를 반환
- var principalClass: AnyClass?
    - 번들의 주요 클래스

### Loading Code from a Bundle
- var executableArchitectures: [NSNumber]?
    - 번들의 실행 파일이 지원하는 아키텍처 유형을 나타내는 배열
- func preflight()
    - 번들의 실행 코드가 성공적으로 실행되는지 여부
    - return bool
- func load()
    - 코드가 아직 로드 되지 않은 경우 동적으로 번들의 실행 가능 코드를 실행중인 프로그램에 로드
- func loadAndReturnError()
    - 번들에 실행 가능 코드를 로드하고 에러를 반환
- func unload()
    - receiver와 관련된 코드를 언로드
    - return bool
- var isLoaded: Bool
    - 번들의 로드 상태 여부

## Information Property List Files (Info.plist)
![information property list in Xcode](https://developer.apple.com/library/content/documentation/General/Reference/InfoPlistKeyReference/Art/xcode_infoplist_editor_2x.png)
- Application Category (LSApplicationCategoryType)
- Localization native development region (kCFBundleDevelopmentRegionKey)
- Executable file (CFBundleExecutable)
- Bundle identifier (CFBundleIdentifier)
- InfoDictionary version (CFBundleInfoDictionaryVersion)
- Bundle name (CFBundleName)
- Bundle OS Type code (CFBundlePackageType)
- Bundle versions string, short (CFBundleShortVersionString)
- Bundle version (CFBundleVersion)
- Application requires iPhone environment (LSRequiresiPhoneOS)
- Launch screen interface file base name (UILaunchStoryboardName)
- Main storyboard file base name (UIMainStoryboardFile)
- Required device capabilities (UIRequiredDeviceCapabilities)
- Supported interface orientations (UISupportedInterfaceOrientations)
- Supported interface orientations (iPad) (UISupportedInterfaceOrientations~ipad)
- ...

### 출처
https://developer.apple.com/library/content/documentation/CoreFoundation/Conceptual/CFBundles/AboutBundles/AboutBundles.html

http://hsg2510.tistory.com/104

http://padgom.tistory.com/entry/iOS-infoplist-Key-%EB%AA%A9%EB%A1%9D%EA%B3%BC-%EC%82%AC%EC%9A%A9

http://horajjan.blog.me/220567226988