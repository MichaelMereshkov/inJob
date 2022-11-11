//
//  CoreDataHandler.swift
//  inJob
//
//  Created by Михаил Мерешков on 10.11.2022.
//

import UIKit
import CoreData

class CoreDataHandler: NSObject {

    private class func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    class func saveObject(image: Data?, title: String, value: String, location: String, sum: Int, textName: String, textPhone: String, textMail: String) -> Bool {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Items", in: context)
        let manageObject = NSManagedObject(entity: entity!, insertInto: context)
        manageObject.setValue(image, forKey: "image")
        manageObject.setValue(title, forKey: "title")
        manageObject.setValue(value, forKey: "value")
        manageObject.setValue(location, forKey: "location")
        manageObject.setValue(sum, forKey: "sum")
        manageObject.setValue(textName, forKey: "textName")
        manageObject.setValue(textPhone, forKey: "textPhone")
        manageObject.setValue(textMail, forKey: "textMail")
        
        do {
            try context.save()
            return true
        } catch {
            return false
        }
    }
    
    class func fetchObject() -> [Items]? {
        let context = getContext()
        var user: [Items]? = nil
        
        do {
            user = try context.fetch(Items.fetchRequest())
            return user
        } catch {
            return user
        }
    }
}
