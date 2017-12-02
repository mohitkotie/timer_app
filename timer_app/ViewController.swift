//
//  ViewController.swift
//  timer_app
//
//  Created by mohit kotie on 24/09/17.
//  Copyright © 2017 mohit kotie mohit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TimerLabel: UILabel!
    
    @IBOutlet weak var TimerButtonLabel: UIButton!
    var time = 0
    var timer = Timer()
    
    var state = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func TimerButtonTapped(_ sender: Any) {
        
        if state{
            state = false
            TimerButtonLabel.setTitle("Pause", for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(AddTime), userInfo: nil, repeats: true)
        }
        else{
            state = true
            TimerButtonLabel.setTitle("Start", for: .normal)
            timer.invalidate()
        }
        
        
    }
    
    @IBAction func SubtractTen(_ sender: Any) {
        
        if (time >= 10){
            
            time = time - 10
            TimerLabel.text = String(time)
        }
        
    }
    
    @IBAction func AddTen(_ sender: Any) {
        
        time = time + 10
        TimerLabel.text = String(time)
    }
    
    @IBAction func pause(_ sender: Any) {
        timer.invalidate()
        TimerLabel.text = "0"
        state = true
        TimerButtonLabel.setTitle("Start", for: .normal)
    }
    
    @objc func AddTime(){
        
        time = time + 1
        TimerLabel.text = "\(time)"
    
        
    }
    
    
    
}

