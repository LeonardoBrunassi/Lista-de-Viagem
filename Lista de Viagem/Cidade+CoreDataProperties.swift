//
//  Cidade+CoreDataProperties.swift
//  Lista de Viagem
//
//  Created by Leonardo Rodrigues de Morais Brunassi on 19/04/16.
//  Copyright © 2016 Leonardo Rodrigues de Morais Brunassi. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Cidade {

    @NSManaged var nomeCidade: String?
    @NSManaged var qtdDias: String?
    @NSManaged var itens: NSSet?

}
