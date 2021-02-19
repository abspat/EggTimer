//
//  ViewController.swift
//  EggTimer
//
//  Created by Riddhi Patel on 2/18/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var labelOutput: UILabel!
    
    var eggTimes = ["Soft": 3, "Medium":5, "Hard":10]
    
    var timer = Timer()
    var startTime = 0
    var totalTime = 0
   
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        timer.invalidate()
        startTime = 0
        
        let hardness = sender.currentTitle!
        progressView.progress = 0.0
        
        totalTime = eggTimes[hardness]!
        
        labelOutput.text = hardness
        
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
    
     
}

    @objc func updateCounter() {
        //example functionality
        if startTime <= totalTime  {
            
            progressView.progress = Float(startTime)/Float(totalTime)
            startTime += 1
        }
        
        else {
            labelOutput.text = "Done!"
            
            timer.invalidate()
        }
        
        
        
    }
    
    
    
}

