//
//  MapView.swift
//  CobyHappiness
//
//  Created by Coby on 6/9/24.
//

import SwiftUI
import SwiftData

import CobyDS

struct MapView: View {
    
    @EnvironmentObject private var appModel: AppViewModel
    
    @StateObject private var viewModel: MapViewModel
    
    @State private var isPresented: Bool = false
    @State private var filteredMemories: [Memory] = []
    
    init(viewModel: MapViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            TopBarView(
                leftSide: .title,
                leftTitle: "지도",
                rightSide: .text,
                rightTitle: "추억 추가",
                rightAction: {
                    self.isPresented = true
                }
            )
            
            ZStack(alignment: .bottom) {
                MapRepresentableView(
                    filteredMemories: self.$filteredMemories,
                    memories: self.viewModel.memories
                )
                
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 8) {
                        ForEach(self.filteredMemories, id: \.self) { memory in
                            MemoryTileView(
                                memory: memory,
                                isShadowing: true
                            )
                            .frame(width: BaseSize.fullWidth, height: 100)
                            .padding(.horizontal, 20)
                            .containerRelativeFrame(.horizontal)
                            .onTapGesture {
                                self.appModel.currentActiveItem = memory
                                self.appModel.showDetailView = true
                            }
                        }
                    }
                    .scrollTargetLayout()
                }
                .contentMargins(.horizontal, BaseSize.horizantalPadding, for: .scrollContent)
                .scrollIndicators(.hidden)
                .scrollTargetBehavior(.viewAligned)
                .frame(height: 100)
                .padding(.bottom, 30)
            }
        }
        .background(Color.backgroundNormalNormal)
        .fullScreenCover(
            isPresented: self.$isPresented,
            onDismiss: {
                self.viewModel.getMemories()
            }
        ) {
            EditMemoryPageView()
        }
    }
}