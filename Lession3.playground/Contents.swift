import UIKit

// Kiem tra so Fibonaci
extension Int {
    func checkFibonaci() -> Bool {
        let n = Double(self)
        var f2: Double = 1
        var f1: Double = 1
        var fn: Double = 1
        
        if n == 1 || n == 2 {
            return true
        } else {
            while fn < n {
                f1 = f2
                f2 = fn
                fn = f1 + f2
                
                if (n == fn){
                    return true
                }
            }
        }
        return false
    }
}

let n = 89
if n.checkFibonaci(){
    print("\(n) la so Fibonaci")
} else {
    print("\(n) khong la so Fibonaci")
}

//------------------------------------------------------------------------------------------
//--------Su dung Protocol va delegate xay dung class

// kha nang hanh dong
protocol AnimalAction {
    func performAction(action: String, animal: BaseAnimal)
}

// B - Hành động của động vật (lấy hàm từ protocol)
class Animal: AnimalAction {
    func performAction(action: String, animal: BaseAnimal) {
        print("\(animal.name) chuẩn bị \(action)")
    }
}

// A - Boss: động vật  ( A uỷ quyền cho đối tượng B làm việc thông qua  ptotocol mà B cần tuân thủ)
class BaseAnimal {
    var name: String
    var delegate: AnimalAction?
    
    init(name: String) {
        self.name = name
    }
    
    func willAction(action: String) {
        delegate?.performAction(action: action, animal: self)
        print("\(name) đang \(action)")
    }
}

class Dog: BaseAnimal {}
class Cat: BaseAnimal {}
class Eagle: BaseAnimal {}

// Sử dụng
let actionHandler = Animal()

let dog = Dog(name: "Chó")
dog.delegate = actionHandler
dog.willAction(action: "sủa")

let cat = Cat(name: "Mèo")
cat.delegate = actionHandler
cat.willAction(action: "bắt chuột")

let eagle = Eagle(name: "Đại bàng")
eagle.delegate = actionHandler
eagle.willAction(action: "bay")
