
import UIKit

class WelcomeViewController: UIViewController {
    
    private var questions: [Question]?
    
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
                // cache the questions for the segue
                self.questions = questions
                self.performSegue(withIdentifier: "Start_Quiz_Segue", sender: nil)
            case .failure(let error):
                ()
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "Start_Quiz_Segue",
              let navController = segue.destination as? UINavigationController,
              let questionVC = navController.topViewController as? QuestionViewController,
              let questions = questions else { return }
        
        questionVC.quizData = QuizData(questions: questions)
    }
    
}

// MARK: - Private

extension WelcomeViewController {
    
//    private func startQuiz(with questions: [Question]) {
//        
//        performSegue(withIdentifier: "Start_Quiz_Segue", sender: nil)
//        
//        
////        quizManager = QuizManager(viewController: self, questions: questions)
////        quizManager?.delegate = self
////        quizManager?.start()
//    }
    
}

// MARK: - QuizManagerDelegate

//extension WelcomeViewController: QuizManagerDelegate {
//    
////    func quizManagerDidFinish(_ manager: QuizManager) {
////        quizManager = nil
////    }
//    
//}
