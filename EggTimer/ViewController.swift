//
//  ViewController.swift
//  EggTimer
//
//  Created by Riddhi Patel on 2/18/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var labelOutput: UILabel!
    
    var player: AVAudioPlayer?
    
    var eggTimes = ["Soft": 3, "Medium":5, "Hard":10]
    
    var timer = Timer()
    var startTime = 0
    var totalTime = 0
   
    func play() {
        guard let url = Bundle.main.url(forResource: "beep", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
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
            
            play()
        }
        
        
        
    }
    
    
    
}

