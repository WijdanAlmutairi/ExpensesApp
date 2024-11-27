//
//  ExpenseCell.swift
//  ExpensesApp
//
//  Created by Wijdan Almutairi on 27/11/2024.
//

import SwiftUI

struct ExpenseCell: View {
    var expense: Expense
    
    var body: some View {
        HStack {
            Text("\(expense.date.formatted(date: .abbreviated, time: .omitted))")
                .font(.system(size: 18))
                .foregroundColor(.gray)
                .padding()
            
            Text("\(expense.name)")
                .font(.system(size: 20))
                .padding()
            
            Text("\(String(format: "%.2f", expense.cost) )")
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .foregroundColor(expense.cost < 100 ? .accentColor : expense.cost < 500 ? .secondarytwo : .secondaryone)
                .padding()
        }
    }
}

#Preview {
    ExpenseCell(expense:  Expense(name: "Food", date: .now, cost: 20.0))
}
