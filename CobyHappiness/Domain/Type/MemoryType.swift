//
//  MemoryType.swift
//  CobyHappiness
//
//  Created by Coby on 6/25/24.
//

import Foundation

enum MemoryType: String, Identifiable, CaseIterable, Codable {
    case trip, food, hobby, concert, flex, moment
    
    var id: String {
        self.rawValue
    }
    
    var title: String {
        switch self {
        case .trip:
            return "여행"
        case .food:
            return "음식"
        case .hobby:
            return "취미"
        case .concert:
            return "공연"
        case .flex:
            return "소비"
        case .moment:
            return "순간"
        }
    }
}
