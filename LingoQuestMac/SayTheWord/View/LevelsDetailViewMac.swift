//
//  LevelsDetailViewMac.swift
//  LingoQuestMac
//
//  Created by Clarissa A. Herawan on 06/06/24.
//

import SwiftUI

struct LevelsDetailViewMac: View {
    var level: Int
    @ObservedObject var viewModel: LevelViewModel
    var onBack: () -> Void

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    onBack()
                }) {
                    Image(systemName: "arrow.backward")
                        .font(.title)
                        .padding()
                        .foregroundColor(.black)
                }
                .buttonStyle(ClearButtonStyle()) 
                Spacer()
            }
            .background(Color(.white))
            .padding(.top, 60)
            .padding(.leading, 10)

            SayTheWordViewMac(viewModel: SayTheWordViewModelMac(level: level, levelViewModel: viewModel))        }
        .background(Color.white.opacity(1)) // Make background opaque
        .edgesIgnoringSafeArea(.all)
    }
}

struct LevelsDetailViewMac_Previews: PreviewProvider {
    static var previews: some View {
        LevelsDetailViewMac(level: 1, viewModel: LevelViewModel()) {}
    }
}

