//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Aliya Fatihah Mohamed Sidek on 25/03/2022.
//

import SwiftUI

@main
struct BookwormApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
