
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
    
    var isLastQuestion: Bool {
        return currentQuestionIndex == questions.count + 1
    }
    
    // When incrementing the question  numebr don't allow it to go above the number of questions
    
}
