//
//  ViewController.swift
//  Bull’s Eye
//
//  Created by Eder  Padilla on 29/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var slider: UISlider!
    @IBOutlet weak var targetValueLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var roundLabel: UILabel!
    private var currentValue: Int = 50
    private var targetValue = 0
    private var score = 0
    private var round = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
    }
    
    private func startNewRound() {
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    private func updateLabels() {
        targetValueLabel.text = "Put the bulls eye as close as you can to: \(targetValue)"
        scoreLabel.text = score.description
        roundLabel.text = round.description
    }
    
    private func calculatePoints() -> Int {
        abs(targetValue - currentValue)
    }
    
    private func configureTitle(_ difference: Int, score: inout Int) -> String {
        var title: String
        if difference == 0 {
            title = "Perfect!"
            score += 100
        } else if difference < 5 {
            title = "You almost had it!"
            score += 50
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        return title
    }
    
    private func startNewGame() {
        score = 0
        round = 0
        startNewRound()
        let transition = CATransition()
        transition.type = CATransitionType.fade
        transition.duration = 1
        transition.timingFunction =
        CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        view.layer.add(transition, forKey: nil)
    }
    
    @IBAction func didSelectHitMe(_ sender: Any) {
        let difference = calculatePoints()
        let message = "The value of the slider is: \(currentValue)" +
        "\nThe target value is: \(targetValue)" +
        "\nYou scored: \(score)"
        let title = configureTitle(difference, score: &score)
        score += (100 - calculatePoints())
        let alert = UIAlertController(
            title: title,
            message: message,    // changed
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "OK",
            style: .default)
        { _ in self.startNewRound() }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func startOver() {
        startNewGame()
    }
    
    @IBAction func didSelectInfo(_ sender: Any) {
        let infoViewController = InfoViewController()
        present(infoViewController, animated: true)
    }
}

