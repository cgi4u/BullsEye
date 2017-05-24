//
//  ViewController.swift
//  BullsEye
//
//  Created by 최광익 on 2017. 5. 22..
//  Copyright © 2017년 최광익. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentVal = 50
    var targetValue = 0
    var score = 0
    var round = 0
   
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startNewRound()
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert(){
        let difference = abs(targetValue - currentVal)
        var points = 100 - difference
        score += points
        
        let title:String
        if difference >= 10{
            title = "Not even close..."
        }
        else if difference >= 5{
            title = "Pretty good!"
        }
        else if difference > 0{
            title = "You almost had it!"
            points += 50
        }
        else{
            title = "Perfect!"
            points += 100
        }
        
        let message = "You scored \(points) points"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default,
                                   handler: { action in self.startNewRound()
                                                        self.updateLabels()
                                            })
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func startOver(){
        round = 1
        score = 0
        currentVal = 50
        slider.value = Float(currentVal)
        targetValue = 1 + Int(arc4random_uniform(100))
        updateLabels()
    }
    
    func startNewRound(){
        round += 1
        currentVal = 50
        slider.value = Float(currentVal)
        targetValue = 1 + Int(arc4random_uniform(100))
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        currentVal = lroundf(slider.value)
        print("The value of the slider is now: \(currentVal)")
    }
}

