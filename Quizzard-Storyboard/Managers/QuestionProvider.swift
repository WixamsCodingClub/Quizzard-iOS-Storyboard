//
//  QuestionProvider.swift
//  Quizzard-Storyboard
//

import Foundation

/// Single source of questions from the TriviaAPI
/// https://the-trivia-api.com
class QuestionProvider {
    
    static func getNewQuestions(result: @escaping (Result<[Question], QError>) -> Void) {
        let url = URL(string: "https://the-trivia-api.com/v2/questions")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // Nested function for handling any errors
        func handleError(_ error: QError) {
            Logger.log(error: error)
            RunUtilities.runOnMain {
                result(.failure(error))
            }
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            // Error returned from network call
            if let error = error {
                let qError = QError.network(message: error.localizedDescription)
                handleError(qError)
                return
            }
            
            // No response
            guard let response = response as? HTTPURLResponse else {
                let qError = QError.network(message: "Unexpected nil response.")
                handleError(qError)
                return
            }
            
            // Not a 200 response code
            guard (200...299).contains(response.statusCode) else {
                let qError = QError.network(message: "Unexpected HTTP response code \(response.statusCode)")
                handleError(qError)
                return
            }
            
            // No data
            guard let data = data else {
                let qError = QError.network(message: "Unexpected nil data response.")
                handleError(qError)
                return
            }
            
            do {
                let questions = try JSONDecoder().decode([Question].self, from: data)
                Logger.log(any: questions)
                RunUtilities.runOnMain {
                    result(.success(questions))
                }
            } catch (let error) {
                Logger.log(data: data)
                let qError = QError.jsonDecoding(message: error.localizedDescription)
                handleError(qError)
            }
        }
            
        task.resume()
    }
    
}
