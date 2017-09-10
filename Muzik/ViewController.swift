//
//  ViewController.swift
//  Muzik
//
//  Created by Ainor Syahrizal on 10/09/2017.
//  Copyright © 2017 Ainor Syahrizal. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    
    let audioPath = Bundle.main.path(forResource: "paws", ofType: "mp3")
    
    var slider = UISlider()
    
    var timer = Timer()
    

    @IBAction func pause(_ sender: Any) {
        player.pause()
        timer.invalidate()
    }
    
    
    func updateTracker() {
        
        trackSlider.value = Float(player.currentTime)
        
    }
    
    
    @IBAction func play(_ sender: Any) {
        
        player.play()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateTracker), userInfo: nil, repeats: true)
        
    }
    
    
    
    @IBAction func stop(_ sender: Any) {
     
        
        timer.invalidate()
        player.pause()
        
        trackSlider.value = 0

        
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            
             } catch {
            print(error)
        }

    }
    @IBOutlet weak var volumeSlider: UISlider!
    
    @IBAction func volume(_ sender: Any) {
        
        player.volume = volumeSlider.value
    }
    
    @IBOutlet weak var trackSlider: UISlider!
    
    @IBAction func tracker(_ sender: Any) {
        
        player.currentTime = TimeInterval(trackSlider.value)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            
            trackSlider.maximumValue = Float(player.duration)
            
        } catch {
            print(error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

