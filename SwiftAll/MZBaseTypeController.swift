
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
    case Wensday
    case Friday

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

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
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


//        self.studyDateType();
//        self.studyVar();
//        self.studyOptionalType();
//        self.studyAdd();
//        self.studyLiuCheng();
//        self.studyString();
//        self.studyArray();
//        self.studySet()
//        self.studyDictionary();
//        self.studyFor();
//        self.studyFunc();
//        self.studyClosures();
//        self.studyEnum();
//        self.studyStruct();
        self.studyClass();

    }

    func studyClass() {

        // 属性
         /**
         属性属性将值与特定的类、结构体或枚举关联。存储属性会将常量和变量存储为实例的一部分，而计算属性则是直接计算（而不是存储）值。计算属性可以用于类、结构体和枚举，而存储属性只能用于类和结构体。
         存储属性和计算属性通常与特定类型的实例关联。但是，属性也可以直接与类型本身关联，这种属性称为类型属性。         另外，还可以定义属性观察器来监控属性值的变化，以此来触发自定义的操作。属性观察器可以添加到类本身定义的存储属性上，也可以添加到从父类继承的属性上。
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
        var productBarcode = Barcode.uqc(8, 834484, 6878)
        productBarcode = .qrCode("ABCDEFGHIJKLMNOP")

        print("productBarcode == \(productBarcode)")
        
        // 原始值 原始值可以是字符串、字符，或者任意整型值或浮点型值。每个原始值在枚举声明中必须是唯一的。
        print("\(ASCIIControlCharacter.tab) + \(ASCIIControlCharacter.linFeed)");
        // 原始值的隐式赋值

        var ppp =  Planet.earth;
        print("ppp  =\(ppp)")
        ppp = Planet.mars;
        print("new ppp  =\(ppp)")

        _ = Planet(rawValue: 9)
        ppp = Planet.uranus;
        print("rawValue ppp  =\(ppp)")



    //递归枚举？？递归枚举是一种枚举类型，它有一个或多个枚举成员使用该枚举类型的实例作为关联值。使用递归枚举时，编译器会插入一个间接层。你可以在枚举成员前加上 indirect 来表示该成员可递归。
        // 你也可以在枚举类型开头加上 indirect 关键字来表明它的所有成员都是可递归的：
        indirect enum ArithmeticExpression {
            case number(Int)
            case addition(ArithmeticExpression, ArithmeticExpression)
            case multiplication(ArithmeticExpression, ArithmeticExpression)
        }


        let five = ArithmeticExpression.number(5)
        let four = ArithmeticExpression.number(4)
        let sum = ArithmeticExpression.addition(five, four)
        let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))
        print(product)



    }
    
    
    func studyClosures () {

        /*
         闭包是自包含的函数代码块，可以在代码中被传递和使用。Swift 中的闭包与 C 和 Objective-C 中的代码块（blocks）以及其他一些编程语言中的匿名函数（Lambdas）比较相似。

         闭包可以捕获和存储其所在上下文中任意常量和变量的引用。被称为包裹常量和变量。 Swift 会为你管理在捕获过程中涉及到的所有内存操作。

         注意

         如果你不熟悉捕获（capturing）这个概念也不用担心，在 值捕获 章节有它更详细的介绍。

         在 函数 章节中介绍的全局和嵌套函数实际上也是特殊的闭包，闭包采用如下三种形式之一：

         全局函数是一个有名字但不会捕获任何值的闭包
         嵌套函数是一个有名字并可以捕获其封闭函数域内值的闭包
         闭包表达式是一个利用轻量级语法所写的可以捕获其上下文中变量或常量值的匿名闭包
         Swift 的闭包表达式拥有简洁的风格，并鼓励在常见场景中进行语法优化，主要优化如下：

         1、利用上下文推断参数和返回值类型
         2、隐式返回单表达式闭包，即单表达式闭包可以省略 return 关键字
         3、参数名称缩写
         4、尾随闭包语法


         */


        /// 排序方法
        func backward (_ s1:String, _ s2:String)->Bool{
            /// 从大到小
//            return s1 > s2;
            /// 从小到大
            return s1 < s2;
        }
        let names = ["name4","name8","name3","name2"]
        var newNames =  names.sorted(by: backward(_:_:));
        print("names ==\(names) newNames ==\(newNames)")


        /// 上述代码使用Closures 来实现
        newNames = names.sorted(by: { (s1, s2) -> Bool in
            return s1 < s2;
        })
        print("user Closures names ==\(names) newNames ==\(newNames)")

        // 单表达式闭包的隐式返回 省略 return
        newNames = names.sorted(by: {s1,s2 in s1 > s2});
        print("user Closures without return key names ==\(names) newNames ==\(newNames)")


        // 参数名称也可以缩写 直接通过 $0，$1，$2 来顺序调用闭包的参数，以此类推
        newNames = names.sorted(by: {$0 > $1});
        print("user Closures with $ key names ==\(names) newNames ==\(newNames)")

        // 还可以更简短 运用运算符
        newNames = names.sorted(by: >);
        print("user Closures with > || <  key names ==\(names) newNames ==\(newNames)")

        /// block作为函数参数传递
        func someFunctionThatTakesClosure( closure:() -> Void){
            // 函数体部分
            print("strat")
            closure()
            closure()
            print("end")

        }

        // 调用方法 someFunctionThatTakesClosure 并实现block
        someFunctionThatTakesClosure {
            print("xxx")
        }
        someFunctionThatTakesClosure( closure: {
            print("===")
        })


        // 闭包表达式
        let dictNames = [
            0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
            5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
        ]
        let numbers = [16, 58, 510]
        let result = numbers.map {
            (number) -> String in
            var number = number
            var outPut = ""
            repeat{
                let tmp1 =  number % 10
                let tmp2 = dictNames[tmp1];
                outPut = tmp2! + outPut
                number /= 10
            }while number > 0
            return outPut
        }
        print("result ==\(result)")


        // 值捕获 闭包带值
        /*
         makeIncrementer 方法返回类型 是 () ->Int 意思是返回一个函数，而不是一个简单的值
         incrementer 这个嵌套函数  函数并没有任何参数，但是在函数体内访问了 runningTotal 和 amount 变量。这是因为它从外围函数捕获了 runningTotal 和 amount 变量的引用。捕获引用保证了 runningTotal 和 amount 变量在调用完 makeIncrementer 后不会消失，并且保证了在下一次执行 incrementer 函数时，runningTotal 依旧存在

         注意：为了优化，如果一个值不会被闭包改变，或者在闭包创建后不会改变，Swift 可能会改为捕获并保存一份对值的拷贝。
         Swift 也会负责被捕获变量的所有内存管理工作，包括释放不再需要的变量。

         */
        func makeIncrementer(forIncrement amount:Int) -> () ->Int{

            var runningTotal = 5;
            func incrementer() -> Int{
                runningTotal += amount;
                print("runningTotal ==\(runningTotal) amount=\(amount)")
                return runningTotal
            }
            print("runningTotal ==\(runningTotal)")
            return incrementer
        }

        var funcTypeResult =  makeIncrementer(forIncrement: 5)
        var incrementerResult =  funcTypeResult()
        print("incrementerResult == \(incrementerResult)") // 10
        incrementerResult = funcTypeResult()
        print("incrementerResult == \(incrementerResult)") // 15
        incrementerResult = funcTypeResult()
        print("incrementerResult == \(incrementerResult)") // 20



        funcTypeResult =  makeIncrementer(forIncrement: 10)
        incrementerResult = funcTypeResult()
        print("incrementerResult == \(incrementerResult)") // 15
        incrementerResult = funcTypeResult()
        print("incrementerResult == \(incrementerResult)") // 25


        // 逃逸闭包
        /*
    当一个闭包作为参数传到一个函数中，但是这个闭包在函数返回之后才被执行，我们称该闭包从函数中逃逸。当你定义接受闭包作为参数的函数时，你可以在参数名之前标注 @escaping，用来指明这个闭包是允许“逃逸”出这个函数的。
        一种能使闭包“逃逸”出函数的方法是，将这个闭包保存在一个函数外部定义的变量中。举个例子，很多启动异步操作的函数接受一个闭包参数作为 completion handler。这类函数会在异步操作开始之后立刻返回，但是闭包直到异步操作结束后才会被调用。在这种情况下，闭包需要“逃逸”出函数，因为闭包需要在函数返回之后被调用。例如

         */

//        var completionHandlers: [() -> Void] = []
//        func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
//            completionHandlers.append(completionHandler)
//        }
        //  someFunctionWithEscapingClosure 这个函数接收一个闭包作为参数someFunctionWithEscapingClosure(_:) 函数接受一个闭包作为参数，该闭包被添加到一个函数外定义的数组中。如果你不将这个参数标记为 @escaping，就会得到一个编译错误。
       //   将一个闭包标记为 @escaping 意味着你必须在闭包中显式地引用 self。比如说，在下面的代码中，传递到 someFunctionWithEscapingClosure(_:) 中的闭包是一个逃逸闭包，这意味着它需要显式地引用 self。相对的，传递到 someFunctionWithNonescapingClosure(_:) 中的闭包是一个非逃逸闭包，这意味着它可以隐式引用 self。


        var completionHandlers: [() -> Void] = []
        func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
            completionHandlers.append(completionHandler)
        }

        class SomeClass {
            var x = 10


            func someFunctionWithNonescapingClosure(closure: () -> Void) {
                closure()
            }

            func doSomething() {

//                someFunctionWithEscapingClosure {
//                    x = 100
//                }

                someFunctionWithNonescapingClosure {
                    self.x = 200;
                }
            }
        }

        let instance = SomeClass()
        instance.doSomething()
        print(instance.x)
        // 打印出“200”

        completionHandlers.first?()
        print(instance.x)
        // 打印出“100”



        /*
    自动闭包是一种自动创建的闭包，用于包装传递给函数作为参数的表达式。这种闭包不接受任何参数，当它被调用的时候，会返回被包装在其中的表达式的值。这种便利语法让你能够省略闭包的花括号，用一个普通的表达式来代替显式的闭包。

        我们经常会调用采用自动闭包的函数，但是很少去实现这样的函数。举个例子来说，assert(condition:message:file:line:) 函数接受自动闭包作为它的 condition 参数和 message 参数；它的 condition 参数仅会在 debug 模式下被求值，它的 message 参数仅当 condition 参数为 false 时被计算求值。

        自动闭包让你能够延迟求值，因为直到你调用这个闭包，代码段才会被执行。延迟求值对于那些有副作用（Side Effect）和高计算成本的代码来说是很有益处的，因为它使得你能控制代码的执行时机。下面的代码展示了闭包如何延时求值。
         */

        var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        print(customersInLine.count)
        // 打印出“5”

        let customerProvider = { customersInLine.remove(at: 0) }
        print(customersInLine.count)
        // 打印出“5”

        print("Now serving \(customerProvider())!")
        // Prints "Now serving Chris!"
        print(customersInLine.count)


        //尽管在闭包的代码中，customersInLine 的第一个元素被移除了，不过在闭包被调用之前，这个元素是不会被移除的。如果这个闭包永远不被调用，那么在闭包里面的表达式将永远不会执行，那意味着列表中的元素永远不会被移除。请注意，customerProvider 的类型不是 String，而是 () -> String，一个没有参数且返回值为 String 的函数。将闭包作为参数传递给函数时，你能获得同样的延时求值行为。

        // customersInLine is ["Alex", "Ewa", "Barry", "Daniella"]
//        func serve(customer customerProvider: () -> String) {
//            print("Now serving \(customerProvider())!")
//        }
//        serve(customer: { customersInLine.remove(at: 0) } )
        // 打印出“Now serving Alex!”


        // 上面的 serve(customer:) 函数接受一个返回顾客名字的显式的闭包。下面这个版本的 serve(customer:) 完成了相同的操作，不过它并没有接受一个显式的闭包，而是通过将参数标记为 @autoclosure 来接收一个自动闭包。现在你可以将该函数当作接受 String 类型参数（而非闭包）的函数来调用。customerProvider 参数将自动转化为一个闭包，因为该参数被标记了 @autoclosure 特性。

        // customersInLine is ["Ewa", "Barry", "Daniella"]
        func serve(customer customerProvider: @autoclosure () -> String) {
            print("Now serving \(customerProvider())!")
        }
        serve(customer: customersInLine.remove(at: 0))
        // 打印“Now serving Ewa!”

        //注意
        //过度使用 autoclosures 会让你的代码变得难以理解。上下文和函数名应该能够清晰地表明求值是被延迟执行的。

        //如果你想让一个自动闭包可以“逃逸”，则应该同时使用 @autoclosure 和 @escaping 属性。@escaping 属性的讲解见上面的 逃逸闭包。

        var customerProviders: [() -> String] = []
        func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
            customerProviders.append(customerProvider)
        }
        collectCustomerProviders(customersInLine.remove(at: 0))
        collectCustomerProviders(customersInLine.remove(at: 0))

        print("Collected \(customerProviders.count) closures.")
        // 打印“Collected 2 closures.”˚
        for customerProvider in customerProviders {
            print("Now serving \(customerProvider())!")
        }
        // 打印“Now serving Barry!”
        // 打印“Now serving Daniella!”

        //在上面的代码中，collectCustomerProviders(_:) 函数并没有调用传入的 customerProvider 闭包，而是将闭包追加到了 customerProviders 数组中。这个数组定义在函数作用域范围外，这意味着数组内的闭包能够在函数返回之后被调用。因此，customerProvider 参数必须允许“逃逸”出函数作用域。


        /*
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
        */
       
    }
    
    
    func studyFunc() {

        /*
         函数是一段完成特定任务的独立代码片段。你可以通过给函数命名来标识某个函数的功能，这个名字可以被用来在需要的时候“调用”这个函数来完成它的任务。

         Swift 统一的函数语法非常的灵活，可以用来表示任何函数，包括从最简单的没有参数名字的 C 风格函数，到复杂的带局部和外部参数名的 Objective-C 风格函数。参数可以提供默认值，以简化函数调用。参数也可以既当做传入参数，也当做传出参数，也就是说，一旦函数执行结束，传入的参数值将被修改。

         在 Swift 中，每个函数都有一个由函数的参数值类型和返回值类型组成的类型。你可以把函数类型当做任何其他普通变量类型一样处理，这样就可以更简单地把函数当做别的函数的参数，也可以从其他函数中返回函数。函数的定义可以写在其他函数定义中，这样可以在嵌套函数范围内实现功能封装。

         */

        let fullUrl = self.dealUrl(urlStr: "/commentList");
        print("\(fullUrl)");
        
        // 返回值为 元组
        var result =  self.getCommentList(url: fullUrl);
        if result!.success {
            print(result?.result["resultDic"] ?? "加载失败");
        }else{
            print("加载失败");
        }


        // 多重返回值函数
        func minMax(array :[Int]) ->(min:Int,max:Int){
            var currentMin = array[0];
            var currentMax  = array[0]
            for value  in array[1..<array.count] {
                if value < currentMin{
                    currentMin = value;
                }else if value > currentMax{
                    currentMax = value;
                }
            }
            return (currentMin,currentMax)
        }

        let minmaxResult =  minMax(array: [35,565,89,8,-9,333,66])
        print("min == \(minmaxResult.min) max == \(minmaxResult.max)");


        // 可选元组返回类型
        func minMax2(array:[Int])->(min:Int,max:Int)?{

            if array.isEmpty {
                return nil
            }
            var currentMin = array[0];
            var currentMax  = array[0]
            for value  in array[1..<array.count] {
                if value < currentMin{
                    currentMin = value;
                }else if value > currentMax{
                    currentMax = value;
                }
            }
            return (currentMin,currentMax)

        }

        if let bool = minMax2(array: [5,5]){
            print("min == \(bool.min) max == \(bool.max)");
        }else{
            print("cant find the min and max value");
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


    func studyFor(){

        /*
         Swift 提供了多种流程控制结构，包括可以多次执行任务的 while 循环，基于特定条件选择执行不同代码分支的 if、guard 和 switch 语句，还有控制流程跳转到其他代码位置的 break 和 continue 语句。

         Swift 还提供了 for-in 循环，用来更简单地遍历数组（Array），字典（Dictionary），区间（Range），字符串（String）和其他序列类型。

         Swift 的 switch 语句比许多类 C 语言要更加强大。case 还可以匹配很多不同的模式，包括范围匹配，元组（tuple）和特定类型匹配。switch 语句的 case 中匹配的值可以声明为临时常量或变量，在 case 作用域内使用，也可以配合 where 来描述更复杂的匹配条件。

         */

        // 遍历数组
        let names = ["Anna", "Alex", "Brian", "Jack"]
        for name in names {
            print("Hello, \(name)!")
        }

        //  1 2 3 4 5
        for index in 1...5 {
            print("\(index) times 5 is \(index * 5)")
        }

        // 如果你不需要区间序列内每一项的值，你可以使用下划线（_）替代变量名来忽略这个值：
        let x = 4;
        var answer = 1;
        for _ in 1...8 {
            answer *= x;
        }
        // 计算 4 的8 次方
        print("answer == \(answer)")


        // 遍历区间改为 [1,8)
        for index in 1..<8 {
            print("index == \(index)")
        }

        // 半开区间
        let namess = ["Anna", "Alex", "Brian", "Jack"]
        let count = namess.count
        for i in 0..<count {
            print("第 \(i + 1) 个人叫 \(namess[i])")
        }

        // range
        for i  in namess[...2] {
            print(i)
        }// Anna Alex Brian


        for i  in namess[..<2] {
            print(i)
        }// Anna Alex

        for i  in namess[2...] {
            print(i)
        }// Brian Jack


        //


        print("========== while")




        /*
        //eg 官方小游戏
        let finalSquare = 25
        var board = [Int](repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

        var square = 0
        var diceRoll = 0
        while square < finalSquare {
            // 掷骰子
            diceRoll += 1
            if diceRoll == 7 { diceRoll = 1 }
            // 根据点数移动
            square += diceRoll
            if square < board.count {
                // 如果玩家还在棋盘上，顺着梯子爬上去或者顺着蛇滑下去
                square += board[square]
            }
            print(diceRoll)
        }
        print("Game over!")
        */


        /*
         switch 语句会尝试把某个值与若干个模式（pattern）进行匹配。根据第一个匹配成功的模式，switch 语句会执行对应的代码。当有可能的情况较多时，通常用 switch 语句替换 if 语句。

         匹配int ,string,元组

         */
        var cellType:Int = 8;
        cellType = 2;
        var cellName =  self.getCellType(type: cellType)
        print(cellName)

        cellType = 312;
        cellName =  self.getCellType(type: cellType)
        print(cellName)


        // switch 元组
        var point = (4,7)
        var result = self.getYuanZu(somePoint: point)
        print(result)


        point = (0,9)
        result = self.getYuanZu(somePoint: point)
        print(result)


        // 值绑定（Value Bindings）
        point = (2,0);
        result = self.getValueBindings(somePoint: point)
        print(result)


        // case and where
        point = (2,2);
        result = self.getCaseWithWhere(somePoint: point)
        print(result)

        point = (2,9);
        result = self.getCaseWithWhere(somePoint: point)
        print(result)

        /*
         在 Swift 里，switch 语句不会从上一个 case 分支跳转到下一个 case 分支中。相反，只要第一个匹配到的 case 分支完成了它需要执行的语句，整个 switch 代码块完成了它的执行。相比之下，C 语言要求你显式地插入 break 语句到每个 case 分支的末尾来阻止自动落入到下一个 case 分支中。Swift 的这种避免默认落入到下一个分支中的特性意味着它的 switch 功能要比 C 语言的更加清晰和可预测，可以避免无意识地执行多个 case 分支从而引发的错误。

         如果你确实需要 C 风格的贯穿的特性，你可以在每个需要该特性的 case 分支中使用 fallthrough 关键字。下面的例子使用 fallthrough 来创建一个数字的描述语句

         fallthrough 关键字不会检查它下一个将会落入执行的 case 中的匹配条件。fallthrough 简单地使代码继续连接到下一个 case 中的代码，这和 C 语言标准中的 switch 语句特性是一样的

         */

        let integerToDescribe = 5
        var description = "The number \(integerToDescribe) is"
        switch integerToDescribe {
        case 2, 3, 5, 7, 11, 13, 17, 19:
            description += " a prime number, and also"
            fallthrough
        default:
            description += " an integer."
        }
        print(description)
        // 输出“The number 5 is a prime number, and also an integer.”


        //
        if #available(iOS 10, macOS 10.12, *) {
            // 在 iOS 使用 iOS 10 的 API, 在 macOS 使用 macOS 10.12 的 API
        } else {
            // 使用先前版本的 iOS 和 macOS 的 API
        }

    }



    func getCaseWithWhere(somePoint : (Int,Int)) -> String {

        switch somePoint {
        case let (x, y) where x == y:
            return "(\(x), \(y)) is on the line x == y"
        case let (x, y) where x == -y:
            return "(\(x), \(y)) is on the line x == -y"
        case let (x, y):
            return "(\(x), \(y)) is just some arbitrary point"
        }

    }


    func getValueBindings(somePoint : (Int,Int)) -> String {
        // case 分支允许将匹配的值声明为临时常量或变量，并且在 case 分支体内使用
        switch somePoint {
        case (let x, 0):
            return "on the x-axis with an x value of \(x)"
        case (0, let y):
            return "on the y-axis with a y value of \(y)"
        case let (x, y):
            return "somewhere else at (\(x), \(y))"
        }


    }


    func getYuanZu(somePoint : (Int,Int)) -> String {

        // _ 匹配所有可能的值
        switch somePoint {
        case (0, 0):
            return "\(somePoint) is at the origin"
        case (_, 0):
            return "\(somePoint) is on the x-axis"
        case (0, _):
            return "\(somePoint) is on the y-axis"
        case (-2...2, -2...2):
            return "\(somePoint) is inside the box"
        default:
            return "\(somePoint) is outside of the box"
        }
    }

    func getCellType(type :Int) -> String {

        switch type {
        case 1:
            return "text"
        case 2:
            return "image"
        case 7,8:
            return "bigImage"
        case 300...318:
            return "community"
        default:
            return "none"
        }
    }



    func studyDictionary(){

        /*
         字典是一种存储多个相同类型的值的容器。每个值（value）都关联唯一的键（key），键作为字典中的这个值数据的标识符。和数组中的数据项不同，字典中的数据项并没有具体顺序。我们在需要通过标识符（键）访问数据的时候使用字典，这种方法很大程度上和我们在现实世界中使用字典查字义的方法一样。


         */

        // 创建一个空字典
        var dictionary = [Int:String]();
        // 赋值
        dictionary[1] = "1"
        print(dictionary)
        // 改值
        dictionary[1] = "11"
        print(dictionary)

        // 创建一个带值的字典
        var defaultDictionary = ["key1":1,"key2":2,"key3":3,"key4":4,"key5":5,"key6":6]
        print(defaultDictionary)
        // 改值
        defaultDictionary.updateValue(4, forKey: "key3")
        print(defaultDictionary)
        if let airportname = defaultDictionary["key3"] {
            print("修改成功:\(airportname)")
        }else{
            print("修改失败")
        }
        // 删除某个值
        defaultDictionary.removeValue(forKey: "key5")
        print(defaultDictionary)
        defaultDictionary["key6"] = nil
        print(defaultDictionary)
        // 遍历字典
        for (keys,valus) in defaultDictionary {
            print("\(keys) = \(valus)")
        }


        //  用数组创建字典
        let digitWords = ["one", "two", "three", "four", "five"]
        print("keys = \(digitWords)")
        let abcd = ["A", "B", "C", "D"]
        print("values = \(abcd)")
        // 创建字典 keys 是 digitWords value 是 abcd
        let newDic =  Dictionary(uniqueKeysWithValues: zip(digitWords, abcd));
        print("newDic = \(newDic)")
        
    }
    

    func studySet(){


        /* 集合（Set）用来存储相同类型并且没有确定顺序的值。当集合元素顺序不重要时或者希望确保每个元素只出现一次时可以使用集合而不是数组。

         一个类型为了存储在集合中，该类型必须是可哈希化的——也就是说，该类型必须提供一个方法来计算它的哈希值。一个哈希值是 Int 类型的，相等的对象哈希值必须相同，比如 a==b,因此必须 a.hashValue == b.hashValue。

         Swift 的所有基本类型（比如 String、Int、Double 和 Bool）默认都是可哈希化的，可以作为集合的值的类型或者字典的键的类型。没有关联值的枚举成员值（在 枚举 有讲述）默认也是可哈希化的。
         */
        print("=================Set=====================")


        // 创建一个空的结合
        var letters = Set<Character>()
        print("letter is of type Set \(letters.count)")
        // 是否为空
        if letters.isEmpty{
            print("letters is empty")
        }else{
            print("letters is not empty")
        }
        // 插入
        letters.insert("x")
        letters.insert("c")
        print(letters)
        // 删除
        letters.remove("c")
        print(letters)
        // 包含
        if letters.contains("x"){

        }
        // 遍历
        for c in letters{
            print("\(c)")
        }
        // 集合操作 见图 set.png
        let oddDigits: Set = [1, 3, 5, 7, 9]
        let evenDigits: Set = [0, 2, 4, 6, 8]
        let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

        // a 和 b 所有值全部加起来，建立一个新的
        print(oddDigits.union(evenDigits).sorted())
        // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

        // a 和 b 两个集合里面都有的值，加起来，建立一个新的
        print(oddDigits.intersection(evenDigits).sorted())
        // []

        // a 和 b  a有，但是b没有的值，加起来，建立一个新的 类似于 a-b
        print(oddDigits.subtracting(singleDigitPrimeNumbers).sorted())
        // [1, 9]

        // a 和 b   a+b - (a,b 共有的值)
        print(oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted())
        // [1, 2, 9]

        /*
         使用“是否相等”运算符（==）来判断两个集合是否包含全部相同的值。
         使用 isSubset(of:) 方法来判断一个集合中的值是否也被包含在另外一个集合中。
         使用 isSuperset(of:) 方法来判断一个集合中包含另一个集合中所有的值。
         使用 isStrictSubset(of:) 或者 isStrictSuperset(of:) 方法来判断一个集合是否是另外一个集合的子集合或者父集合并且两个集合并不相等。
         使用 isDisjoint(with:) 方法来判断两个集合是否不含有相同的值（是否没有交集）。
         */

        let houseAnimals: Set = ["🐶", "🐱"]
        let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
        let cityAnimals: Set = ["🐦", "🐭"]

        var result : Bool;

        result = houseAnimals.isSubset(of: farmAnimals)
        // true

        result = farmAnimals.isSuperset(of: houseAnimals)
        // true

        result = farmAnimals.isDisjoint(with: cityAnimals)
        // true

        print(result)

    }
    
    func studyArray(){
        // 集合类型，swift提供 Arrays Sets Dictionaries swift中存储的数据值类型必须明确。意思我们完全可以对取出的值放心

        // 定义为 let 则为不可变数组 定义为 var 则为可变数组
        var tmpArrar = Array<String>(arrayLiteral: "1","2");
        // 如果定义为let 则append会提示编译报错
        tmpArrar.append("3");
        print(tmpArrar);


        // 创建一个数组
        print("============= Array =============== ")
        var emptyArray = [Int]();
        emptyArray.append(4);

        // 创建一个带有默认值的数组
        let  threeDoubles = Array(repeating: 33, count: 3)
        print("threeDoubles == \(threeDoubles)"); // [33,33,33]

        let sixDoubles = Array(repeating: 66, count: 6)
        let sumDoubles = threeDoubles + sixDoubles;
        print("sumDoubles 这个是真厉害 threeDoubles + sixDoubles == \(sumDoubles)")
        // 33,33,33,66,66,66,66,66,66


        // 简便方法创建数组
        var smpleArray = ["a","b"]
        smpleArray.append("c")// 自动识别是string类型的数组
        smpleArray += ["d"] // swift为何如此之diao
        //smpleArray.append(4) // 你这样写，他就报错了，厉害



        // 取值
//        let getArray1 : Int = smpleArray[0] // 你这么写，也会报错，厉害吧，这就是类型安全，NB
//        print(getArray1);


//        let getvalues = smpleArray[8] // 试试崩溃吗 还是崩了，看来Swift不完美啊
//        print(getvalues)

        let value = smpleArray[0]
        print("value == ",value)

        // 改值
        print("before smpleArray =",smpleArray)
        smpleArray[0] = "7"
        print("After smpleArray =",smpleArray)

        // 增值
        smpleArray.insert("sss", at: 4)
        print("...之后 smpleArray =",smpleArray)


        // 遍历数组
        let channelId = Array<String>(arrayLiteral: "20","30");
        for item in channelId {
            print(item);
        }

        // 遍历数组 + index
        for (index ,item) in channelId.enumerated() {
            print(" 第 \(index)个为:\(item)");
        }

        
        // 声明一个 数组 ，item类型为String
        var someStr = [String]();

        
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
       

        

        // 数组+数组
        let intsA = [Int](repeating: 2, count:2)
        let intsB = [Int](repeating: 1, count:3)
        var   intsC = [Int](repeating: 3, count:10);
        intsC = intsA + intsB + intsC;
        print(intsC);
        
        
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
        let version = "3.4.2";
        print("Current Version is \(version )");
        
        let a = 4;
        let b = 13;
        print("you can sum in str \(a + b)");

        
        // 字符串拼接
        var strName = "stringA  2018-09-2";
        let strB = " strinb";
//        strName.append(strB);
        strName = strName + strB;
        print(strName);
        let c :  Character = "x";
        strName.append(c);
        print(strName);
        
        // 字符串长度
        print(strName.count);
        
        //
        let  isHttp =  strName.hasPrefix("http");
        print(isHttp);
        
        
        let isMulti = strName.hasSuffix("s");
        print(isMulti);
        
        // 转换
        let intStr = "23412";
        let intX =  Int(intStr);
        print(intStr);
        print(intX);

        
        // 遍历字符串，获取每个字符
        print("遍历字符串，获取每个字符")
        for c in "strName.characters" {
            print(c);
        }
        print(strB);

        // 多行字符串
        let x = 19;
        let someString : String = """
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

        print(someString)


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
            print(s ?? "defalue")
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

        // 子字符串
        let greeting = "Hello,Hello, world!"
        let substring = greeting.firstIndex(of: ",") ?? greeting.endIndex

        //SubString 不适合长期存储 —— 因为它重用了原 String 的内存空间，原 String 的内存空间必须保留直到它的 SubString 不再被使用为止
        print(substring);

        // 比较字符串 字符串字符相等、前缀相等、后缀相等
        var community1 = "JRPictureFeed"
        var community2 = "JRPictureFeed"

        if community1 == community2{
            print("\(community1) == \(community2)");
        }

        // 一样相等
        community1 = "caf\u{E9}?"
        community2 = "caf\u{65}\u{301}?"
        if community1 == community2 {
            print("\(community1) == \(community2)");
        }else{
            print("\(community1) != \(community2)");
        }


        let varArr = [
            "JRPictureFeed",
            "CommunityAnswerDetail",
            "JRTextFeed",
            "JRQuestionFeed",
            "CommunityPictureDetail",
            "CommunityCommentDetail",
            "CommunityMoreDetail",
            "JRBaoXianFeed",
            "CommunityFundFeed",
            "JRMoreDetail",
        ]

        // hasPrefix  hasSuffix 方法都是在每个字符串中逐字符比较其可扩展的字符群集是否标准相等
        // 前缀
        for scence in varArr {
            if scence.hasPrefix("JR"){
                print(scence)
            }
        }
        print("========================")
        // 后缀
        for scence in varArr {
            if scence.hasSuffix("Feed"){
                print(scence)
            }
        }

        print("==========codeUnit==============")
        //
        let dogString = " 车明明  Dog!🐶 "
        for codeUnit in dogString.utf8 {
            print("\(codeUnit)")
            // terminator 连续打印不换行的意思
            // print("\(codeUnit)",terminator:"")
        }

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
