//
//  StreakManager.swift
//  LingoQuest
//
//  Created by Dhiaz Ramadhan on 07/06/24.
//

import Foundation

class StreakManager: ObservableObject {
    @Published var streakCount: Int = 0
    @Published var lastPlayedDate: Date? = nil
    @Published var shape: String = "🌟" // Default shape
    
    init() {
        checkForSkippedDay()
    }
    
    // Method to update streak
    func updateStreak() {        
        let today = Calendar.current.startOfDay(for: Date())
        
        if let lastDate = lastPlayedDate {
            let lastDay = Calendar.current.startOfDay(for: lastDate)
            if today == lastDay {
                // Same day win, only count the first win
                return
            } else if Calendar.current.isDateInYesterday(lastDate) {
                // Increment streak if played yesterday
                streakCount += 1
            } else {
                // Reset streak if skipped a day
                streakCount = 1
            }
        } else {
            // First time playing
            streakCount = 1
        }
        
        lastPlayedDate = today
        updateShape()
    }
    
    // Method to check for skipped day
    func checkForSkippedDay() {
        let today = Calendar.current.startOfDay(for: Date())
        
        if let lastDate = lastPlayedDate {
            let lastDay = Calendar.current.startOfDay(for: lastDate)
            if !Calendar.current.isDateInYesterday(lastDay) && today != lastDay {
                // Reset streak if a day is skipped
                streakCount = 0
                updateShape()
            }
        }
    }
    
    // Method to update shape based on streak count
    func updateShape() {
        switch streakCount {
        case 3:
            shape = "🔥"
        case 7:
            shape = "🔥🔥"
        default:
            shape = "🌟"
        }
    }
}
