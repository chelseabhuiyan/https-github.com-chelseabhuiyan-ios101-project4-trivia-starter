//
//  TrivaViewController.swift
//  Trivia
//
//  Created by Chelsea Bhuiyan on 3/10/24.
//

import UIKit

class TrivaViewController: UIViewController {
    
    @IBOutlet weak var questionsLabel: UILabel!
    
    @IBOutlet weak var choice1Button: UIButton!
    
    @IBOutlet weak var choice2Button: UIButton!
    
    @IBOutlet weak var choice3Button: UIButton!
    
    @IBOutlet weak var choice4Button: UIButton!
    
    var questions: [Question] = [
        Question(questionText: "What is the capital of France?", choices: ["Berlin", "Madrid", "Paris", "Rome"], correctAnswerIndex: 2),
        Question(questionText: "Which planet is known as the Red Planet?", choices: ["Mars", "Venus", "Jupiter", "Saturn"], correctAnswerIndex: 0),
        Question(questionText: "What is the largest mammal in the world?", choices: ["Elephant", "Blue Whale", "Giraffe", "Hippopotamus"], correctAnswerIndex: 1),
        Question(questionText: "Who wrote 'Romeo and Juliet'?", choices: ["Charles Dickens", "William Shakespeare", "Jane Austen", "Mark Twain"], correctAnswerIndex: 1),
        Question(questionText: "What is the currency of Japan?", choices: ["Dollar", "Euro", "Yen", "Pound"], correctAnswerIndex: 2)
    ]
    
    var currentQuestionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayQuestion()
    }
    
    func displayQuestion() {
        let currentQuestion = questions[currentQuestionIndex]
        questionsLabel.text = currentQuestion.questionText
        choice1Button.setTitle(currentQuestion.choices[0], for: .normal)
        choice2Button.setTitle(currentQuestion.choices[1], for: .normal)
        choice3Button.setTitle(currentQuestion.choices[2], for: .normal)
        choice4Button.setTitle(currentQuestion.choices[3], for: .normal)
    }
    
   
    @IBAction func choice1Tapped(_ sender: UIButton) {
        handleAnswerTapped(choiceIndex: 0)
    }
    
    
    @IBAction func choice2Tapped(_ sender: UIButton) {
        handleAnswerTapped(choiceIndex: 1)
    }
    
    
    @IBAction func choice3Tapped(_ sender: UIButton) {
        handleAnswerTapped(choiceIndex: 2)
    }
    
    
    @IBAction func choice4Tapped(_ sender: UIButton) {
        handleAnswerTapped(choiceIndex: 3)
    }
    
    
    func handleAnswerTapped(choiceIndex: Int) {
        let currentQuestion = questions[currentQuestionIndex]
        
        // Check if the selected answer is correct
        if choiceIndex == currentQuestion.correctAnswerIndex {
            print("Correct!")
            // Handle correct answer logic
        } else {
            print("Incorrect!")
            // Handle incorrect answer logic
        }
        
        // Move to the next question
        currentQuestionIndex += 1
        if currentQuestionIndex < questions.count {
            print("Moving to the next question")
            displayQuestion()
        } else {
            print("Game Over")
            // You might want to reset the game or navigate to a summary screen
        }
    }
}
