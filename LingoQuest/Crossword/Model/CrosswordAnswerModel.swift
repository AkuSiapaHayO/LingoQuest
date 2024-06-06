//
//  CrosswordAnswerModel.swift
//  LingoQuest
//
//  Created by MacBook Pro on 06/06/24.
//

import Foundation

struct CrosswordAnswerModel: Codable, Identifiable {
    let id: Int
    let row: Int
    let col: Int
    let letter: String
    let label: String?
}
