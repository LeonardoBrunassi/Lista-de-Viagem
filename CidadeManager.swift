//
//  CidadeManager.swift
//  Lista de Viagem
//
//  Created by Leonardo Rodrigues de Morais Brunassi on 08/04/16.
//  Copyright © 2016 Leonardo Rodrigues de Morais Brunassi. All rights reserved.
//

import Foundation
import CoreData

class CidadeManager {
    
    static let sharedInstance = CidadeManager()
    static let entidadeNome = "Cidade"
    
    let coreData = CoreDataPersistencia.sharedInstance
    
    private init (){}
    
    func novaCidade() -> Lista_de_Viagem.Cidade {
        return NSEntityDescription.insertNewObjectForEntityForName(CidadeManager.entidadeNome, inManagedObjectContext: coreData.managedObjectContext) as! Lista_de_Viagem.Cidade
    }
    
    func Cidade() -> Array<Lista_de_Viagem.Cidade>? {
        return coreData.fetchData(CidadeManager.entidadeNome, predicate: NSPredicate(format: "TRUEPREDICATE")) as? Array<Lista_de_Viagem.Cidade>
    }
    
    func Cidade(predicate: NSPredicate) -> Array<Lista_de_Viagem.Cidade>? {
        return coreData.fetchData(CidadeManager.entidadeNome, predicate: predicate) as? Array <Lista_de_Viagem.Cidade>
    }
    
    func salvar() {
        coreData.saveContext()
    }
    
    func deletar(cidade: Lista_de_Viagem.Cidade) {
        coreData.managedObjectContext.deleteObject(cidade)
    }
    
    func deletarTudo() {
        let todosObjetos : Array<Lista_de_Viagem.Cidade> = self.Cidade()!
        
        for item : Lista_de_Viagem.Cidade in todosObjetos as Array<Lista_de_Viagem.Cidade> {
            self.deletar(item)
        }
    }
}