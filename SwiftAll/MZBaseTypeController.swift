
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
    
    let  host = "http://192.2.3.10:8013";

   
    
    override func viewDidLoad() {
        
        
        
//        self.studyDateType();
//        self.studyVar();
//        self.studyOptionalType();
//        self.studyAdd();
//        self.studyLiuCheng();
//        self.studyString();
//        self.studyArray();
//        self.studyDictionary();
//        self.studyFunc();
        self.studyClosures();
        
        
    }
    
    
    func studyClosures () {
        
        // 定义闭包
        let studname = {print("swift closures")};
        // 执行闭包
        studname();
        
        
        // 定义带参数 带返回值的 的闭包  并执行
        let clickCellCommentIcon = {(conent:String,model:String) -> Bool in
            print("content: \(conent) model:\(model)");
            return true;
        };
        let returnKey =  clickCellCommentIcon("I think It is evry good","info : comment,iphone");
        if returnKey {
            print(returnKey);
        }
        
        
        
    }
    
    
    func studyFunc() {
        
        let fullUrl = self.dealUrl(urlStr: "/commentList");
        print("\(fullUrl)");
        
        // 返回元组
        var result =  self.getCommentList(url: fullUrl);
        if result!.success {
            print(result?.result["resultDic"] ?? "加载失败");
        }else{
            print("加载失败");
        }
        
        // 可变参数
        self.vars(number: "1","2","3");
        self.vars(number: 1,2,33,45);
        
        //使用函数类型
       //  在 Swift 中，使用函数类型就像使用其他类型一样。例如，你可以定义一个类型为函数的常量或变量，并将适当的函数赋值给它：
        let addtion : (Int ,Int ) ->Int = sumVars(numb:numc:);
        print("the var type is function ,how amazing ,right ? let me show you that \(addtion(40,90))");
        
        //函数类型作为参数类型、函数类型作为返回类型
        
    
        func sum(a: Int, b: Int) -> Int {
            return a + b
        }
        var additionType: (Int, Int) -> Int = sum
        print("输出结果: \(additionType(40, 89))")
        
        func another   (addtion:  (Int, Int) -> Int, a :Int ,b:Int) ->Int{
            print("\(addtion(a,b))");
            return addtion(a,b);
        }
        
        
        let  x =   another(addtion :sum(a:b:), a: 10,b: 20);
        print("x = \(x)");
        
        
        
    }
    
    func sumVars(numb :Int, numc :Int) -> Int {
        
        return numb + numc;
    }
    
    func vars<N>(number :N...)  {
        
        for item in number {
            print("item = \(item)");
        }
    }
    
    func getCommentList (url : String) -> ( success :Bool, result : Dictionary<String, NSArray>)? {
        
        let resultArr = Array<String>(arrayLiteral: "20","30");
        let dic = ["resultDic": resultArr];
        
        var  res : Bool = false;
        
        let x = arc4random() % 100;
        if (x%2 == 1) {
            res = true;
        }
        return (res  , dic as Dictionary<String, NSArray>);
    }
    
    
    func dealUrl(urlStr : String) -> String {
        
        if urlStr.isEmpty {
            return "";
        }
        return host.appendingFormat(urlStr, 0);
    }
    
    func studyDictionary(){
        
//        var dictionary = [("key1",1),("key2",2)];
//
//        print(dictionary.count);
        
//        let values  = ["1","2","3","4","5"];
//        let digitWords = ["one", "two", "three", "four", "five"]
//        let wordToValue = Dictionary(uniqueKeysWithValues: zip(digitWords, 1...5))
//        let di = Dictionary(uniqueKeysWithValues : zip(digitWords, 1...5));
//        print(di);
//
//            Dictionary(zip(digitWords, 1...5));
        
//        var dic  = [Int : String]();
//
//        dic.updateValue("newVaules", forKey: 3);
//        print(dic);
        
        // 声明并赋值一个字典  key 为 int value为字符串
        var responseWord = [404:"Not Net",
                            502:"Service False",
                            505:"error",
                            200:"Success",
                            600:"Unknown"];
        
        
        print(responseWord.keys);
        print(responseWord.values);
        
        print(responseWord[200] ?? 10);
        
        
        
        //
        let httpResponseCode = [200,403,301];
        for code in httpResponseCode {
            
            if let message = responseWord[code]{
                
                print("Response\(code) :\(message)");
            }else{
                print("Unknown Code :\(code)");
            }
        }
        
        responseWord[301] = "Moved permanently";
        print(responseWord[301]);
        
        // 值为空，则自动过滤掉了，
        responseWord[500] =  nil;
        print(responseWord);
        print(responseWord[500]);
        
        httpResponseCode.sorted();
        print(httpResponseCode);
        
        let imagePaths = ["star": "/glyphs/star.png",
                          "portrait": "/images/content/portrait.jpg",
                          "spacer": "/images/shared/spacer.gif"];
        
        for (name ,path)  in imagePaths {
            
            print("\(name) is in path:\(path)");
        }
        
        let glyphIndex = imagePaths.index { $0.value.hasPrefix("/glyphs") };
        if let index = glyphIndex{
            print("The '\(imagePaths[index].key)' image is a glyph.")
        }else{
            print("No glyphs found!")

        }
        
        // 定义一个字典

        var initDic = [String:String]();
        
        initDic["name"] = "harerbin";
        
        print(initDic);
        
        
        
        var initDicOne :[Int:String] = [1:"chemingming",2:"jiangling",3:"jiangdaming"];
        print(initDicOne[2] ?? "");
        
        // 更新values
        initDicOne.updateValue("wawa", forKey: 2);
        print(initDicOne[2] ?? "");
        
        initDicOne[2] = "new wawa";
        print(initDicOne[2] ?? "");

//        initDicOne.removeValue(forKey: 2);
//        print(initDicOne[2] ?? "空值");
        // 遍历
        for (key,values) in initDicOne {
            print("key :\(key)  == values \(values)");
        }
        
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
        
        
        
        var intTypeArr = [Int]();
        intTypeArr.append(10);
        intTypeArr.append(500);
        
        
        
        
        intTypeArr += [60];
        
        print(intTypeArr[2]);
        
        // 遍历数组
        for item in intTypeArr {
            
            print(item);
        }
        
        
        for (index ,item) in intTypeArr.enumerated() {
            
            print(" 第 \(index)个为:\(item)");
        }
        
        // add Arr
        var intsA = [Int](repeating: 2, count:2)
        var intsB = [Int](repeating: 1, count:3)
        var intsC = [Int](repeating: 3, count:10);
        
        intsC = intsA + intsB + intsC;
        print(intsC);
        
//        intsC.count;
        
        
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
        
        // 类型推断，如果不表明，会自己推断
        var  varA = 1234.00123;
        varA = 132134.12934;
        print(varA);
        
    }
    
    
}
