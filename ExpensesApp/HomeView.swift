//
//  ContentView.swift
//  ExpensesApp
//
//  Created by Wijdan Almutairi on 26/11/2024.
//

import SwiftUI

struct HomeView: View {
    @State private var isShowingAddSheet = false
    
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
               
                List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                    Text("Expense \(item + 1)" )
                        .padding(7)
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
