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
                    
                    Text("50 SAR")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.semibold)
                }.padding()
               
                List {
                    
                    ForEach(expenses) {  expense in
                        HStack {
                            Text("\(expense.date)")
                            Text("\(expense.name)")
                            Text("\(expense.cost)")
                        }
                        
                            .padding(7)
                    }
                }
                .listStyle(.plain)
                .padding(.top)
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
}

#Preview {
    HomeView()
}
