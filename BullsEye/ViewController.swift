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
   
    @IBOutlet weak var slider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert(){
        let message = "The value of the slider is: \(currentVal)"
        let alert = UIAlertController(title: "Hello World", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

    @IBAction func sliderMoved(_ slider: UISlider){
        currentVal = lroundf(slider.value)
        print("The value of the slider is now: \(currentVal)")
    }
    
}

