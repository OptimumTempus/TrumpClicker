//
//  ViewControllerC.swift
//  KellyBennett_MultiplePages
//
//  Created by student on 3/20/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit
import AVFoundation

class ViewControllerC: UIViewController {

    @IBOutlet weak var cleardata: UIButton!
    let user = User.sharedInstance
    let userDefaults = UserDefaults.standard
    var player:AVAudioPlayer!
    var achievements = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        let achievementToken = userDefaults.string(forKey: "Achievements")
        if(achievementToken != nil)
        {
            achievements = Int(achievementToken!)!
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func checkAchievements(){
        let vc_A = user.viewControllers[0] as! ViewControllerA
        achievements = Int(userDefaults.string(forKey: "Achievements")!)!
        if(vc_A.value >= 1000000 && achievements == 01)
        {
            displayAlert(msgTitle: "Achievement", msgContent: "There's That Small Loan")
            let path = Bundle.main.path(forResource: "A Small Loan Of A Million Dollars  Sound Effect", ofType: "mp3")
            do {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!))
                player.play()
            } catch {
                print("Could not load file")
            }
            achievements += 10
            userDefaults.set(11, forKey: "Achievements")
        }
        if(vc_A.value >= 1 && achievements == 00)
        {
            let path = Bundle.main.path(forResource: "trump_im_really_rich", ofType: "mp3")
            do {
                displayAlert(msgTitle: "Achievement ", msgContent: "Keep Building That Wall")
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!))
                player.play()
            } catch {
                print("Could not load file")
            }
            achievements += 1
            userDefaults.set(01, forKey: "Achievements")
        }
        
    }
 
    
    @IBAction func btnClearData(_ sender: Any)
    {
        let vc_A = user.viewControllers[0] as! ViewControllerA
        let vc_B = user.viewControllers[1] as! ViewControllerB
        
        userDefaults.set(0, forKey: "Key")
        userDefaults.set(0, forKey: "Time")
        userDefaults.set(0, forKey: "Clicks")
        userDefaults.set(1, forKey: "ClickValue")
        userDefaults.set(00, forKey: "Achievements")
        achievements = 0
        vc_A.timeValue = 0
        vc_A.clickPerSec = 0
        vc_A.clickValue = 1
        vc_A.value = 0
        vc_A.numvalue = 0
        
        vc_B.brickValue = 0
        vc_B.bricksPerClick = 1
        vc_B.bricksPerSecond = 0
        
        
        
        
        displayAlert(msgTitle: "Data Reset", msgContent: "Enjoy New Game")
    }
    
    func displayAlert(msgTitle:String, msgContent:String)
    {
        let alertController = UIAlertController(title: msgTitle, message: msgContent,
                                                preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Close", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }

}
