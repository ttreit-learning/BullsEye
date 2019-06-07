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
    var targetValue: Int = 0
    var currentScore: Int = 0
    var totalScore: Int = 0
    var scoreBonus: Int = 100
    
    
    @IBOutlet weak var slider2: UISlider!
    @IBOutlet weak var targetValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentSliderPosition = Int(slider2.value)
        startRound()
    }

    @IBAction func showAlert() {
        calculateCurrentScore()
        let message = "You hit \(currentSliderPosition) \nYour target was \(targetValue). \nYour score this round was \(currentScore)"
        
        let alert = UIAlertController(title: "Bull's Eye", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        startRound()
        
    }
    
    @IBAction func sliderMoved(_ slider1: UISlider) {
        print("Slider is at \(slider1.value)")
        let roundedValue = slider1.value.rounded()
        print("Rounded slider is at \(roundedValue)")
        currentSliderPosition = Int(roundedValue)
    }
    
    func startRound() {
        setTarget()
        sliderHandler()
    }

    func setTarget() {
        targetValue = Int.random(in: 1...100)
        targetValueLabel.text = String(targetValue)
    }
    
    func sliderHandler() {
        currentSliderPosition = 50
        slider2.value = Float(currentSliderPosition)
    }
    
    func calculateCurrentScore() {
        var difference: Int
        difference = currentSliderPosition - targetValue
        if difference < 0 {
            difference = difference * -1
        }
        currentScore = 100 - difference
        if currentScore == 100 {
            currentScore = 100 + scoreBonus
        }
        totalScore = totalScore + currentScore
        }
        
        
        //if currentSliderPosition > targetValue {
          //  currentScore = 100 - (currentSliderPosition - targetValue)
        //} else if currentSliderPosition < targetValue {
          //  currentScore = 100 - (targetValue - currentSliderPosition)
        //} else {
          //  currentScore = 200
    
    
}

