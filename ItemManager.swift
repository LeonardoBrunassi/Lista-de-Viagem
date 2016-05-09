//
//  ItemManager.swift
//  Lista de Viagem
//
//  Created by Leonardo Rodrigues de Morais Brunassi on 08/04/16.
//  Copyright © 2016 Leonardo Rodrigues de Morais Brunassi. All rights reserved.
//

import Foundation
import CoreData

class ItemManager {
    static let sharedInstance = ItemManager()
    static let entidadeNome = "Item"
//    
//    lazy var manegedContext:NSManagedObjectContext = {
//    }()
//    
    
    let coreData = CoreDataPersistencia.sharedInstance
    
    private init (){}
    
    func novoItem() -> Lista_de_Viagem.Item {
        return NSEntityDescription.insertNewObjectForEntityForName(ItemManager.entidadeNome, inManagedObjectContext: coreData.managedObjectContext) as! Lista_de_Viagem.Item
    }
    
    func Item() -> Array<Lista_de_Viagem.Item>? {
        return coreData.fetchData(ItemManager.entidadeNome, predicate: NSPredicate(format: "TRUEPREDICATE")) as? Array<Lista_de_Viagem.Item>
    }
    
    func Item(predicate: NSPredicate) -> Array<Lista_de_Viagem.Item>? {
        return coreData.fetchData(ItemManager.entidadeNome, predicate: predicate) as? Array <Lista_de_Viagem.Item>
    }
    
    func salvar() {
        coreData.saveContext()
    }
    
    func deletar(item: Lista_de_Viagem.Item) {
        coreData.managedObjectContext.deleteObject(item)
    }
    
    
    
//    
//    func buscar() -> Array<Lista_de_Viagem.Item> {
//        let fetchedResults = NSFetchRequest(entityName: ItemManager.entidadeNome)
//        
//        do {
//            if let results = fetchedResults as? [Lista_de_Viagem.Item] {
//                return results
//            } else {
//                print("Could not fetch")
//            }
//            
//        } catch {
//            print ("Error")
//        }
//        return Array<Lista_de_Viagem.Item>()
//    }
//    
    
    
    
    
    
    func deletarTudo() {
        let todosObjetos : Array<Lista_de_Viagem.Item> = self.Item()!
        
        for item1 : Lista_de_Viagem.Item in todosObjetos as Array<Lista_de_Viagem.Item> {
            self.deletar(item1)
        }
    }
}