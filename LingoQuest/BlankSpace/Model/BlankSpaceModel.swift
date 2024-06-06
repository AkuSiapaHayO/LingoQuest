//
//  LevelData.swift
//  LingoQuest
//
//  Created by MacBook Pro on 06/06/24.
//

import Foundation

struct BlankSpaceModel: Codable {
    let id: Int
    let paragraph: String
    let correctAnswer: [String]
    let choices: [String]
}
