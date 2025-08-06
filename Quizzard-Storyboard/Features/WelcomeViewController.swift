
import UIKit

class WelcomeViewController: UIViewController {
    
    private var quizManager: QuizManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func startQuizButtonTapped(_ sender: Any) {
        
        // TODO: Show progress indicator
        
        QuestionProvider.getNewQuestions { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let questions):
                ()
            case .failure(let error):
                ()
            }
        }
        
    }
    
}

// MARK: - Private

extension WelcomeViewController {
    
    private func startQuiz(with questions: [Question]) {
        quizManager = QuizManager(viewController: self, questions: questions)
        quizManager?.delegate = self
        quizManager?.start()
    }
    
}

// MARK: - QuizManagerDelegate

extension WelcomeViewController: QuizManagerDelegate {
    
    func quizManagerDidFinish(_ manager: QuizManager) {
        quizManager = nil
    }
    
}
