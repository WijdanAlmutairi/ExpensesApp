//
//  AddExpenseView.swift
//  ExpensesApp
//
//  Created by Wijdan Almutairi on 26/11/2024.
//

import SwiftUI
import SwiftData

struct AddExpenseView: View {
    @Environment (\.modelContext) var context
    @Environment (\.dismiss) private var dismiss
    
    @State private var name: String = ""
    @State private var date: Date = .now
    @State private var cost: Double = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Add Name", text: $name)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                TextField("Add Cost", value: $cost, format: .currency(code: "SAR"))
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                
                
                HStack {
                    // add
                    Button {
                        let expense = Expense(name: name, date: date, cost: cost)
                        context.insert(expense)
                        dismiss()
                    } label: {
                        Text("Add")
                            .frame(width: 100, height: 60)
                            .font(.system(size: 20))
                            .background(.accent)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                        
                    }.padding()
                    // cancel
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .frame(width: 100, height: 60)
                            .font(.system(size: 20))
                            .background(.accent)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                        
                    }.padding()
                }
            } .padding(20)
            
                .navigationTitle("Add Expenses")
                .navigationBarTitleDisplayMode(.inline)
            
            Spacer()
        }
        
    }
}

#Preview {
    AddExpenseView()
}
