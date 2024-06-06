//
//  CrosswordLevelModel.swift
//  LingoQuest
//
//  Created by MacBook Pro on 06/06/24.
//

import Foundation

struct CrosswordLevelModel: Codable {
    let levelNumber: Int
    let questions: [CrosswordQuestionModel]
    let answers: [CrosswordAnswerModel]
}
