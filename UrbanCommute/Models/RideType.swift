//
//  RideType.swift
//  UrbanCommute
//
//  Created by Dhruv Sharma on 10/03/24.
//

import Foundation

enum RideType: Int, CaseIterable, Identifiable {
    case ucAuto
    case ucSharing
    case ucElectric
    
    var id: Int { return rawValue }
    
    var description: String {
        switch self {
        case .ucAuto: return "UC Auto"
        case .ucSharing: return "UC Sharing"
        case .ucElectric: return "UC Bike"
        }
    }
    
    var imageName: String {
        switch self {
        case .ucAuto: return "auto"
        case .ucSharing: return "pool2"
        case .ucElectric: return "bike"
        }
    }
    
    var baseFare: Double{
        switch self {
        case .ucAuto: return 40
        case .ucSharing: return 50
        case .ucElectric: return 30
        }
    }
    
    func computePrice(for distanceInMeters: Double) -> Double{
        let distanceInKM = distanceInMeters/1000
        switch self{
        case .ucAuto: return distanceInKM * 10.8 + baseFare
        case .ucSharing: return distanceInKM * 13.2 + baseFare
        case .ucElectric: return distanceInKM * 9.9 + baseFare
        }
    }
    
}
