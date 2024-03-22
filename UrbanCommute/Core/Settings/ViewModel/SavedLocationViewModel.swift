//
//  SavedLocationViewModel.swift
//  UrbanCommute
//
//  Created by Dhruv Sharma on 22/03/24.
//

import Foundation
enum SavedLocationViewModel: Int,CaseIterable,Identifiable{
    case home
    case work
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .work:
            return "Work"
        }
    }
    
    var imageName: String{
        switch self {
        case .home:
            return "house.circle.fill"
        case .work:
            return "archivebox.circle.fill"
        }
    }
    var subtitle: String{
        switch self {
        case .home:
            return "Add Home"
        case .work:
            return "Add Work"
        }
    }
    var id: Int {return self.rawValue}
}
