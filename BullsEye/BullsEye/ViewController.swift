//
//  ViewController.swift
//  BullsEye
//
//  Created by Tammy Treit on 6/4/19.
//  Copyright © 2019 MammothSound. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //define instance variables
    var currentSliderPosition: Int = 0
    var targetValue: Int = 0
    var currentScore: Int = 0
    var totalScore: Int = 0
    let scoreBonus: Int = 100
    var roundNumber: Int = 0
    
    @IBOutlet weak var slider2: UISlider!
    @IBOutlet weak var targetValueLabel: UILabel!
    @IBOutlet weak var totalScoreLabel: UILabel!
    @IBOutlet weak var roundNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentSliderPosition = Int(slider2.value)
        totalScoreLabel.text = String(currentScore)
        startRound()
    }

    @IBAction func showAlert() {
        calculateScore()
        
        var title = "Score"
        
        if currentScore < 75 {
            title = "Your Aim Needs Work..."
        } else if currentScore > 199 {
                title = "BULLSEYE!"
        } else if  currentScore > 96 {
            title = "So Close!"
        }
        
        let message = "Score: \(currentScore)"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: {
            action in
            self.startRound()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func sliderMoved(_ slider1: UISlider) {
        let roundedValue = slider1.value.rounded()
        print (slider1.value)
        currentSliderPosition = Int(roundedValue)
        print (currentSliderPosition)
    }
    
    func startRound() {
        setRoundNumber()
        setTarget()
        sliderHandler()
    }

    func setRoundNumber() {
        roundNumber += 1
        roundNumberLabel.text = String(roundNumber)
        
    }
    
    func setTarget() {
        targetValue = Int.random(in: 1...100)
        targetValueLabel.text = String(targetValue)
    }
    
    func sliderHandler() {
        currentSliderPosition = 50
        slider2.value = Float(currentSliderPosition)
    }
    
    func calculateScore() {
        var difference: Int
        difference = currentSliderPosition - targetValue
        if difference < 0 {
            difference = difference * -1
        }
        currentScore = 100 - difference
        if currentScore == 100 {
            currentScore = currentScore + scoreBonus //bonus for hitting it exactly
        } else if currentScore == 99 {
            currentScore = currentScore + (scoreBonus/2) + 1
        }
        totalScore = totalScore + currentScore
        totalScoreLabel.text = String(totalScore)
        }
    
    func startOver() {
        currentScore = 0
        roundNumber = 0
    }
    
}

