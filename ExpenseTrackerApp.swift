//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by ojohnpepsi on 2023-11-08.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    @StateObject var transactionListVM = TransactionListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
