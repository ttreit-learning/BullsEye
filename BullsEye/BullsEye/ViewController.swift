//
//  ViewController.swift
//  BullsEye
//
//  Created by Tammy Treit on 6/4/19.
//  Copyright © 2019 MammothSound. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentSliderPosition: Int = 0
    var targetValue = 0
    
    @IBOutlet weak var slider2: UISlider!
    @IBOutlet weak var target: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentSliderPosition = Int(slider2.value)
        startNewRound()
    }

    @IBAction func showAlert() {
        let message = "You hit \(currentSliderPosition)" + "\nYour target was \(targetValue)"
        let alert = UIAlertController(title: "Bull's Eye", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        startNewRound()
        
    }
    
    @IBAction func sliderMoved(_ slider1: UISlider) {
        print("Slider is at \(slider1.value)")
        let roundedValue = slider1.value.rounded()
        print("Rounded slider is at \(roundedValue)")
        currentSliderPosition = Int(roundedValue)
        
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentSliderPosition = 50
        slider2.value = Float(currentSliderPosition)
        target.text = String(targetValue)
    }
    
}

