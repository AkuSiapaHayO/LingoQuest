//
//  LevelViewModel.swift
//  LingoQuest
//
//  Created by MacBook Pro on 06/06/24.
//

import Foundation

class BlankSpaceLevelViewModel: ObservableObject {
    @Published var levelsData: [BlankSpaceModel] = []

    init() {
        loadLevels()
    }

    func isUnlocked(level: Int) -> Bool {
        if level == 1 {
            return true
        }
        return UserDefaults.standard.bool(forKey: "level_\(level)_unlocked")
    }

    func loadLevels() {
        if let url = Bundle.main.url(forResource: "levels", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                levelsData = try decoder.decode([BlankSpaceModel].self, from: data)
            } catch {
                print("Failed to load level data: \(error)")
            }
        }
    }

    func unlockNextLevel(after level: Int) {
        let nextLevel = level + 1
        UserDefaults.standard.set(true, forKey: "level_\(nextLevel)_unlocked")
    }
}
