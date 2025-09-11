
import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var circularProgressBarView: MBCircularProgressBarView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizData: QuizData? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        circularProgressBarView.value = 0
        circularProgressBarView.maxValue = 100
        circularProgressBarView.unitString = "%"
        circularProgressBarView.progressLineWidth = 10.0
        circularProgressBarView.progressColor = .blue
        circularProgressBarView.progressStrokeColor = .blue
        circularProgressBarView.emptyLineWidth = 1.0
        circularProgressBarView.emptyLineColor = .black
        circularProgressBarView.emptyLineStrokeColor = .clear
        circularProgressBarView.progressCapType = 1
        
        guard let quizData = quizData else { return }
        
        scoreLabel.text = "You scored " + quizData.score
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard let quizData = quizData else { return }
        
        UIView.animate(withDuration: 1.5) {
            self.circularProgressBarView.value = CGFloat(quizData.percentage)
        }
        
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        navigationController?.dismiss(animated: true)
    }

}
