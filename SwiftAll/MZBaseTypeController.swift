
//
//  MZBaseTypeController.swift
//  SwiftAll
//
//  Created by 小明仔子 on 2018/2/5.
//  Copyright © 2018年 Ming. All rights reserved.
//

import Foundation
import UIKit


class MZBaseTypeController: MZBaseViewController {
    
 
    override func viewDidLoad() {
        
        
        
//        self.studyDateType();
//        self.studyVar();
//        self.studyOptionalType();
//        self.studyAdd();
//        self.studyLiuCheng();
//        self.studyString();  替换哪个方法????????????
//        self.studyArray();
        self.studyDictionary();
        
        
        
    }
    
    func studyDictionary(){
        
//        var dictionary = [("key1",1),("key2",2)];
//
//        print(dictionary.count);
        
//        let values  = ["1","2","3","4","5"];
        let digitWords = ["one", "two", "three", "four", "five"]
        let wordToValue = Dictionary(uniqueKeysWithValues: zip(digitWords, 1...5))
        let di = Dictionary(uniqueKeysWithValues : zip(digitWords, 1...5));
        print(di);
        
//            Dictionary(zip(digitWords, 1...5));
        
        var dic  = [Int : String]();
        
        
        

//        dictionary =
        
    }
    
    
    
    func studyArray(){
        // 创建一个数组
        var channelId = Array<String>(arrayLiteral: "20","30");
        for item in channelId {
            print(item);
        }
        
        // 添加一个数组 X 遍
//        channelId = Array(repeating: "item", count: 10);
//        for item in channelId {
//            print(item);
//        }
//
        
        // 声明一个 数组 ，item类型为String
        // var someStr = [String]();
        
        // 声明一个 数组 ，item类型为Int
        var somes = [Int]();
        somes.append(2);
        somes.append(10);
        somes += [21];
//        for item in somes {
//            print(item);
//        }
        
        for (index,item) in somes.enumerated() {
            if index == 1{
                print(item);
            }
        }
       
        let  index =  somes.index(of: 100);
        print(index);
        
        
        
        
        
    }
    
    func studyString(){
        
        
        var str = "";
        if str.isEmpty {
            print("str is nil")
        }else{
            print("str is not nil");
        }
        
        str = String();
        if str.isEmpty {
            print("str is nil")
        }else{
            print("str is not nil");
        }
        
        str = String("string intit");
        print(str);
        
        //字符串插入值
        var version = "3.4.2";
        print("Current Version is \(version )");
        
        let a = 4;
        let b = 13;
        print("you can sum in str \(a + b)");

        
        // 字符串拼接
        var strName = "stringA  2018-09-2";
        var strB = " strinb";
//        strName.append(strB);
        strName = strName + strB;
        print(strName);
        var c :  Character = "x";
        strName.append(c);
        print(strName);
        
        // 字符串长度
        print(strName.characters.count);
        
        //
        let  isHttp =  strName.hasPrefix("http");
        print(isHttp);
        
        
        let isMulti = strName.hasSuffix("s");
        print(isMulti);
        
        // 转换
        var intStr = "23412";
        let intX =  Int(intStr);
        print(intStr);
        
        
        //
        for c in strName.characters {
            print(c);
        }
        
       
        
        
        print(strB);
        
        
//        strName.replacingOccurrences(of: "/", with: "-");
//        strName.replacingOccurrences(of: <#T##StringProtocol#>, with: <#T##StringProtocol#>)
//        print(strName);
        
        
    }
    
    
    func studyLiuCheng(){
        
       
        
        
    }
    

    func studyAdd (){
        
        // 算术运算
        // !!!!!!!!!!!!!!!! swift 3 取消了 ++ --
        var x  = 1+2;
        print(x);
        x = 2-3;
        print(x);
        x = 2 * 3;
        print(x);
        x = 5 % 10;
        print(x);
        
        // 比较运算符 == != > < >= <=
        
        // 逻辑  &&  ||  !
        
        // 位运算符

        /*
            p       q       p & q      p | q       p^q
            0       0        0          0           0
            0       1        0          1           1
            1       0        0          1           1
            1       1        1          1           0
         
         & 必须两个都为 真
         | 只要有一个为 真
         ^  连个值不相同就为 真
         ~ 取反  0 --> 1       1 --> 0
         << 按位左移动    1111 1111 -->  1111 1100
         >> 按位右移动    1111 1111 -->  0011 1111
         
         
         */
        let intA = 123;
        let intB = 234;
        var  intC = 12;
        let left =  intC << 2;
        let right = intC >> 2;
        print("位运算");
        print("\(intA & intB)");
        print("\(intA | intB)");
        print("\(intA ^ intB)");
        print("\(~intA)");
        print("<<= \(left) >>= \(right)");
        
        
        // 区间运算符
        // a..b 有 a,x1,x2,x3,b， a..<b 有 a,x1,x2,x3, 不含b
        print("a..b");
        for x in 1...5 {
            print(x);
            
        }
        
        print("a..<b");
        for x in 1..<5 {
            print(x);
        }
        
    }
    
    func studyOptionalType () {
        
        // Optional 可选类型 用于处理值缺失的情况
        // 可能有可能没有值   值默认为nil  Optional 本质是一个枚举
//        var  optionalInteger :Int?;
//        print(optionalInteger);
        
        
        var stringA = "name";
        let stringB : String? = "calss";
        // 隐式拆包用 '!' 来声明，表示确认该值不为nil，一定存在
        stringA.append(stringB!);
        //1. 无论声明的String?还是String!其实都是一个Optional，所以值都可能为nil；
        
    }
    
    
    func studyVar () {
        
        // 声明变量
        var varA :Float;
        varA = 123.23;
        print(varA);
        
        print("var ==\(varA)");
        
    }
    
    func studyDateType() {
        // 打印
        for x  in 0...10 {
            print("\(x)",terminator:"");
            
        }
        
        // 数据类型 Int 整型 Double 浮点型  Decimal 小数型
        /*
         Int 32位长度 与Int32 相同
         Int 64位长度 与Int64 相同
         
         Double 64 位 浮点数 15位数字 100 0000 0000 0000  ||  100 千亿
         Float 32 位 浮点数 6位数字 10 0000
         
         Bool  是 否
         
         
         
         */
        
        let x :Int = 10; // let 定义常量
        var m  : Int = 24 // var 声明变量
        m = 20
        let sum  = 4+9;
        print(x);
        print(m);
        print(sum);
        
        // 给类型起别名
        typealias MZInt  = Int;
        let  mzx :MZInt  = 208;
        print(mzx);
        
        
        var count : Double = 123.0234;
        count = 123123.023;
        print(count);
        
        let   money :Decimal = 5628.23;
        print(money);
        
        
        // bool 三个值  nil  ture  false
        var  bool :Bool?;
        print(bool);
        bool = true;
        print(bool);
        bool = false;
        print(bool);
        
        // 进制
        var  double = 17;
        
        double = 0x11; // 16 进制
        double = 0b100101; // 2 进制
        double = 0o21; // 8 进制
        print(double);
    
        
        // 类型安全，如果不匹配，编译会报错 ps:
//        var min = 10;
//        min = "min become string";
//        print(min);
        
        // 类型推断，如果不表明，回自己推断
        var  varA = 1234.00123;
        varA = 132134.12934;
        print(varA);
        
        
        
        
        // 类型转换
        let numberOj :NSNumber = NSNumber.init(value: count);
        
        let getStr = NumberFormatter.init().string(from: numberOj);
        print(getStr!);
        
        
    }
    
    
}
