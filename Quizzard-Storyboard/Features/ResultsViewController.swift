
import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizData: QuizData? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scoreLabel.text = quizData?.score
    }

}
