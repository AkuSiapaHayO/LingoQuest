//
//  CrosswordQuestionModel.swift
//  LingoQuest
//
//  Created by MacBook Pro on 06/06/24.
//

import Foundation

struct CrosswordQuestionModel: Codable, Identifiable {
    let id: Int
    let direction: String
    let question: String
    let answer: String
}
