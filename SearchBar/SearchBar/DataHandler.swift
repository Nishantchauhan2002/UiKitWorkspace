
import Foundation
import UIKit
import CoreData

class DatabaseHandler{
    func saveData(sName:String){
        let appDe=(UIApplication.shared.delegate) as! AppDelegate
        let context=appDe.persistentContainer.viewContext
        let studentObject=NSEntityDescription.insertNewObject(forEntityName: "StudentData", into: context) as! StudentData
        studentObject.studentname=sName
        do{
            try context.save()
            print("Data has been saved ")
        }catch{
            print("error occured while saving data ")
        }
        
        
    }
    func fetchData() -> [StudentData]{
        
        var sData=[StudentData]()
        let appDe=(UIApplication.shared.delegate) as! AppDelegate
        let context=appDe.persistentContainer.viewContext
        
        do{
            sData=try context.fetch(StudentData.fetchRequest()) as!
            [StudentData]
            
        }
        catch{
            print("Error occured while fetching the data")
        }
        return sData
    }
    func fetchSearchedData(sText:String)->[StudentData]{
        
        var sData=[StudentData]()
        let appDe=(UIApplication.shared.delegate) as! AppDelegate
        let context=appDe.persistentContainer.viewContext
        let predicate=NSPredicate(format: "studentname contains %@", sText)
        let request:NSFetchRequest=StudentData.fetchRequest()
        request.predicate=predicate
        do{
            sData=try (context.fetch(request))
        }
        catch{
            print("error occured while fetching the data ")
        }
        
        return sData
        
    }
}
