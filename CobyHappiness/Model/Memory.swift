//
//  Memory.swift
//  CobyHappiness
//
//  Created by COBY_PRO on 2023/09/24.
//

import SwiftUI
import SwiftData

@Model
final class Memory {
    
    @Attribute(.unique)
    var id: UUID
    var date: Date
    var type: MemoryType
    var title: String
    var note: String
    var location: Location?
    var photos: [Data]
    var bunches: [Bunch]

    init(
        id: UUID = UUID(),
        date: Date,
        type: MemoryType,
        title: String,
        note: String,
        location: Location? = nil,
        photos: [Data],
        bunches: [Bunch] = []
    ) {
        self.id = id
        self.date = date
        self.type = type
        self.title = title
        self.note = note
        self.location = location
        self.photos = photos
        self.bunches = bunches
    }
}

enum MemoryType: String, Identifiable, CaseIterable, Codable {
    case music, video, food, flex, moment
    
    var id: String {
        self.rawValue
    }
    
    var description: String {
        switch self {
        case .music:
            return "기분이 좋아지는 음악"
        case .video:
            return "보기만 해도 힐링되는 영상"
        case .food:
            return "나를 행복하게 하는 음식"
        case .flex:
            return "스트레스가 풀리는 플렉스"
        case .moment:
            return "오늘 가장 행복했던 순간"
        }
    }

    var icon: String {
        switch self {
        case .music:
            return "🏦"
        case .video:
            return "🏡"
        case .food:
            return "🎉"
        case .flex:
            return "🏟"
        case .moment:
            return "📌"
        }
    }
}
