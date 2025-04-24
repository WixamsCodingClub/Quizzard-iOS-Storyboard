//
//  Question.swift
//  Quizzard-Storyboard
//

struct Question: Decodable {
    let id: String
    let category: Category
    let tags: [String]
    let difficulty: Difficulty
    let question: String
    let correctAnswer: String
    let incorrectAnswers: [String]
}
