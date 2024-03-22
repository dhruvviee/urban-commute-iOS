//
//  Color.swift
//  UrbanCommute
//
//  Created by Dhruv Sharma on 17/03/24.
//


import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme{
    let backgroundColor = Color("BackgroundColor")
    let secondaryBackgroundColor = Color("SecondaryBackgroundColor")
    let primaryTextColor = Color("PrimaryTextColor")
}
