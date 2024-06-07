//
//  CrosswordLevelsViewMac.swift
//  LingoQuest_Mac
//
//  Created by MacBook Pro on 06/06/24.
//
import SwiftUI

struct CrosswordLevelsViewMac: View {
    @ObservedObject var viewModel: CrosswordLevelsViewModel
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
                Text("Crossword Puzzle")
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
                                    .background(viewModel.isUnlocked(level: level) ? Color(red: 7 / 255, green: 169 / 255, blue: 243 / 255) : Color.gray)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                            .buttonStyle(ClearLevelButtonStyle())
                            .disabled(!viewModel.isUnlocked(level: level))
                        }
                    }
                    .padding()
                }
                .padding(.horizontal, 20)
            }

            if let level = selectedLevel {
                CrosswordDetailViewMac(level: level, viewModel: viewModel) {
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

struct ClearLevelButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(Color.clear)
            .cornerRadius(8)
    }
}
