
//
//  MZBaseTypeController.swift
//  SwiftAll
//
//  Created by 小明仔子 on 2018/2/5.
//  Copyright © 2018年 Ming. All rights reserved.
//

/*
 0000   0
 0001   1
 0010   2
 0011   3
 0100   4
 0101   5
 0110   6
 0111   7
 1000   8
 1001   9
 1010   A
 1011   B
 1100   C
 1101   D
 1110   E
 1111   F
 */
import Foundation
import UIKit


enum enumName{
    case Monday
    case Tuesday
    
}

enum Compasspoint {
    case North
    case South
    case East,West // 也可以一行用逗号隔开
}

// 定义一个叫Barcode的枚举类型，他的一个成员值是具有(int ,int,int ）类型关联值的upc,另一个成员是具有String类型关联值的qrCode
// 不再是固定的关联一个值
enum Barcode {
    case uqc(Int,Int,Int)
    case qrCode(String)
}

enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case linFeed = "\n"
}

struct studentMarks {
    var mark1 = 100
    var mark2 = 78
    var mark3 = 98
}


class MZBaseTypeController: UIViewController {
    
    let  host = "http://192.2.3.10:8013";

    var lbCountCenter : UILabel?;
    
    
   
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    override func viewDidLoad() {
        
        self.priseLabel();

        
        self.studyDateType();
        self.studyVar();
        self.studyOptionalType();
        self.studyAdd();
        self.studyLiuCheng();
        self.studyString();
        self.studyArray();
        self.studyDictionary();
        self.studyFunc();
        self.studyClosures();
        self.studyEnum();
        self.studyStruct();
        self.studyClass();

    }

    func studyClass() {

        // 属性
        /**
         属性
         */


        class FollowModel {

            var userName = "";
            var userIgv = "";
            var userID = "";
        }

    }

    // 学习结构体
    func studyStruct() {

        /**
         Swift 中类和结构体相同的点：
         定义属性用于存值
         定于方法用于提供功能
         定义下标操作使得可以通过下标语法来访问实例所包含的值
         定于构造器用于生成初始化值
         通过扩展增加默认实现的功能
         实现协议

         与结构体相比，类的附加功能：
         可继承
         类型转换允许在运行时检查和解释一个类实例的类型
         析构器允许一个类实例释放其被分配的资源
         引用计数允许对一个类的多次饮用

         *结构体不使用引用计数



         */


        struct Resolution {
            // 定义一个结构体
            var width = 0
            var height = 0
        }

        class VideoMode {
              // 定义一个类
            var resolution = Resolution()
            var interlaced = false
            var frameRate = 0.0
            var name: String?
        }

        // 实例一个类对象和结构体
        let someResolution = Resolution();
        let someVideoMolde = VideoMode();

        // 属性访问
        print("The width of someResolution is \(someResolution.width)")
        print("The width of someVideoMode is \(someVideoMolde.resolution.width)")

        // 赋值
        someVideoMolde.frameRate = 1080.0;

        // 所有的结构体都一个自动生成的构造器
        let vga = Resolution(width: 500, height: 520)

        // 所有的基本类型，都是值类型，在底层是以结构体的形式实现，包括枚举和结构体。在代码传递时候都会被复制。但是类是引用类型
        var cinema = vga; // cinema 是 vga 的拷贝副本，不是vga 本身。
        cinema.width = 400;
        // 猜猜这时候 vga 的宽变了嘛，没有。
        if cinema.width == vga.width{
            print("vga 变了")
        }else{
            print("vga 没变")
        }
        // 引用类型被赋值到另一个对象时候，不会被拷贝。而是被引用
        let entity = VideoMode();
        entity.frameRate = 750.0;

        let otherEntity = entity;
        otherEntity.frameRate = 1034.0;
        // 猜猜变了没
        if entity.frameRate == otherEntity.frameRate {
            print("entity 变了")
        }else{
            print("entity 没变")
        }

        if entity === otherEntity {
            print("他俩拥有一个内存地址，这个恒等式真好用")
        }

        /**
         Swift 中，许多基本类型，诸如String，Array和Dictionary类型均以结构体的形式实现。
         这意味着被赋值给新的常量或变量，或者被传入函数或方法中时，它们的值会被拷贝。

         Objective-C 中NSString，NSArray和NSDictionary类型均以类的形式实现，而并非结
         构体。它们在被赋值或者被传入函数或方法时，不会发生值拷贝，而是传递现有实例的引用
         */

    }

    // 学习枚举
    func studyEnum (){
        // Swift 在创建时不会被赋予一个默认的整形值。每一个枚举都定义了一个全新的类型，有点类似于 类
        var weekDay = enumName.Monday;
        print(weekDay);
        weekDay = enumName.Tuesday;
        print(weekDay);

        var  drection = Compasspoint.West
        drection = Compasspoint.East;
        switch drection {
        case .South:
            print("south")
            break
        case .North:
            print("nouth")
            break
        case .West:
            print("West")
            break
        case .East:
            print("East")
            break
        }
        // 关联值
        // 只能存储这两个值中的一个
        var productBarcode =  Barcode.uqc(4, 4, 4);
//        productBarcode = Barcode.qrCode("AOUHLSKDFH");
        print(productBarcode);

        // 原始值
        print(" \(ASCIIControlCharacter.tab) + \(ASCIIControlCharacter.linFeed)");

        // 递归枚举？？



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
        
        
       // 练习闭包
        let  clickChooseItemBlock = { (chooseTitle:String, choseID:Int) -> Int in
            print("your chooseTitle is \(chooseTitle) and your chooseID is \(choseID)");
            return choseID;
        };
        let chooseID = clickChooseItemBlock("name",10);
        print("you get ID is \(chooseID)");
        
        // 闭包可作为参数传递 例如 系统函数 sorted 函数
        let array = [4,5,234,123,2,-2];
        
        // 1. 直接实现
        var endArray =  array.sorted(){ (m, n) -> Bool in
            return  m < n;
        }
        var  anthorArray = array.sorted { (m, n) -> Bool in
            return m > n;
        }
        
        print(array);
        print(endArray);
        print(anthorArray);
        
        print("======");
        
        // 2.定义两个block
        let smallToBig = { (m :Int , n :Int ) -> Bool in
            return  m < n;
        };
        let bigToSmall = { (m :Int , n :Int ) -> Bool in
            return  m > n;
        };
        
        endArray = array.sorted(by: smallToBig);
        anthorArray = array.sorted(by: bigToSmall);
//        array.sorted(by: <#T##(Int, Int) throws -> Bool#>)
        
        print(endArray);
        print(anthorArray);
        
        
        
       
        let  name = ["3","sd","w","xc","0"];
        // 系统定义了一个 > 符号的 闭包，可直接使用
        let endName = name.sorted(by: >);
        print(endName);
        
        
        
        // 尾随闭包是一个书写在函数括号之后的闭包表达式，函数支持将其作为最后一个参数调用
        
        func somfuncWithClosure (closeure : (() -> Void)){
            closeure();
            print("somfuncWithClosure");
        }
        
        somfuncWithClosure(closeure: {
            print("===");
        });
        
        somfuncWithClosure(){
            print("?????");
        };
        
       
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

        /* String 是值类型、d如果你创建了一个新的字符串，那么当其进行常量、变量赋值操作，
         或在方法中传递时候，会进行值拷贝。在前述情况下，对创建新副本，并对新副本进行操作，而非原始字符

         */
        
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
        let intStr = "23412";
        let intX =  Int(intStr);
        print(intStr);
        
        
        // 遍历字符串，获取每个字符
        print("遍历字符串，获取每个字符")
        for c in "strName.characters" {
            print(c);
        }
        print(strB);

        // 多行字符串
        let x = 19;
        let someString = """
        这里的内容“”“/1345!##@$#@%$@%@##@$$#都是字符串
        aldksjhf ;
        345
        6a5s4
        \0 这是个空字符
        \\ 反斜线
        \t 水平制表符
        \n 换行
        \r 回车
        \" 双引号
        \' 单引号
        \(x)
        """


        // 单个字符
        let catCharacters :Character = "!"
        print("打印字符\(catCharacters)")
        // 多个字符拼成字符串
        let cat :[Character] = ["x","c","x"];
        let catString = String(cat);
        print("打印字符串\(catString)");

        /* Unicode
         为每种语言中的每个字符设定了统一并且唯一的二进制编码，以满足跨语言、跨平台进行文本转换、处理的要求。1990年开始研发，1994年正式公布

         UTF-8以字节为单位对Unicode进行编码 最大长度是8
         00000000 00000000 00000000 00000000

         例如 汉 unicode编码是 0x6c49

         */

        let validUTF8: [CChar] = [67, 97, 102, -61, -87, 0]
        validUTF8.withUnsafeBufferPointer { ptr in
             let s = String(validatingUTF8: ptr.baseAddress!)
             print(s)
        }

        // 可扩展的字形集
        let eAcute:Character = "\u{e9}";
        let commbinedAcute:Character = "\u{65}\u{301}";
        print(eAcute);
        print(commbinedAcute);
        print("commbinedAcute");

        // 计算字符数量 扩展的还算做1个
        var word = "cafe";
        print("word count:\(word.count)"); // cafe 4
        word.append("\u{301}");
        print("After word count:\(word.count)"); // café 4

        // 字符串索引
        let index2 = word.index(word.startIndex, offsetBy: 1);
        print(index2);

        // 插入
        word.insert(contentsOf: "content", at: word.endIndex)
        print("after inser:\(word)"); // cafécontent

        // 删除
        word.remove(at: word.index(before: word.endIndex));
        print("after remove :\(word)"); // caféconten

        
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
         ^  两个值不相同就为 真
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

        print("money is )\(money)")
        
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
    
    func priseLabel() {
        let lbCount:UILabel = UILabel.init(frame: CGRect(x: 35, y: 100, width:20, height: 20));
        lbCount.textAlignment = .center;
        lbCount.font = UIFont.systemFont(ofSize: 10);
        lbCount.backgroundColor = UIColor.red;
        lbCount.textColor = UIColor.white;
        lbCount.layer.masksToBounds = true;
        lbCount.layer.cornerRadius = 10;
        lbCount.text = "99";
        lbCount.clipsToBounds = false;
        self.view.addSubview(lbCount);

        lbCountCenter = lbCount;
        print("ggege == \(String(describing: lbCountCenter))");

        let temp = Int(arc4random()%100)+1;
        var x = "--";
        if temp > 99 {
            x = "...";
        } else {
            x = String(temp);
        }
        lbCountCenter?.text = x;
    }
}
