//
//  DataController.swift
//  Bookworm
//
//  Created by Aliya Fatihah Mohamed Sidek on 25/03/2022.
//

import CoreData
import SwiftUI

class DataController: ObservableObject {
    //tell which model to load
    let container = NSPersistentContainer(name: "Bookworm")
    
    //load the data
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
