//
//  Double.swift
//  UrbanCommute
//
//  Created by Dhruv Sharma on 17/03/24.
//

import Foundation

extension Double{
    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "en_IN")
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    func toCurrency() -> String{
        return currencyFormatter.string(for: self) ?? "₹0.00"
    }
    
}
