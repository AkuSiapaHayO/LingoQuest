//
//  LevelsView.swift
//  LingoQuest
//
//  Created by Clarissa A. Herawan on 30/05/24.
//

import SwiftUI

struct LevelsView: View {
    @StateObject var levelsViewModel = LevelViewModel()
    
    var body: some View {
//        NavigationView {
            VStack {
                Spacer()
                VStack {
                    Text("Select Level")
                        .font(.title)
                        .padding(.top, 20)
                    
                    Text("Say The Word")
                        .font(.largeTitle)
                        .bold()
                        .padding(.bottom, 20)
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 3), spacing: 20) {
                        ForEach(1...15, id: \.self) { level in
                            NavigationLink(destination: SayTheWordView(viewModel: SayTheWordViewModel(level: level, levelViewModel: levelsViewModel))) {
                                Text("\(level)")
                                    .font(.title)
                                    .frame(width: 80, height: 80)
                                    .background(levelsViewModel.isUnlocked(level: level) ? Color.orange : Color.gray)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                            .disabled(!levelsViewModel.isUnlocked(level: level))
                        }
                    }
                    .padding()
                }
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, 20)
            .onAppear {
                levelsViewModel.loadLevels()
            }
        }
//    }
}

#Preview {
    LevelsView()
}
