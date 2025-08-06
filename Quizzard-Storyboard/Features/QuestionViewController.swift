
import UIKit

protocol QuestionViewControllerDelegate {
    func questionViewControllerDidAnswerCorrectly(_ viewController: QuestionViewController)
    func questionViewControllerDidAnswerInorrectly(_ viewController: QuestionViewController)
}

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var firstAnswerButton: AnswerButton!
    @IBOutlet weak var secondAnswerButton: AnswerButton!
    @IBOutlet weak var thirdAnswerButton: AnswerButton!
    @IBOutlet weak var fourthAnswerButton: AnswerButton!
    
    var delegate: QuestionViewControllerDelegate?
    
    var questions: [Question] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}
