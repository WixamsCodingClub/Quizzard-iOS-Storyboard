
import UIKit

//protocol QuestionViewControllerDelegate {
//    func questionViewControllerDidAnswerCorrectly(_ viewController: QuestionViewController)
//    func questionViewControllerDidAnswerInorrectly(_ viewController: QuestionViewController)
//}

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var questionTextLabel: UILabel!
    @IBOutlet weak var firstAnswerButton: AnswerButton!
    @IBOutlet weak var secondAnswerButton: AnswerButton!
    @IBOutlet weak var thirdAnswerButton: AnswerButton!
    @IBOutlet weak var fourthAnswerButton: AnswerButton!
    
//    var delegate: QuestionViewControllerDelegate?
    
//    var questions: [Question] = []
    
    var quizData: QuizData? = nil
    
    private let correctAnswerIndex = Int.random(in: 0...3)
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let quizData = quizData else { return }
        
        title = "Question: \(quizData.currentQuestionNumber)"
        questionTextLabel.text = quizData.currentQuestion.question.text
        
        var allAnswers = quizData.currentQuestion.incorrectAnswers
        allAnswers.insert(quizData.currentQuestion.correctAnswer, at: correctAnswerIndex)
        
        firstAnswerButton.setTitle(allAnswers[0], for: .normal)
        secondAnswerButton.setTitle(allAnswers[1], for: .normal)
        thirdAnswerButton.setTitle(allAnswers[2], for: .normal)
        fourthAnswerButton.setTitle(allAnswers[3], for: .normal)
    }
    
}
