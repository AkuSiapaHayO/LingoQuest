//
//  LevelsViewMac.swift
//  LingoQuest_Mac
//
//  Created by Clarissa A. Herawan on 31/05/24.
//

import SwiftUI

struct LevelsViewMac: View {
    @ObservedObject var viewModel: LevelViewModel
    @State private var selectedLevel: Int? = nil
    var onBack: () -> Void

    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button(action: {
                        onBack()
                    }) {
                        Image(systemName: "arrow.backward")
                            .font(.title)
                            .padding()
                            .foregroundColor(.black)
                            .buttonStyle(ClearButtonStyle())
                    }
                    .padding(.top, 20)
                    .padding(.leading, 20)
                    Spacer()
                }
                Text("Select Level")
                    .font(.title)
                    .padding(.top, 40)
                    .foregroundColor(.black)
                Text("Say the Word")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 20)
                    .padding(.top, 1)
                    .foregroundColor(.black)
                ScrollView {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 5), spacing: 20) {
                        ForEach(1...15, id: \.self) { level in
                            Button(action: {
                                if viewModel.isUnlocked(level: level) {
                                    selectedLevel = level
                                }
                            }) {
                                Text("\(level)")
                                    .font(.title)
                                    .frame(width: 80, height: 80)
                                    .background(viewModel.isUnlocked(level: level) ? Color.orange : Color.gray)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                            .buttonStyle(BlankSpaceClearLevelButtonStyle())
                            .disabled(!viewModel.isUnlocked(level: level))
                        }
                    }
                    .padding()
                }
                .padding(.horizontal, 20)
            }

            if let level = selectedLevel {
                LevelsDetailViewMac(level: level, viewModel: viewModel) {
                    selectedLevel = nil
                }
                .transition(.move(edge: .trailing))
                .zIndex(1)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            viewModel.loadLevels()
        }
        .background(Color.white)
    }
}

struct SayTheWordClearLevelButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(Color.clear)
            .cornerRadius(8)
    }
}

//struct LevelsViewMac_Previews: PreviewProvider {
//    static var previews: some View {
//        LevelsViewMac(viewModel: LevelViewModel())
//    }
//}

