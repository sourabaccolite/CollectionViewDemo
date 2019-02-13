//
//  DataModel.swift
//  CollectionViewDemo
//
//  Created by Sourab on 11/02/19.
//  Copyright © 2019 Sourab. All rights reserved.
//

import UIKit
import CoreData

class DataModel: NSObject {

    func saveDetails(withJsonData data: [String: Any]) {
        //URL
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print(urls[urls.count-1] as URL)
        //End
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let statisticsEntity = NSEntityDescription.entity(forEntityName: "Letters", in: managedContext)!
        
        let allArrObj: [[String: Any]] = data["arrayObj"] as! [[String : Any]]
        
        for eachObj in allArrObj {
            guard let strName: String = eachObj["name"] as? String else {
                continue
            }
            var objLetters: Letters? = nil
            let fetchedObj: Array = fetchDataOfname(withName: strName)
            
            if fetchedObj.count > 0 {
                objLetters = fetchedObj[0] as? Letters
            } else {
                objLetters = NSManagedObject(entity: statisticsEntity, insertInto: managedContext) as? Letters
            }
            objLetters?.name = strName
            if let strDscrptn: String = eachObj["description"] as? String {
                objLetters?.nameDescription = strDscrptn
            }
            
            do {
                try managedContext.save()
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
    }
    
    func fetchDataOfname(withName name: String) -> Array<Any> {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return [] }
        let managedContext = appDelegate.persistentContainer.viewContext
        let lettrsRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Letters")
        lettrsRequest.returnsObjectsAsFaults = false
        lettrsRequest.predicate = NSCompoundPredicate.init(type: .and, subpredicates: [
            NSPredicate.init(format: "name == [CD] %@", name)
            ])
        do {
            let result = try managedContext.fetch(lettrsRequest)
            return result
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return []
        }
    }
    
    func fetchAllData() -> [Letters] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return [] }
        let managedContext = appDelegate.persistentContainer.viewContext
        let lettrsRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Letters")
        lettrsRequest.returnsObjectsAsFaults = false
        do {
            let result = try managedContext.fetch(lettrsRequest)
            return result as! [Letters]
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return []
        }
    }
}
