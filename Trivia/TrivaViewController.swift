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
    
    @IBOutlet weak var questionNumLabel: UILabel!
    
    @IBOutlet weak var restartButton: UIButton!
    
    
    var questions: [Question] = [
        Question(questionText: "Which album features Taylor Swift's song Mine?", choices: ["Speak Now", "Fearless", "Red", "1989"], correctAnswerIndex: 1),
        Question(questionText: "What is Taylor Swift's favorite number?", choices: ["9", "7", "22", "13"], correctAnswerIndex: 3),
        Question(questionText: "What does 'TV' stand for in reference to Taylor Swift's music?", choices: ["Television", "Track & Video", "Taylor's Version", "Tour Version"], correctAnswerIndex: 3),
        Question(questionText: "What is Taylor Swift's longest song?", choices: ["All too Well", "Enchanted", "Midnight Rain", "White Horse"], correctAnswerIndex: 1),
        Question(questionText: "Which song is these lyrics from 'I'd tell you I miss you but I don't know how'", choices: ["August", "Love Story", "Ours", "The Story Of Us"], correctAnswerIndex: 2)
    ]
    
    var currentQuestionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayQuestion()
        
        let backgroundImage = UIImageView(image: UIImage(named: "taylortriva.jpeg"))
                backgroundImage.contentMode = .scaleAspectFill
                view.addSubview(backgroundImage)
                view.sendSubviewToBack(backgroundImage)

               
        
    }
    
    func displayQuestion() {
        let currentQuestion = questions[currentQuestionIndex]
        questionsLabel.text = currentQuestion.questionText
        questionsLabel.font = UIFont.boldSystemFont(ofSize: 40)
        questionNumLabel.font = UIFont.boldSystemFont(ofSize: 30)
        choice1Button.setTitle(currentQuestion.choices[0], for: .normal)
        choice1Button.setTitleColor(.black, for: .normal)
        choice2Button.setTitle(currentQuestion.choices[1], for: .normal)
        choice2Button.setTitleColor(.black, for: .normal)
        choice3Button.setTitle(currentQuestion.choices[2], for: .normal)
        choice3Button.setTitleColor(.black, for: .normal)
        choice4Button.setTitle(currentQuestion.choices[3], for: .normal)
        choice4Button.setTitleColor(.black, for: .normal)
        questionNumLabel.text="Question \(currentQuestionIndex + 1)/\(questions.count)"
        restartButton.isHidden = false
        restartButton.setTitle("Restart", for: .normal)
            restartButton.setTitleColor(.black, for: .normal)
        
        
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
    
    
    @IBAction func restartButton(_ sender: UIButton) {
        restartGame()
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
            displaySummary()
            restartGame()
            
        }
    }
    func restartGame() {
            currentQuestionIndex = 0
            questionsLabel.text = "Game Restarted"
            restartButton.isHidden = false
            displayQuestion()
        }
        
    func displaySummary() {
            let alertController = UIAlertController(title: "Game Over", message: "You answered \(currentQuestionIndex) questions correctly!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                self.restartGame()
            }
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
    }
