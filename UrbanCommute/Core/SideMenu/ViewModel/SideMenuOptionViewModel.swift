//
//  SideMenuOptionViewModel.swift
//  UrbanCommute
//
//  Created by Dhruv Sharma on 21/03/24.
//

import Foundation

enum SideMenuOptionViewModel: Int,CaseIterable,Identifiable {
    case trips
    case wallets
    case settings
    case messages
    
    var title: String{
        switch self {
        case .trips: return "Your Trips"
        case .wallets: return "Wallet"
        case .settings: return "Settings"
        case .messages: return "Messages"
        }
    }
    
    var imageName: String{
        switch self {
        case .trips: return "list.bullet.rectangle"
        case .wallets: return "creditcard"
        case .settings: return "gear"
        case .messages: return "bubble.left"
        }
    }
    
    var id: Int{
        return self.rawValue
    }
    
}
