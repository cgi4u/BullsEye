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
    
    //@IBOutlet weak var targetLabel: UILabel!
    //@IBOutlet weak var scoreLabel: UILabel!
    //@IBOutlet weak var roundLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startNewRound()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert(){
        let message = "The value of the slider is: \(currentVal)" + "\nThe target value is: \(targetValue)"
        let alert = UIAlertController(title: "Hello World", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        startNewRound()
    }
    func startNewRound(){
        round += 1
        currentVal = 50
        slider.value = Float(currentVal)
        targetValue = 1 + Int(arc4random_uniform(100))
    }
    
    /*
    func updateLabels(){
        
    }*/
    
    @IBAction func sliderMoved(_ slider: UISlider){
        currentVal = lroundf(slider.value)
        print("The value of the slider is now: \(currentVal)")
    }
}

