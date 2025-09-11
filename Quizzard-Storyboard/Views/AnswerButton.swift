
import UIKit

// TODO:
// - Set all styling

enum AnswerState {
    case unanswered, answeredCorrectly, answeredIncorrectly, unansweredCorrect
}

class AnswerButton: UIButton {
    
    var answerState: AnswerState = .unanswered {
        didSet { updateButtonStyle() }
    }
    
    // MARK: Initialisation
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialise()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialise()
    }
    
    private func initialise() {
        layer.cornerRadius = 8.0
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.black.cgColor
        
        
        updateButtonStyle()
    }

}

// MARK: - Private

extension AnswerButton {
    
    private func updateButtonStyle() {
        switch answerState {
        case .unanswered:
            backgroundColor = .white
        case .answeredCorrectly:
            backgroundColor = .green
        case .answeredIncorrectly:
            backgroundColor = .red
        case .unansweredCorrect:
            backgroundColor = .orange
        }
    }
    
}
