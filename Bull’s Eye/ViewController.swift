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
    private var currentValue: Int = 50
    private var targetValue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
    }
    
    private func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        targetValueLabel.text = "Put the bulls eye as close as you can to: \(targetValue)"
    }
    
    @IBAction func didSelectHitMe(_ sender: Any) {
        let message = "The value of the slider is: \(currentValue)" +
        "\nThe target value is: \(targetValue)"
        
        let alert = UIAlertController(
            title: "Hello, World",
            message: message,    // changed
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "OK",          // changed
            style: .default,
            handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
}

