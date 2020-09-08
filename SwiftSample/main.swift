//
//  main.swift
//  AnotherSwiftSample
//
//  Created by Franklin on 2020/6/12.
//  Copyright © 2020 Franklin. All rights reserved.
//

import Foundation

runTotalSamples()

func greet(person:String) -> String{
    let greeting="Hello \(person), Will you a great day!"
    return greeting
}

//print(greet(person: "Jack"))

var arr1 = Array(repeating: "CHRISTOPHONE", count: 3)

//for position in arr1.indices{
//    print("position \(position) in arr1 is \(arr1[position])")
//}

var arr2 = Array(repeating: 3, count: 7)

var arr3 = Array(repeating: 7, count: 3)

var arr5 = arr2 + arr3

//for position in arr5.indices{
//    print("position \(position) in arr5 is \(arr5[position])")
//}

for (index,value) in arr5.enumerated(){
//    print("index \(index) = \(value)")
}

var str1 = #"Line1 \nLine2"#
var str2 = #"Line1 \#nLine2"#
var str3 = """
Line1 \nLine2
"""
//print(str1)
//print(str2)
//print(str3)


var dic = [String:String]()
dic = ["k1":"v1" , "k2":"v2"]
for(k,v) in dic{
//    print("key = \(k) , value =\(v)")
}


for i in 1..<60{
//    print("i is \(i)")
}


for time in stride(from: 0, to: 30, by: 5){
//    print("Every 5 minutes of time is \(time)")
}

for time in stride(from: 0, through: 30, by: 5){
//    print("Every 5 minutes of time is \(time)")
}


let point1 = (2,0)
let point2 = (0,3)
let point3 = (7,9)
//switch point3 {
//   case (let x, 0):
//       print("on the x-axis with x value of \(x)")
//   case (0, let y):
//       print("on the y-axis with y value of \(y)")
//   case (let x, let y):
//       print("not on x-axis or y-axis with value of (\(x),\(y))")
//}

let point5 = (6,6)
let point6 = (3,-3)
let point7 = (5,2)
//switch point7{
//case let (x,y) where x==y:
//    print("x == y , the value is (\(x),\(y))")
//
//case let (x,y) where x==(-y):
//    print("x == -y , the value is (\(x),\(y))")
//default:
//    print("Not particular")
//}


func greeting(person :[String:String]){
    guard  let name = person["name"] else{
        return
    }
    
    print("Name is \(name)")
    
    guard let destination = person["destination"] else{
        print("I hope the weather is nice near you")
        return
    }
    
    print("I hope the weather is nice in \(destination)")
    
}


let person1=["name":"Jack"]
let person2=["name":"Lucy","destination":"Chicago"]

//greeting(person: person1)
//greeting(person: person2)

func greeting2(_ name:String , age:Int)->String{
    "Hello \(name), I konw you are \(age)"
}

//print(greeting2("Jack", age: 17))

func greeting3(name: String , age: Int = 20)->String{
    "Hello \(name), I konw you are \(age)"
}

//print(greeting3(name : "Jack"))

func average(_ nums: Double...) -> Double{
    var sum = 0.0
    let count = Double(nums.count)
    for num in nums{
        sum+=num
    }
   return sum/count
}

let averageResult = average(1.0, 3.0, 5.0, 7.0, 10.0)

//print("平均数为：\(averageResult)")

func swap(_ a: inout Int, _ b: inout Int){
    let temp = a
    a = b
    b = temp
}

var x = 100

var y = 10000

//print("交换前：x=\(x), y=\(y)")

swap(&x, &y)

//print("交换后：x=\(x), y=\(y)")

func greeting5(_ name: String, from hometown: String) -> String {
    "Hello \(name), I think your hometwown is \(hometown)"
}

//print(greeting5("Jack", from: "Shenzhen"))

func addTwoNumber(_ num1: Int, _ num2: Int) -> Int{
    return num1+num2
}

func multipleNumber(_ num1:Int, _ num2: Int) -> Int{
    return num1*num2
}

// 给字段赋值函数类型，方式一
var methodTwoInt = addTwoNumber(_:_:)

//print("1123 + 123123 = \(methodTwoInt(1123,123123))")

// 给字段赋值函数类型，方式二
var methodTwoInt2 : (Int, Int) -> Int = multipleNumber

//print("1123 * 321 = \(methodTwoInt2(1123,321))")


func printTowInt(_ methodTwoInt: (Int, Int) -> Int , _ num1: Int, _ num2: Int){
    print("Two Int \(num1) \(num2) result :\(methodTwoInt(num1,num2))")
}

//printTowInt(addTwoNumber, 179, 611)

func chooseMethod(_ type: Int) -> (Int, Int) -> Int{
    switch type {
    case 1:
        return addTwoNumber
    default:
        return multipleNumber
    }
}


/* 看下这个写法 */
//print(chooseMethod(1)(112,2323))

var resultMoethod1 = chooseMethod(1)

var resultMoethod2 = chooseMethod(3)

//print(resultMoethod1(112,2323))
//
//print(resultMoethod2(112,2323))


var names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func sortWay(str1: String, str2: String) -> Bool {
//    return str1 > str2
    return str1 < str2
}


// 用函数代替辩闭包
names.sort(by: sortWay)

// 闭包常规样式
names.sort(by: {(str1: String, str2: String) -> Bool in
   return str1 < str2
})

// 闭包样式：去掉参数类型，因为所有的闭包的类型都可以根据上下文推导而来
names.sort(by: {(str1,str2) -> Bool in
   return str1 < str2
})

// 闭包格式：去掉参数类型，参数列表外的括号，以及->和返回值
names.sort(by: {str1,str2 in return str1 < str2})

// 闭包格式：去掉参数类型，参数列表外的括号，以及->和返回值 ， 还有retrun关键字
names.sort(by: {str1,str2 in str1 < str2})

// 闭包终极格式：去掉参数类型，参数列表外的括号，以及->和返回值 ， 还有retrun关键字，
// 还有参数(用$0 ,$1代替第一个参数还有第二个参数)，还有 in关键字
names.sort(by: {$0 < $1})

// 闭包终极格式的终极格式：自己体会（没错，参数，大括号都没了...）
names.sort(by: <)

// 尾随闭包(函数的最后一个参数是闭包时)
names.sort(){
    $0 < $1
    // <   //显然不能这么写
}


for (index, value) in names.enumerated(){
//    print("Index \(index)'s value is \(value)")
}



