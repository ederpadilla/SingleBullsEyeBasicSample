//
//  ViewController.swift
//  Bull’s Eye
//
//  Created by Eder  Padilla on 29/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    private var currentValue: Int = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didSelectHitMe(_ sender: Any) {
        let message = "The value of the slider is: \(currentValue)"
        
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
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
}

