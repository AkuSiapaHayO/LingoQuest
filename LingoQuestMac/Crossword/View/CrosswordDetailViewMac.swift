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
    @StateObject private var audioManager = AudioManager.shared
    var onBack: () -> Void

    var body: some View {
        ZStack(alignment: .topLeading) {
            CrosswordViewMac(levelNumber: level, levelsViewModel: viewModel, onBack: onBack)  // Pass the closure here

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
            .padding(.top, 20)
        }
        .background(Color.white.opacity(1))
        .edgesIgnoringSafeArea(.all)
        .onAppear(){
            audioManager.playBackgroundSound(sound: "Cute Avalanche - RKVC", type: "mp3")
        }
        .onDisappear {
            audioManager.stopBackgroundSound()
        }
        
    }
    
    
}
