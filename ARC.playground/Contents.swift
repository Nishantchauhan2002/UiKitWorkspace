import UIKit
import Foundation

class Person{
    var name:String
    weak var job:Job?
    
    init(_ name:String){
        print("Intializer of Person is called ")
        self.name=name
    }
    func description(){
        print("My name is \(self.name)")
    }
    deinit{
        print("Deintializer of Person is called")
    }
}

//var objPerson1:Person?
//var objPerson2:Person?
//
//
//if 1==1{
//    let obj=Person("Harish")
//    objPerson1=obj
//    objPerson2=obj
//    //obj.description()
//}
//here in the arc of the swift it speciies that we will not deintialize the object if some other object is using the reference regarding the other one is
//the deinit is called only when the two oject that are using it get nil
//
//objPerson2=nil
//objPerson1=nil




class Job{
    var Position:String
    var person:Person?
    
    init(_ Position:String){
        print("Intializer of JOB is called ")
        self.Position=Position
    }
    func description(){
        print("My position is \(self.Position)")
    }
    
    deinit{
        print("Deintializer of JOB is called")
    }
}

if 1==1{
    
    let objOfPerson=Person("Nishant")
    let objOfJob=Job("Intern")
    objOfPerson.job=objOfJob
    objOfJob.person=objOfPerson
    //yha pr hm ek strong refernce create kr rhe h that means that means that here the both the
    //object of the classes are stronngly refernceing to each other and they are creating a cycle and this also leads to the memory wastage and now
    //if we want that it does not show this kind of functionality no strong refernce then what we do is we make one of the reference weak it show that we don't want any kind of strong reference there
    
}


