//
//  CrosswordDetailViewMac.swift
//  LingoQuest_Mac
//
//  Created by MacBook Pro on 06/06/24.
//
import SwiftUI

struct CrosswordDetailViewMac: View {
    var level: Int
    @ObservedObject var viewModel: CrosswordLevelsViewModel
    var onBack: () -> Void

    var body: some View {
        ZStack(alignment: .topLeading) {
            CrosswordViewMac(levelNumber: level, levelsViewModel: viewModel)

            Button(action: {
                onBack()
            }) {
                Image(systemName: "arrow.backward")
                    .font(.title)
                    .padding()
                    .foregroundColor(.black)
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(8)
            }
            .buttonStyle(ClearButtonStyle())
            .padding(.leading, 20)
            .padding(.top, 50)
        }
        .background(Color.white.opacity(1))
        .edgesIgnoringSafeArea(.all)
    }
}

struct ClearButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(Color.clear)
            .cornerRadius(8)
    }
}

struct CrosswordDetailViewMac_Previews: PreviewProvider {
    static var previews: some View {
        let levelsViewModel = CrosswordLevelsViewModel()
        CrosswordDetailViewMac(level: 1, viewModel: levelsViewModel) {
            // Handle back navigation
        }
    }
}
