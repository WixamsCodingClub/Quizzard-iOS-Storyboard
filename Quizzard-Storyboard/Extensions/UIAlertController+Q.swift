
import UIKit

extension UIAlertController {
    
    //    func q_showProgressAlert(from: UIViewController, completion: (() -> Void)) {
    //
    //    }
    
    static func q_showAlert(title: String? = nil, message: String? = nil, from viewController: UIViewController, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.q_addAction(title: "OK", style: .default, handler: completion)
        alert.q_present(from: viewController)
    }
    
    static func q_showErrorAlert(error: QError, from viewController: UIViewController, completion: (() -> Void)? = nil) {
        q_showAlert(title: "Error", message: error.localizedDescription, from: viewController, completion: completion)
    }
    
    static func q_showChoiceAlert(title: String? = nil, message: String? = nil, positiveButtonTitle: String = "OK", negativeButtonTitle: String = "Cancel", from viewController: UIViewController, completion: @escaping ((Bool) -> Void)) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.q_addAction(title: positiveButtonTitle, style: .default) {
            completion(true)
        }
        alert.q_addCancelAction(title: negativeButtonTitle) {
            completion(false)
        }
        alert.q_present(from: viewController)
    }
}

// MARK: - Helpers

extension UIAlertController {
    
    private func q_addCancelAction(title: String = "Cancel", handler: (() -> Void)? = nil) {
        q_addAction(title: title, style: .cancel, handler: handler)
    }
    
    private func q_addAction(title: String, style: UIAlertAction.Style = .default, handler: (() -> Void)? = nil) {
        addAction(UIAlertAction(title: title, style: style, handler: { _ in
            if let handler = handler {
                handler()
            }
        }))
    }
    
    private func q_present(from viewController: UIViewController) {
        view.tintColor = viewController.view.tintColor
        viewController.present(self, animated: true)
    }
    
}
