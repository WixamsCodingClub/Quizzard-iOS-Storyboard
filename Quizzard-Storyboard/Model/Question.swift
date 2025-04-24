//
//  Question.swift
//  Quizzard-Storyboard
//

struct Question: Decodable {
    let id: String
    let category: Category
    let tags: [String]
    let difficulty: Difficulty
    let question: QuestionText
    let correctAnswer: String
    let incorrectAnswers: [String]
}

struct QuestionText: Decodable {
    let text: String
}
