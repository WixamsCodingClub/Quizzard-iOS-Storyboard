
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
    
    @IBOutlet weak var nextQuestionButton: UIButton!
    
    
//    var delegate: QuestionViewControllerDelegate?
    
//    var questions: [Question] = []
    
    var quizData: QuizData? = nil
    
    private let correctAnswerIndex = Int.random(in: 0...3)
    private var allAnswerButtons: [AnswerButton] = []
        
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
        
        allAnswerButtons = [firstAnswerButton, secondAnswerButton, thirdAnswerButton, fourthAnswerButton]
        
        nextQuestionButton.isEnabled = false
    }
    
    @IBAction func answerButtonTapped(_ sender: Any) {
        
        guard let selectedButton = sender as? AnswerButton, let selectedButtonIndex = allAnswerButtons.firstIndex(of: selectedButton) else { return }
        
        // TODO: Disable buttons
        
        let isCorrect = selectedButtonIndex == correctAnswerIndex
        
        if isCorrect {
            selectedButton.answerState = .answeredCorrectly
        } else {
            selectedButton.answerState = .answeredIncorrectly
            allAnswerButtons[correctAnswerIndex].answerState = .unansweredCorrect
        }
        
        quizData?.didAnswerCorrectly(correct: isCorrect)
        allAnswerButtons.forEach{ $0.isEnabled = false }
        nextQuestionButton.isEnabled = true
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        if quizData!.isQuizFinished {
            let resultsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
            resultsVC.quizData = quizData
            navigationController?.pushViewController(resultsVC, animated: true)
        } else {
            let questionVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "QuestionViewController") as! QuestionViewController
            questionVC.quizData = quizData
            navigationController?.pushViewController(questionVC, animated: true)
        }
    }
    
}
