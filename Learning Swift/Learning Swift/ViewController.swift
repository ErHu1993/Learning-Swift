//
//  ViewController.swift
//  Learning Swift
//
//  Created by mac on 17/2/17.
//  Copyright © 2017年 xingka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
        
        
        //逃逸闭包
        var completionHandlers: [() -> Void] = [];//使闭包“逃逸”出函数的方法是，将这个闭包保存在一个函数外部定义的变量中。
        func someFunctionWithEscapingClosure(completionHandler : @escaping () -> Void) {
            //例如:启动异步操作的函数接受一个闭包参数作为 completion handler。这类函数会在异步操作开始之后立刻返回，但是闭包直到异步操作结束后才会被调用。在这种情况下，闭包需要“逃逸”出函数，因为闭包需要在函数返回之后被调用
            completionHandlers.append(completionHandler);
        }
        
        //非逃逸闭包
        func someFunctionWithNonescapingClosure(closure: () -> Void) {
            closure()
        }
        
        class SomeClass {
            var x = 10
            func doSomething() {
                someFunctionWithEscapingClosure { self.x = 100 }
                someFunctionWithNonescapingClosure { x = 200 }
            }
        }
        
        let instance = SomeClass()
        instance.doSomething()
        print(instance.x)
        // 打印出 "200"
        
        completionHandlers.first?()
        print(instance.x)
        // 打印出 "100"
        
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

