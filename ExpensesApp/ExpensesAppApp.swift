//
//  ExpensesAppApp.swift
//  ExpensesApp
//
//  Created by Wijdan Almutairi on 26/11/2024.
//

import SwiftUI
import SwiftData

@main
struct ExpensesAppApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .modelContainer(for: [Expense.self])
    }
}
