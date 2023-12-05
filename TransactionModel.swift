//
//  TransactionModel.swift
//  ExpenseTracker
//
//  Created by ojohnpepsi on 2023-11-08.
//

import Foundation
import SwiftUIFontIcon

struct Transaction: Identifiable, Decodable, Hashable {
    let id: Int
    let date: String
    let institution : String
    let account: String
    var merchant: String
    let amount: Double
    let type: TransactionType.RawValue
    var categoryId: Int
    var category: String
    let isPending: Bool
    var isTransfer: Bool
    var isExpense: Bool
    var isEdited: Bool
    
    var icon: FontAwesomeCode {
        if let category = Category.all.first(where: { $0.id == categoryId }) {
            return category.icon
        }
        
        return .question
    }
    
    var dateParsed: Date {
        date.dateParsed()
    }
    
    var signedAmount: Double {
        return type == TransactionType.credit.rawValue ? amount : -amount
    }
    
    var month: String {
        dateParsed.formatted(.dateTime.year().month(.wide))
    }
}

enum TransactionType: String {
    case debit = "debit"
    case credit = "credit"
}

struct Category {
    let id: Int
    let name: String
    let icon: FontAwesomeCode
    var mainCategoryId: Int?
}

extension Category {
    static let autoandTransport = Category(id: 1, name: "Auto & Transport", icon: .car_alt)
    static let billsAndUtilities = Category(id: 2, name: "Bills & Utilities", icon: .file_invoice_dollar)
    static let entertainment = Category(id: 3, name: "Entertainment", icon: .film)
    static let feesAndCharges = Category(id:4, name: "Fees & Charges", icon: .hand_holding_usd)
    static let foodAndDining = Category(id:4, name: "Food & Date", icon: .hamburger)
    static let home = Category(id:5, name: "Home", icon: .home)
    static let income = Category(id:6, name: "Income", icon: .dollar_sign)
    static let shopping = Category(id:7, name: "Shopping", icon: .shopping_cart)
    static let transfer = Category(id: 8, name: "Transfer", icon: .exchange_alt)
    
    static let publicTransportation = Category(id: 101, name: "Gas Expense", icon: .bus, mainCategoryId: 1)
    static let taxi = Category(id: 102, name: "Taxi", icon: .taxi, mainCategoryId: 1)
    static let mobilePhone = Category(id: 201, name: "Mobile Usage", icon: .mobile_alt, mainCategoryId: 2)
    static let moviesAndDvds = Category(id: 301, name: "Movies & DVD", icon: .film, mainCategoryId: 3)
    static let bankFee = Category(id: 401, name: "Bank Fees", icon: .hand_holding_usd, mainCategoryId: 4)
    static let financeCharge = Category(id: 402, name: "Finance Charge", icon: .hand_holding_usd, mainCategoryId: 4)
    static let groceries = Category(id: 501, name: "Groceries", icon: .shopping_basket, mainCategoryId: 5)
    static let restaurant = Category(id: 502, name: "Restaurants & Date", icon: .utensils, mainCategoryId: 5)
    static let rent = Category(id: 601, name: "Rent", icon: .house_user, mainCategoryId: 6)
    static let homeSupplies = Category(id: 602, name: "Home Supplies", icon: .lightbulb, mainCategoryId: 6)
    static let paycheque = Category(id: 701, name: "Income", icon: .dollar_sign, mainCategoryId: 7)
    static let software = Category(id: 801, name: "Subscription", icon: .icons, mainCategoryId: 8)
    static let creditCardPayment = Category(id: 901, name: "Credit Card Payment", icon: .exchange_alt, mainCategoryId: 9)
}

extension Category {
    static let categories: [Category] = [
        .autoandTransport,
        .billsAndUtilities,
        .entertainment,
        .feesAndCharges,
        .foodAndDining,
        .home,
        .income,
        .shopping,
        .transfer
    ]

    static let subCategories: [Category] = [
        .publicTransportation,
        .taxi,
        .mobilePhone,
        .moviesAndDvds,
        .financeCharge,
        .groceries,
        .restaurant,
        .rent,
        .homeSupplies,
        .paycheque,
        .software,
        .creditCardPayment,
    ]
    
    static let all: [Category] = categories + subCategories
}
