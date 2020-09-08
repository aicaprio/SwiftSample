//
//  samples.swift
//  SwiftSample
//
//  Created by Franklin on 2020/9/7.
//  Copyright © 2020 AICAPRIO. All rights reserved.
//

import Foundation

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

// 尾随闭包
func closuresSample1() {
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
    // strings 常量被推断为字符串类型数组，即 [String]
    // 其值为 ["OneSix", "FiveEight", "FiveOneZero"]
    printArray(strings)
}

func makeIncrement(_ amount :Int) -> () -> Int{
    var total = 0
    func realIncrement() -> Int{
        total += amount
        return total
    }
    return realIncrement
}

var increasByOne = makeIncrement(1)

var increasByTen = makeIncrement(10)

// 测试值捕获
func testValueCapture(){
    print(increasByOne())
    print(increasByOne())
//    print(makeIncrement(1)())
//    print(makeIncrement(1)())
//    print(makeIncrement(1)())
    print(increasByTen())
    print(increasByTen())
    print(increasByOne())
    print(increasByTen())
}


// 逃逸闭包
// 将一个闭包标记为 @escaping 意味着你必须在闭包中显式地引用 self
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}


// 注意arg1不是闭包，它的表示的是类型为"() -> String"的函数类型的一个对象.
let obj1 = {names.remove(at: 0)}

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

// 不使用自动闭包的情况
func serve1(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}


func serve2(customer customerProvider: @autoclosure () -> String){
     print("Now serving \(customerProvider())!")
}

func autoclosureTesting(){
    // 打印出“Now serving Alex!”
    serve1(customer: { customersInLine.remove(at: 0) })
    // 打印“Now serving Ewa!”
    serve2(customer : customersInLine.remove(at: 0))
}



func runTotalSamples(){
//    closuresSample1()
//    testValueCapture()
    autoclosureTesting()
}


func printArray(_ arr:[Any]?){
    if(arr==nil) {return}
    
    for (index,value) in arr!.enumerated() {
        print("Index\(index) = \(value)")
    }
}



