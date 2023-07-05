//
//  QuizDataController.swift
//  Limbo
//
//  Created by Bartek Chadryś on 05/07/2023.
//

import Foundation
import CoreData

class QuizDataController: ObservableObject {
    let container = NSPersistentContainer(name: "QuizData")
    
    init() {
        container.loadPersistentStores { description, error in
            if let err = error {
                print("Core Data failed to load: \(err.localizedDescription)")
            }
        }
    }
}
