//
//  ContentView.swift
//  ExpensesApp
//
//  Created by Wijdan Almutairi on 26/11/2024.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @State private var isShowingAddSheet = false
    @State private var totalCost: Double = 0
    
    @Query (sort: \Expense.date) var expenses : [Expense]
    
    var body: some View {
        NavigationStack {
            VStack {
                // part one
                ZStack {
                    Rectangle()
                        .frame(width: 300, height: 200)
                        .foregroundColor(.accentColor)
                    .cornerRadius(12)
                    
                    Text("\(String(format: "%.2f", totalCost)) SAR")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.semibold)
                }.padding()
               
                List {
                    ForEach(expenses) {  expense in
                        HStack {
                            Text("\(expense.date)")
                            Text("\(expense.name)")
                            Text("\(String(format: "%.2f", expense.cost) )")
                        }
                        
                            .padding(7)
                    }
                }
                .listStyle(.plain)
                .padding(.top)
                .onAppear() {
                   calculateTotalCost()
                }
            }
            .padding()
            .navigationTitle("Expenses")
            .navigationBarTitleDisplayMode(.large)
            .sheet(isPresented: $isShowingAddSheet) {
                AddExpenseView()
            }
            .toolbar {
                Button {
                    isShowingAddSheet.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
    
    func calculateTotalCost () {
        expenses.forEach { expense in
            totalCost += expense.cost
        }
    }
}

#Preview {
    HomeView()
}
