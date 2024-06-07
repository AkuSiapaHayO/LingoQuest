//
//  AudioManager.swift
//  LingoQuest
//
//  Created by MacBook Pro on 07/06/24.
//

import Foundation
import AVFoundation
import SwiftUI

class AudioManager: ObservableObject {
    static let shared = AudioManager()
    var player: AVAudioPlayer?

    func playBackgroundSound(sound: String, type: String) {
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
            do {
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                player?.numberOfLoops = -1 // Infinite loop
                player?.play()
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        } else {
            print("Sound file not found")
        }
    }
    
    func stopBackgroundSound() {
        player?.stop()
    }
}
