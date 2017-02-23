//
//  ViewController.swift
//  Learning Swift
//
//  Created by mac on 17/2/17.
//  Copyright © 2017年 xingka. All rights reserved.
//

import UIKit
//枚举
enum CompassPoint {
    case north
    case south
    case east
    case west
}

enum Planet: Int {//当使用整数作为原始值时，隐式赋值的值依次递增1。如果第一个枚举成员没有设置原始值，其原始值将为0。
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}


enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

//递归枚举  indirect关键字标识递归，可修饰枚举，也可修饰枚举中某成员
indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}

class ViewController: UIViewController {

    //枚举赋值放到函数外可以消除警告
    var directionToHead = CompassPoint.west;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //赋值和输出
        var serverResponseCode: Int? = 404  //?说明是可选类型 也就是说可能包含 Int 值也可能不包含值
        serverResponseCode = nil;
//        Swift 的 nil 和 Objective-C 中的 nil 并不一样。在 Objective-C 中，nil 是一个指向不存在对象的指针。在 Swift 中，nil 不是指针——它是一个确定的值，用来表示值缺失。任何类型的可选状态都可以被设置为 nil，不只是对象类型。
        print(serverResponseCode);
        
        let twoThousand: UInt64 = 23_000_000;
        print("this is print \(twoThousand) ");
        
        typealias AudioSample = UInt8;
        let MaxNum = AudioSample.max;
        let MinNum = AudioSample.min;
        
        print("max:\(MaxNum) , min:\(MinNum)");
        
        var possibleValue: NSString? = nil;// ? :可选类型暗示了常量或者变量可以“没有值”
        possibleValue = "0";
        
        if let actualNum =  possibleValue?.intValue {
            print("\n actualNum is \(actualNum)");
        }else{
            print("\n possibleValue is \(possibleValue)");
        }
        
        let possibleString : NSString? = "An optional string."
        let forcedString : NSString = possibleString!;// 需要感叹号来获取值
        
        let assumedString: String! = "An implicitly unwrapped optional string."
        let implicitString: String = assumedString  // 不需要感叹号
        
        //String(值类型 将字符串作为值类型的同时可以获得极高的性能。) 与 NSString(引用类型) 的区别参照 http://www.cnblogs.com/dsxniubility/p/4784124.html
        if implicitString.isEmpty && forcedString.boolValue {
            print(assumedString)
        }
        
        //断言
        let age = 3
        assert(age >= 0, "A person's age cannot be less than zero") // 如果 age < 0，断言会触发
        
        //元组
        var httpError = (status:404,statusMessage:"Not Found",code:400,data:"json");
        httpError.status = 1;
        httpError.statusMessage = "Success"
        print(httpError);
        
        let (stauts,message,_,_) = httpError;
        print("status is \(stauts) message is \(message) \n");
        
        
        //空合运算符 a??b 相当于 a != nil ? a! : b
        let defaultColorName = "redColor"
        let userDefinedColorName: String? = nil;  //默认值为 nil
        let colorNameToUse = userDefinedColorName ?? defaultColorName
        print(colorNameToUse);
        
        //区间运算
        for index in 1..<5 {
            print("\(index) * 5 = \(index * 5)")
        }
        
        //字符串
        let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"];
        let catString = String(catCharacters);
        print(catString);
        
        let eAcute: Character = "\u{E9}"                         // é
        let combinedEAcute: Character = "\u{65}\u{301}"          // e 后面加上  ́
        print(eAcute,combinedEAcute);// eAcute 是 é, combinedEAcute 是 é
        
        let greeting :String! = "Guten Tag";
        print("afterChar:\(greeting[greeting.index(after: greeting.startIndex)]) offsetChar \(greeting[greeting.index(greeting.startIndex, offsetBy: 7)]) \n");
        
        for index in greeting.characters.indices {
            print("\(greeting[index]) ", terminator: "")
        }
        
        //数组
        var threeInts = [Int](); threeInts = Array(repeatElement(6, count: 3));
        print(threeInts);
        
        for (index,value) in threeInts.enumerated() {//enumerated()返回一个由每一个数据项索引值和数据值组成的元组
            print("Item \(String(index + 1)): \(value)")
        }
        
        //字典
        var namesDictionary = [Int : String]();// var namesDictionary:Dictionary! = [:]:空字典
        namesDictionary[1] = "xiaoMing";
        namesDictionary.updateValue("xiaoWang", forKey: 1);
        namesDictionary.updateValue("xiaoMing", forKey: 2);
        namesDictionary.updateValue("xiaoHong", forKey: 3);
        namesDictionary.removeValue(forKey: 2);
        
        for (id, name) in namesDictionary {
            print("\(id): \(name)")
        }
        
        //控制流
//        let name :String! = namesDictionary[1];
//        guard  name ==  "xiaoMing" else {
//            print(namesDictionary[3]);//条件不满足时执行
//            return;
//        }
//        print(name);
        
        if #available(iOS 10,OSX 10.12, *) {
            // 在 iOS 使用 iOS 10 的 API, 在 macOS 使用 macOS 10.12 的 API
            print("iOS 10+");
        }else{
            // 使用先前版本的 iOS 和 macOS 的 API
            print("iOS 10-");

        }
        
        if  let bounds = minMax(argentLael: [8, -6, 2, 109, 3, 71]){
            print("min is \(bounds.min) and max is \(bounds.max)");
        }
        
        if  let bounds = minMax(argentLael:[]){
            print("min is \(bounds.min) and max is \(bounds.max)");
        }
        
        print(greet(person: "erhu", from: "dalian"));
        
        
        print(arithmeticMean(2.2,2.2,3.3));
        
        
        var someInt = 3
        var anotherInt = 107
        swapTwoInts(&someInt, &anotherInt)//函数中要改变参数值要加在参数定义前加 inout 关键字 ,需要在参数名前加 & 符
        
        print("func : swapTwoInts == > someInt \(someInt) , anotherInt \(anotherInt)");
        
        let anotherSwapTwoInts = swapTwoInts;//函数类型直接赋值
        anotherSwapTwoInts(&someInt,&anotherInt);
        
        print("func : anotherSwapTwoInts == >  someInt \(someInt) , anotherInt \(anotherInt)");
        
        
        var currentValue = 3;
        let moveNearerToZero = chooseStepFunction(backward: currentValue > 0);//moveNearerToZero是一个指向函数的常量
        while currentValue > 0 {
            print("\(currentValue)... ")
            currentValue = moveNearerToZero(currentValue);
        }
        print("zero!")
        
     
        //函数闭包
        let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"];
        var reversedNames = names.sorted { (s1 : String, s2 : String) -> Bool in
            //闭包表达式参数 可以是 in-out 参数，但不能设定默认值。
            return s1 < s2;
        };
        print(reversedNames);
        
        reversedNames = names.sorted(by: {s1 ,s2 in s1 < s2}); //单表达式闭包隐式返回
        print(reversedNames);
        
        reversedNames = names.sorted(by: {$0 > $1}); //参数名称缩写 ,可以直接通过 $0，$1，$2 来顺序调用闭包的参数，以此类推
        print(reversedNames);
        
        reversedNames = names.sorted(by: <);// Swift 的 String 类型定义了关于大于号（>）的字符串实现，其作为一个函数接受两个 String 类型的参数并返回 Bool 类型的值
        print(reversedNames);
        
        let digitNames = [
            0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
            5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
        ]
        
        let numbers : Array = [16,58,510];
        let strings = numbers.map {
            (number) -> String in
            var number = number
            var output = ""
            repeat {
                output = digitNames[number % 10]! + output
                number /= 10
            } while number > 0
            return output
        }
        print(strings);
        
        
        let incrementByTen = makeIncrementer(foIncrement: 10);
        var numTen = incrementByTen();
        numTen = incrementByTen();

        let incrementBySeven = makeIncrementer(foIncrement: 7);
        var numSeven = incrementBySeven();
        numSeven = incrementBySeven();
        numTen = incrementByTen();
        
        print("incrementBySeven: \(numSeven)  incrementByTen :\(numTen)");
        
        
        
        //枚举
       
        directionToHead = CompassPoint.north;
        
        switch directionToHead {
        case .north:
            print("Lots of planets have a north")
        case .south:
            print("Watch out for penguins")
        case .east:
            print("Where the sun rises")
        case .west:
            print("Where the skies are blue")
        }
        
//        var productBarcode = Barcode.upc(8, 85909, 51226, 3)
//            productBarcode = .qrCode("ABCDEFGHIJKLMNOP")
//        
//        switch productBarcode {//警告处理类似上面枚举
//        case .upc(let numberSystem, let manufacturer, let product, let check): //如果一个枚举成员的所有关联值都被提取为常量，或者都被提取为变量，为了简洁，你可以只在成员名称前标注一个let或者var 例如: case let .upc(numberSystem, manufacturer, product, check):
//            print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
//        case .qrCode(let productCode):
//            print("QR code: \(productCode).")
//        print("QR code: \(productCode).")
//    }
        
        print("Planet.earth.rawValue == > \(Planet.earth.rawValue)");
        
        
        let positionToFind = 11;
        let somePlanet = Planet(rawValue: positionToFind);
        if (somePlanet == nil) {
            print("There isn't a planet at position \(positionToFind)")
        }
        
        let five = ArithmeticExpression.number(5);
        let four = ArithmeticExpression.number(4);
        let sum = ArithmeticExpression.addition(five, four);
        let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2));
        
        
        print("(5 + 4) * 2 = > \(evaluate(product))");
        
        
        //类(引用类型)和结构体（值类型）
        struct Resolution {
            var width = 0
            var height = 0
        }
        class VideoMode {
            var resolution = Resolution()
            var interlaced = false
            var frameRate = 0.0
            var name: String?
        }
//        字符串、数组、和字典类型的赋值与复制行为
//        Swift 中，许多基本类型，诸如String，Array和Dictionary类型均以结构体的形式实现。这意味着被赋值给新的常量或变量，或者被传入函数或方法中时，它们的值会被拷贝。
//        Objective-C 中NSString，NSArray和NSDictionary类型均以类的形式实现，而并非结构体。它们在被赋值或者被传入函数或方法时，不会发生值拷贝，而是传递现有实例的引用。
        
        
        class DataImporter {
            /*
             DataImporter 是一个负责将外部文件中的数据导入的类。
             这个类的初始化会消耗不少时间。
             */
            var fileName = "data.txt"
            // 这里会提供数据导入功能
        }
        
        class DataManager {
            lazy var importer = DataImporter()
            var data = [String]()
            // 这里会提供数据管理功能
        }
        
        let manager = DataManager()
        manager.data.append("Some data")
        manager.data.append("Some more data")
        // DataImporter 实例的 importer 属性还没有被创建
        print(manager.importer.fileName);// DataImporter 实例的 importer 属性现在被创建了
        //注意: 如果一个被标记为 lazy 的属性在没有初始化时就同时被多个线程访问，则无法保证该属性只会被初始化一次。
        
        
        
        //属性
        struct Point {
            var x = 0.0, y = 0.0
        }
        struct Size {
            var width = 0.0, height = 0.0
        }
        
        struct Rect{
            
            var origin = Point();
            var size = Size();
            var center : Point{
                //自定义getter,setter属性
                get{
                    let centerX = origin.x + (size.width) / 2;
                    let centerY = origin.y + (size.height / 2);
                    return Point(x: centerX,y:centerY);
                }
                
                set(newCenter) { //也可以不使用newCenter 系统提供newValue参数
                    origin.x = newCenter.x - (size.width / 2)
                    origin.y = newCenter.y - (size.height / 2)
                }
            }
        }
        
        var square = Rect(origin: Point(x: 0.0, y: 0.0),
                          size: Size(width: 10.0, height: 10.0))
        square.center = Point(x: 15.0, y: 15.0)
        print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
        
        
        //属性观察器
        //属性通过 in-out 方式传入函数，willSet 和 didSet 也会调用。这是因为 in-out 参数采用了拷入拷出模式：
        class StepCounter {
            var totalSteps: Int = 0 {
                willSet(newTotalSteps) {
                    print("About to set totalSteps to \(newTotalSteps)")
                }
                didSet {
                    if totalSteps > oldValue  {
                        print("Added \(totalSteps - oldValue) steps")
                    }
                }
            }
        }
        let stepCounter = StepCounter()
        stepCounter.totalSteps = 200
        // About to set totalSteps to 200
        // Added 200 steps
        stepCounter.totalSteps = 360
        // About to set totalSteps to 360
        // Added 160 steps
        stepCounter.totalSteps = 896
        // About to set totalSteps to 896
        // Added 536 steps
        
        // 在全局或局部范围都可以定义计算型变量和为存储型变量定义观察器。计算型变量跟计算属性一样，返回一个计算结果而不是存储值，声明格式也完全一样。全局的常量或变量都是延迟计算的，跟延迟存储属性相似，不同的地方在于，全局的常量或变量不需要标记lazy修饰符。

        
        
        
        
    }
    
    //枚举递归返回值计算
    func evaluate(_ expression: ArithmeticExpression) -> Int {
        switch expression {
        case let .number(num): // 获值
            return num
        case .addition(let left, let right):
            return evaluate(left) + evaluate(right)
        case let .multiplication(left, right):
            return evaluate(left) * evaluate(right)
        }
    }
    
    
    //函数
    func minMax(argentLael array: [Int]) -> (min: Int, max: Int)? { //
        if array.isEmpty { return nil };
        var currentMin = array[0];
        var currentMax = array[0];
        for value in array[1..<array.count] {
            if value < currentMin {
                currentMin = value;
            } else if value > currentMax {
                currentMax = value;
            }
        }
        return (currentMin, currentMax)
    }
    
    func greet (person : String ,from homeTown : String) -> String {
        return "Hello \(person)!  Glad you could visit from \(homeTown)."
    }
    
    
    //可以接受零个或多个值 （类似数组）
    func arithmeticMean(_ numbers : Double...) -> Double {
        var total: Double = 0
        for number in numbers {
            total += number
        }
        return total / Double(numbers.count)
    }
    
    func swapTwoInts(_ a :inout Int,_ b : inout Int) {
        let temporaryA = a
        a = b
        b = temporaryA
    }
    
    //嵌套函数
    func chooseStepFunction(backward: Bool) -> (Int) -> Int {
        func stepForward(input: Int) -> Int { return input + 1 }
        func stepBackward(input: Int) -> Int { return input - 1 }
        return backward ? stepBackward : stepForward
    }

    //闭包
    func makeIncrementer(foIncrement amount : Int) -> () -> Int {
        var runningTotal = 0
        func incrementer() -> Int{
            runningTotal += amount;
            return runningTotal;
        }
        return incrementer;
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

