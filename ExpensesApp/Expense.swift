//
//  Expense.swift
//  ExpensesApp
//
//  Created by Wijdan Almutairi on 26/11/2024.
//

import Foundation
import SwiftData

@Model
class Expense {
    var name: String
    var date: Date
    var cost: Double
    
    init(name: String, date: Date, cost: Double) {
        self.name = name
        self.date = date
        self.cost = cost
    }
}
