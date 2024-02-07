import UIKit
import Foundation

class TestClosure{
    
    //Non Escaping Closure is there
    
    func performAddition(){
        print("Step1 is there it starts the execution ")
        addnumber(10,secondNumber:20){result in
            Sample()
            print(result)
            print("the execution is over ")
        }
    }
    func addnumber(_ num1:Int, secondNumber num2:Int ,completionHandler:(_ result:Int)->Void){
        print("Step 2 is there ")
        let sum=num1+num2
        completionHandler(sum)
    }
    //A sample function is here for which we are using the weak self
    //strong strong and weak strong refernce
    func Sample(){
        print("Sample is called ")
    }
    
    //escaping closure is there
    
    func performSubstraction(){
        print("Step1 is there ")
//        subtract(10,20){[weak self] result in
//            self?.Sample()
//            print(result)
//        }
        subtract(10, 20, completionHandler: { result in
            print(result)
            
        })
        print("Final Step")
        
    }
    
    func subtract(_ num1:Int,_ num2:Int,completionHandler:@escaping (_ result:Int) -> Void ){
        print("step2 is here")
        let sub=num2-num1
        DispatchQueue.main.asyncAfter(deadline: .now() + 10){
            print("Step 3 is there ")
            completionHandler(sub)
        }
    }
}
let testClosure=TestClosure();
//testClosure.performAddition()
//testClosure.performSubstraction()




struct Company{
    let name:String
    
    
    var description:String{
        return "Company is \(name)"
    }
}

let debug=true

func debugLog(_ message:@autoclosure () -> String ){
    if debug {
        print("Debug :\(message())")
    }
}

let apple=Company(name: "Apple")
print(apple.description)
debugLog({apple.description}())
debugLog("Google")
