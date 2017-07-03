# Swift 예제코드 바로잡기

## 2장
> 32 페이지

### 수정 전
```swift
var str = " Hello, playground"
```

### 수정 후
```swift
var greeting = " Hello, playground"
```

### 근거
* Swift API Design Guidelines
* Naming
* Promote Clear Usage

> 35 페이지

### 수정 전
```swift
var dictionaryOfCapitalsByCountry = Dictionary<String, String>
```

### 수정 후
```swift
var capitalsByCountry = Dictionary<String, String>
```

### 근거
* Swift API Design Guidelines
* Naming
* Promote Clear Usage - Name variables, parameters, and associated types according to their roles, rather than their type constraints.

> 44 페이지

### 수정 전
```swift
enum PieType {
    case Apple
    case Cherry
    case Pecan
}
```

### 수정 후
```swift
enum PieType {
    case apple
    case cherry
    case pecan
}
```

### 근거
* Enum의 case 명명법 변경
 * UpperCamelCase -> lowerCamelCase
 * The Swift Programming Language(Language Guide)
  * [Enumerations](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Enumerations.html)
   * Enumeration Syntax

## 3장

> 52 페이지

### 수정 전

```Swift
class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()

    let firstFrame = CGRect(x: 160, y: 240, width: 100, height: 150)
    let firstView = UIView(frame: firstFrame)
    firstView.backgroundColor = UIColor.blueColor()
    view.addSubview(firstView)
  }
}
```

### 수정 후

```Swift
class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()

    let firstFrame = CGRect(x: 160, y: 240, width: 100, height: 150)
    let firstView = UIView(frame: firstFrame)
    firstView.backgroundColor = UIColor.blue
    view.addSubview(firstView)
  }
}
```

### 근거

* view의 backgroundColor를 설정하는 방법 변경
  * UIKit의 UIColor의 클래스 메서드가 사라지고 객체로 변경
  * UIColor.blueColor() -> [UIColor.blue](https://developer.apple.com/documentation/uikit/uicolor/1621947-blue)

## 4장

> 83 페이지

### 수정 전
```swift
@IBAction func fahrenheitFieldEditingChanged(textField: UITextField) {
    if let text = textField.text where !text.isEmpty {
        celsiusLabel.text = text
    }
    else {
        celsiusLabel.text = "???"
    }
}
```
### 수정 후
```swift
@IBAction func fahrenheitFieldEditingChanged(textField: UITextField) {
    if let text = textField.text, !text.isEmpty {
        celsiusLabel.text = text
    }
    else {
        celsiusLabel.text = "???"
    }
}
```

### 근거
* in swift 3 you use "," for conditional clauses
    * where -> [,](https://github.com/apple/swift-evolution/blob/master/proposals/0099-conditionclauses.md)


> 88 페이지

### 수정 전
```swift
let numberFormatter: NSNumberFormatter = {
    let nf = NSNumberFormatter()
    nf.numberStyle = .DecimalStyle
    nf.minimumFractionDigits = 0
    nf.maximumFractionDigits = 1
    return nf
}()

```
### 수정 후
```swift
let numberFormatter: NumberFormatter = {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    numberFormatter.minimumFractionDigits = 0
    numberFormatter.maximumFractionDigits = 1
    return numberFormatter
}()
```

### 근거
* Swift API Design Guidelines
    * Naming
        * Promote Clear Usage
* Foundation의 NSNumberFormatter의 Swift 클래스 이름 변경
    * NSNumberFormatter -> [NumberFormatter](https://developer.apple.com/documentation/foundation/numberformatter)
* Enum의 case 명명법 변경
    * UpperCamelCase -> lowerCamelCase
    * The Swift Programming Language(Language Guide)
        * [Enumerations](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Enumerations.html)
                * Enumeration Syntax


> 88 페이지

### 수정 전
```swift
func updateCelsiusLabel() {
    if let value = celsiusValue {
        celsiusLabel.text = numberFormmater.stringFromNumber(value)
    }
    else {
        celsiusLabel.text = "???"
    }
}
```
### 수정 후
```swift
func updateCelsiusLabel() {
    if let value = celsiusValue {
        celsiusLabel.text = numberFormmater.string(from: NSNumber(value: value))
    }
    else {
        celsiusLabel.text = "???"
    }
}
```

### 근거
* NumberFormatter의 instance method 변경
    * stringFromNumber:(NSNumber *)number -> [string(from number: NSNumber)](https://developer.apple.com/documentation/foundation/numberformatter/1418046-string)


> 92 페이지

### 수정 전
```swift
func textField(textField: UITextField,
    shouldChangeCharactersInRange range: NSRange,
    replacementString string: String) -> Bool {

    let existringTextHasDecimalSeparator = textField.text?.rangeOfString(".")
    let replacementTextHasDecimalSeparator = string.rangeOfString(".")

    if existringTextHasEdcimalSeparator != nil && replacementTextHasDecimalSeparator != nil {
        return false
    }
    else {
        return true
    }
}
```
### 수정 후
```swift
func textField(textField: UITextField,
    shouldChangeCharactersInRange range: NSRange,
    replacementString string: String) -> Bool {

    let existringTextHasDecimalSeparator = textField.text?.range(of: ".")
    let replacementTextHasDecimalSeparator = string.range(of: ".")

    if existringTextHasEdcimalSeparator != nil && replacementTextHasDecimalSeparator != nil {
        return false
    }
    else {
        return true
    }
}
```

### 근거
* String의 instance method 변경
    * rangeOfString(aString: String) -> [range(of aString: String)](https://developer.apple.com/documentation/swift/string/1642786-range)

## 5장

## 6장

> 114 페이지

### 수정 전
```swift
override func loadView() {
    ...
    segmentedControl.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
    ...
}

```
### 수정 후
```swift
override func loadView() {
    ...
    segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
    ...
}
```

### 근거
* Naming
* UIColor 의 instance method 변경
    * whiteColor() -> white
    * colorWithAlphaComponent() -> withAlphaComponent()

> 115 페이지

### 수정 전
```swift
override func loadView() {
    ...
    let topConstraint = segmentedControl.topAnchor.constraintEqualToAnchor(view.topAnchor)
    let leadingConstraint = segmentedControl.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor)
    let trailingConstraint = segmentedControl.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor)
    ...
}

```

### 수정 후
```swift
override func loadView() {
  ...
  let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.topAnchor)
  let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor)
  let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor)
  ...
}
```

### 근거
* Naming
* UISegmentedControl 의 instance method 변경
    * constraintEqualToAnchor() -> constraint(equalTo anchor: )

> 116 페이지

### 수정 전
```swift
topConstraint.active = true
leadingConstraint.active = true
trailingConstraint.active = true
```

### 수정 후
```swift
topConstraint.isActive = true
leadingConstraint.isActive = true
trailingConstraint.isActive = true
```

### 근거
* 프로퍼티 이름 변경

> 118 페이지

### 수정 전
```swift
let topConstraint = segmentedControl.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor, constant: 8)
```

### 수정 후
```swift
let topConstraint = segmentedControl.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 8)
```

### 근거
* Naming
* UISegmentedControl 의 instance method 변경
    * constraintEqualToAnchor(_:constant:) -> constraint(equalTo anchor: NSLayoutAnchor<AnchorType>,
       constant c: CGFloat)


> 120 페이지

### 수정 전
```swift
convenience init(item view1: AnyObject,
  attribute attr1: NSLayoutAttribute,
  relatedBy relation: NSLayoutRelation,
  toItem view2: AnyObject?,
  attribute attr2: NSLayoutAttribute,
  multiplier: CGFloat,
  constant c: CGFloat)
```

### 수정 후
```swift
convenience init(item view1: Any,
   attribute attr1: NSLayoutAttribute,
   relatedBy relation: NSLayoutRelation,
   toItem view2: Any?,
   attribute attr2: NSLayoutAttribute,
   multiplier: CGFloat,
   constant c: CGFloat)
```

### 근거
* The Swift Programming Language
    * AnyObject -> Any

> 122 페이지

### 수정 전
```swift
segmentedControl.addTarget(self, action: "mapTypeChanged:", forControlEvents: .ValueChanged)
```

### 수정 후
```swift
segmentedControl.addTarget(self, action: #selector(mapTypeChanged(segControl:)), for: .valueChanged)
```

### 근거
* The Swift Programming Language
  * Expression
    * Selector Expression
* Enum의 case 명명법 변경
    * UpperCamelCase -> lowerCamelCase
    * The Swift Programming Language(Language Guide)
      * Enumerations
      * Enumeration Syntax
