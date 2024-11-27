//
//  EditExpenceView.swift
//  ExpensesApp
//
//  Created by Wijdan Almutairi on 27/11/2024.
//

import SwiftUI
import SwiftData

struct EditExpenceView: View {
    @Environment (\.modelContext) var context
    @Environment (\.dismiss) private var dismiss
    
   
    @Bindable var expense: Expense
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Edit Name", text: $expense.name)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                TextField("Edit Cost", value: $expense.cost, format: .currency(code: "SAR"))
                    .textFieldStyle(.roundedBorder)
                    .padding()
            } .padding(20)
            
                .navigationTitle("Edit Expenses")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    Button("Done") {
                        dismiss()
                    }
                }
            
            Spacer()
        }
        
    }
}

#Preview {
    EditExpenceView(expense: Expense(name: "Food", date: .now, cost: 20.0))
}
