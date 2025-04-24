//
//  WelcomeViewController.swift
//  Quizzard-Storyboard
//

import UIKit

class WelcomeViewController: UIViewController {
    
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
