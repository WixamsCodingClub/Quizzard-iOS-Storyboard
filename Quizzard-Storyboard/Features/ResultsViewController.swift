
import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizData: QuizData? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let quizData = quizData else { return }
        
        scoreLabel.text = "You scored " + quizData.score
    }

}
