//
//  ViewControllerA.swift
//  KellyBennett_MultiplePages
//
//  Created by student on 3/20/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit
import AVFoundation
class ViewControllerA: UIViewController {


    @IBOutlet weak var btnWall: UIButton!
    @IBOutlet weak var lblCounter: UILabel!
    @IBOutlet weak var lblClickPerSec: UILabel!
    var player:AVAudioPlayer!
    //  var counter = 0
    var numvalue = 0
    let userDefaults = UserDefaults.standard
    var value = 0
    let user = User.sharedInstance
    var n = Int(arc4random_uniform(60))
    
    @IBOutlet weak var lblTimeLabel: UILabel!
    var myTimer = Timer()
    var timeValue = 0
    var isPlaying = false
    
    var clickPerSec = 0
    var clickValue = 1
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        lblTimeLabel.text = "Time: 00:00"
        
        let timeToken = userDefaults.string(forKey: "Time")
        if(timeToken != nil)
        {
        lblTimeLabel.text = "Time: " + timeToken!
        timeValue = Int(timeToken!)!
        }
        let token = userDefaults.string(forKey: "Key")
        if(token != nil)
        {
        lblCounter.text = "Brick Total: " + token!
        value = Int(token!)!
        }
        
        let clickToken = userDefaults.string(forKey: "Clicks")
        if(clickToken != nil)
        {
        lblClickPerSec.text = "Bricks Per Second: " + clickToken!
        clickPerSec = Int(clickToken!)!
        }
        
        let brickToken = userDefaults.string(forKey: "ClickValue")
        if(brickToken != nil)
        {
            //lblClickPerSec.text = "Bricks Per Second: " + brickToken!
            clickValue = Int(brickToken!)!
        }
        

        myTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector:#selector(self.updateTime),userInfo:nil, repeats:true)
        
        // Do any additional setup after loading the view.

    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @objc func updateTime()
    {
        
        
        value += clickPerSec
        timeValue += 1
        
        userDefaults.set(value, forKey: "Key")
        userDefaults.synchronize()
        userDefaults.set(timeValue, forKey: "Time")
        userDefaults.synchronize()
        
        printOut()
        print(n)
        print((Int(userDefaults.string(forKey: "Time")!)!)%60)
        if n == (Int(userDefaults.string(forKey: "Time")!)!)%60
        {
            let temp = Int(arc4random_uniform(9))
            var link = "donaldtrumpsandstorm"
            switch temp {
            case (0):
                link = "trump_saying_china"
            case (1):
                link = "Build a wall"
            case (2):
                link = "donald_trump_10"
            case (3):
                link = "donald_trump_china_1"
            case (4):
                link = "donald_trump-mexico"
            case (5):
                link = "Trump wonwe need to build a wall  sound effect"
            case (6):
                link = "trump_bing_bing_bong"
            case (7):
                link = "trump_quiet"
            case (8):
                link = "trump_im_really_rich"
            default:
                link = "Build a Wall"
            }
            let path = Bundle.main.path(forResource: link, ofType: "mp3")
            do {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!))
                player.play()
                n = Int(arc4random_uniform(60))
            } catch {
                print("Could not load file")
            }
        }
        
        let vc_C = user.viewControllers[2] as! ViewControllerC
        vc_C.checkAchievements()
        
    }
    
    
    @IBAction func btnWallAction(_ sender: Any)
    {
        value += clickValue
        
        
        userDefaults.set(value, forKey: "Key")
        userDefaults.synchronize()
        
        printOut()
        
        btnWall.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        UIView.animate(withDuration: 2.0,
                       delay: 0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 6.0,
                       options: .allowUserInteraction,
                       animations: { [weak self] in
                        self?.btnWall.transform = .identity
            },
                       completion: nil)
    }
    
    
    @IBAction func cheatAct(_ sender: Any) {
        value = 999990
    }
    @objc func printOut()
    {
        let vc_B = user.viewControllers[1] as! ViewControllerB
        lblCounter.text = "Brick Total: " + String(value)
        lblTimeLabel.text = "Time: " + String(timeValue)
        lblClickPerSec.text = "Bricks Per Second: " + String(clickPerSec)
        vc_B.changeText()
        
    }
    
}
