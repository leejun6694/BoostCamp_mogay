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

## 3장

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
