
import UIKit

protocol QuizManagerDelegate {
    func quizManagerDidFinish(_ manager: QuizManager)
}

class QuizManager {
    
    var delegate: QuizManagerDelegate?
    
    private let questions: [Question]
    private var questionNumber = 1
    private var correctAnswers = 0
    
    init(viewController: UIViewController, questions: [Question]) {
        self.questions = questions
    }
    
    func start() {
        showQuestion(at: 0)
    }
    
}

// MARK: - Private

extension QuizManager {
    
    private func showQuestion(at index: Int) {
        // Index 0 add as root to new NavController and show modally
        
        // Next questions shopuld be push but not retained in memory
    }
    
}
