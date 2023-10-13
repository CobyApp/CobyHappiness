//
//  ContentView.swift
//  CobyHappiness
//
//  Created by COBY_PRO on 10/4/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var appModel: AppViewModel = .init()
    
    @Namespace var animation
    
    var body: some View {
        ZStack{
            Home(animation: animation)
                .opacity(appModel.showDetailView ? 0 : 1)
                .environmentObject(appModel)
                .modelContainer(for: Event.self)
            
            if let event = appModel.currentActiveItem, appModel.showDetailView {
                Detail(event: event, animation: animation)
                    .environmentObject(appModel)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.backgroundLightGray)
    }
}
