//
//  ProfileView.swift
//  CobyHappiness
//
//  Created by Coby on 6/9/24.
//

import SwiftUI

import CobyDS

struct ProfileView: View {
    
    var body: some View {
        VStack(spacing: 0) {
            TopBarView(
                leftSide: .text,
                leftTitle: "정보",
                rightSide: .icon,
                rightIcon: Image("setting"),
                rightAction: {
                    print("추가")
                }
            )
            
            Spacer()
        }
        .background(Color.backgroundNormalNormal)
    }
}

#Preview {
    ProfileView()
}