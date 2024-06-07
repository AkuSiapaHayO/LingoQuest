//
//  BlankSpaceClearLevelButtonStyle.swift
//  LingoQuestMac
//
//  Created by MacBook Pro on 07/06/24.
//

import SwiftUI
struct BlankSpaceClearLevelButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(Color.clear)
            .cornerRadius(8)
    }
}
