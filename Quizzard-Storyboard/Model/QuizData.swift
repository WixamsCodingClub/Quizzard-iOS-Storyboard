
import Foundation

class QuizData {
    private let questions: [Question]
    private var currentQuestionIndex = 0
    private var correctAnswers = 0
    
    init(questions: [Question]) {
        self.questions = questions
    }
    
    var currentQuestion: Question {
        return questions[currentQuestionIndex]
    }
    
    var currentQuestionNumber: Int {
        return currentQuestionIndex + 1
    }
    
    /// Returns `true` if the current question index is beyond the range of questions.
    var isQuizFinished: Bool {
        return currentQuestionIndex >= questions.count
    }
    
    /// Returns the current score as a `String` in the format "5 / 10"
    var score: String {
        return "\(correctAnswers) / \(questions.count)"
    }
    
    /// Returns the current score as a percentage.
    var percentage: Float {
        return Float(correctAnswers) / Float(questions.count) * 100.0
    }
    
    /// Increments the running score and sets the current question number
    func didAnswerCorrectly(correct: Bool) {
        if correct {
            correctAnswers += 1
        }
        currentQuestionIndex += 1
    }
    
}
