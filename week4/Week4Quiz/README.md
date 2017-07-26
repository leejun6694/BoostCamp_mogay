# Dispatch Queue Test

[GCD & OperationQueue](https://github.com/leejun6694/BoostCamp_mogay/blob/master/week4/Thread_Queue.pdf)의 Serial, Concurrent Queue 내용과 Sync, Async 내용을 참고해서 "mogay" method의 실행 결과를 작성하세요

> 1

##### code
```swift
let dispatch = DispatchQueue(label: "dispatch", attributes: .concurrent)
var sum = 0

func mogay() {
    dispatch.sync {
        for _ in 1...10000000 {
            self.sum += 1
        }
        print("1")
    }

    print("2")

    dispatch.sync {
        print("3")
        for _ in 1...10000000 {
            self.sum -= 1
        }
    }

    print("4")

}
```

##### answer
```




```

> 2

##### code
```swift
let dispatch = DispatchQueue(label: "dispatch", attributes: .concurrent)
var sum = 0

func mogay() {
    dispatch.sync {
        for _ in 1...10000000 {
            self.sum += 1
        }
        print("1")
    }

    print("2")

    dispatch.async {
        print("3")
        for _ in 1...10000000 {
            self.sum -= 1
        }
    }

    print("4")

}
```

##### answer
```




```

> 3

##### code
```swift
let dispatch = DispatchQueue(label: "dispatch", attributes: .concurrent)
var sum = 0

func mogay() {
    dispatch.async {
        for _ in 1...10000000 {
            self.sum += 1
        }
        print("1")
    }

    print("2")

    dispatch.sync {
        print("3")
        for _ in 1...10000000 {
            self.sum -= 1
        }
    }

    print("4")

}
```

##### answer
```




```

> 4

##### code
```swift
let dispatch = DispatchQueue(label: "dispatch")
var sum = 0

func mogay() {
    dispatch.async {
        for _ in 1...10000000 {
            self.sum += 1
        }
        print("1")
    }

    print("2")

    dispatch.sync {
        print("3")
        for _ in 1...10000000 {
            self.sum -= 1
        }
    }

    print("4")

}
```

##### answer
```




```

> 5

##### code
```swift
let dispatch = DispatchQueue(label: "dispatch")
var sum = 0

func mogay() {
    dispatch.sync {
        for _ in 1...10000000 {
            self.sum += 1
        }
        print("1")
    }

    print("2")

    dispatch.async {
        print("3")
        for _ in 1...10000000 {
            self.sum -= 1
        }
    }

    print("4")

}
```

##### answer
```




```

> 6

##### code
```swift
let dispatch = DispatchQueue(label: "dispatch")
var sum = 0

func mogay() {
    dispatch.async {
        for _ in 1...10000000 {
            self.sum += 1
        }
        print("1")
    }

    print("2")

    dispatch.async {
        print("3")
        for _ in 1...10000000 {
            self.sum -= 1
        }
    }

    print("4")

}
```

##### answer
```




```
