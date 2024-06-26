//
//  MemoryTileView.swift
//  CobyHappiness
//
//  Created by Coby on 6/12/24.
//

import SwiftUI

import CobyDS

struct MemoryTileView: View {
    
    @EnvironmentObject private var appModel: AppViewModel
    
    private let memory: MemoryModel
    private let isShadowing: Bool
    private let isSelected: Bool
    
    init(
        memory: MemoryModel,
        isShadowing: Bool = false,
        isSelected: Bool = false
    ) {
        self.memory = memory
        self.isShadowing = isShadowing
        self.isSelected = isSelected
    }
    
    var body: some View {
        HStack(spacing: 16) {
            ThumbnailView(
                image: self.memory.photos.first
            )
            .frame(width: 80, height: 80)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(self.memory.title)
                    .font(.pretendard(size: 16, weight: .semibold))
                    .foregroundColor(Color.labelNormal)
                    .lineLimit(1)
                    .truncationMode(.tail)
                
                Text(self.memory.note)
                    .font(.pretendard(size: 14, weight: .regular))
                    .foregroundColor(Color.labelNeutral)
                    .lineLimit(2)
                    .truncationMode(.tail)
                
                Spacer()
            }
            
            Spacer()
        }
        .padding(10)
        .frame(maxWidth: .infinity)
        .frame(height: 100)
        .background(Color.backgroundNormalNormal)
        .clipShape(.rect(cornerRadius: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(self.isSelected ? Color.blueNormal : Color.lineNormalNeutral, lineWidth: self.isShadowing ? 0 : 1)
        )
        .shadow(
            color: self.isShadowing ? Color.shadowEmphasize : Color.clear,
            radius: 8,
            x: 0,
            y: 2
        )
    }
}
