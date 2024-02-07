//
//  StudentData+CoreDataProperties.swift
//  SearchBar
//
//  Created by Nishant Chauhan on 25/01/24.
//
//

import Foundation
import CoreData


extension StudentData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StudentData> {
        return NSFetchRequest<StudentData>(entityName: "StudentData")
    }

    @NSManaged public var studentname: String?

}

extension StudentData : Identifiable {

}
