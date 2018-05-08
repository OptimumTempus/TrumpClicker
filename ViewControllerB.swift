//
//  ViewControllerB.swift
//  KellyBennett_MultiplePages
//
//  Created by student on 3/20/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit

class ViewControllerB: UIViewController {


    
    @IBOutlet weak var txt1: UILabel!
    @IBOutlet weak var lblBrickTotal: UILabel!
    @IBOutlet weak var lblBricksPerSecond: UILabel!
    
    @IBOutlet weak var lblBPC: UILabel!
    
    
    let user = User.sharedInstance
    let userDefaults = UserDefaults.standard
    
    var brickValue = 0
    var bricksPerSecond = 0
    var bricksPerClick = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let token = userDefaults.string(forKey: "Key")
        brickValue = Int(token!)!
        lblBrickTotal.text = "Brick Total: " + String(brickValue)
        
        let clickToken = userDefaults.string(forKey: "Clicks")
        lblBricksPerSecond.text = "Bricks Per Second: " + clickToken!
        bricksPerSecond = Int(clickToken!)!
        
        let TokenK = userDefaults.string(forKey: "ClickValue")
        bricksPerClick = Int(TokenK!)!
        lblBPC.text = "Bricks Per Click: " + TokenK!
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func changeText()
    {
        let token = userDefaults.string(forKey: "Key")
        brickValue = Int(token!)!
        lblBrickTotal?.text = "Brick Total: " + String(brickValue)
        
        let clickToken = userDefaults.string(forKey: "Clicks")
        bricksPerSecond = Int(clickToken!)!
        lblBricksPerSecond?.text = "Bricks Per Second: " + String(bricksPerSecond)
        
        let Tokenw = userDefaults.string(forKey: "ClickValue")
        bricksPerClick = Int(Tokenw!)!
        lblBPC?.text = "Bricks Per Click: " + String(bricksPerClick)

       
    }
  
    
    @IBAction func btnBuy200(_ sender: Any)
    {
        let vc_A = user.viewControllers[0] as! ViewControllerA
        if vc_A.value >= 10000
        {
            vc_A.value -= 10000
            displayAlert(msgTitle: "Success!", msgContent: "You bought one of this item!")
            userDefaults.set(vc_A.value, forKey: "Key")
            userDefaults.synchronize()
            vc_A.clickPerSec+=20
            vc_A.lblClickPerSec.text = "Bricks Per Second: " + String(vc_A.clickPerSec)
            userDefaults.set(vc_A.clickPerSec, forKey: "Clicks")
            userDefaults.synchronize()
        }
        else
        {
            displayAlert(msgTitle: "Not Enough Bricks!", msgContent: "You don't have enough bricks to buy this item!")
            
        }
    }
    

    @IBAction func btnBPC50(_ sender: Any) {
        let vc_A = user.viewControllers[0] as! ViewControllerA
        if vc_A.value >= 500
        {
            vc_A.value -= 500
            vc_A.clickValue += 50
            
            
            userDefaults.set(vc_A.value, forKey: "Key")
            userDefaults.set(vc_A.clickValue, forKey: "ClickValue")
            userDefaults.synchronize()
            lblBPC.text = "Bricks Per Click: " + String(vc_A.clickValue)
            displayAlert(msgTitle: "Success!", msgContent: "Now you too can feel the Dragon Energy!")
        }
        else
        {
            displayAlert(msgTitle: "Not Enough Bricks!", msgContent: "You don't have enough bricks!")
            
        }
    }
    
    @IBAction func btnBPC20(_ sender: Any)
    {
        let vc_A = user.viewControllers[0] as! ViewControllerA
        if vc_A.value >= 150
        {
            vc_A.value -= 150
            vc_A.clickValue += 25
            
            
            userDefaults.set(vc_A.value, forKey: "Key")
            userDefaults.set(vc_A.clickValue, forKey: "ClickValue")
            userDefaults.synchronize()
            lblBPC.text = "Bricks Per Click: " + String(vc_A.clickValue)
            displayAlert(msgTitle: "Success!", msgContent: "You bought one of this item!")
        }
        else
        {
            displayAlert(msgTitle: "Not Enough Bricks!", msgContent: "You don't have enough bricks to buy this item!")
            
        }
    }
    
    
    @IBAction func btnBPC10(_ sender: Any)
    {
        let vc_A = user.viewControllers[0] as! ViewControllerA
        if vc_A.value >= 95
        {
            vc_A.value -= 95
            vc_A.clickValue += 10
            
            
            userDefaults.set(vc_A.value, forKey: "Key")
            userDefaults.set(vc_A.clickValue, forKey: "ClickValue")
            userDefaults.synchronize()
            lblBPC.text = "Bricks Per Click: " + String(vc_A.clickValue)
            displayAlert(msgTitle: "Success!", msgContent: "You bought one of this item!")
        }
        else
        {
            displayAlert(msgTitle: "Not Enough Bricks!", msgContent: "You don't have enough bricks to buy this item!")
            
        }
    }
    
    
    @IBAction func btnBPC1(_ sender: Any)
    {
        let vc_A = user.viewControllers[0] as! ViewControllerA
        if vc_A.value >= 10
        {
            vc_A.value -= 10
            vc_A.clickValue += 1
 
            
            userDefaults.set(vc_A.value, forKey: "Key")
            userDefaults.set(vc_A.clickValue, forKey: "ClickValue")
            userDefaults.synchronize()
            lblBPC.text = "Bricks Per Click: " + String(vc_A.clickValue)
           displayAlert(msgTitle: "Success!", msgContent: "You bought one of this item!")
        }
        else
        {
            displayAlert(msgTitle: "Not Enough Bricks!", msgContent: "You don't have enough bricks to buy this item!")
            
        }
    }
    
    
    
    @IBAction func btnBuy10(_ sender: Any)
    {
        let vc_A = user.viewControllers[0] as! ViewControllerA
        if vc_A.value >= 1000
        {
            vc_A.value -= 1000
            displayAlert(msgTitle: "Success!", msgContent: "You bought one of this item!")
            userDefaults.set(vc_A.value, forKey: "Key")
            userDefaults.synchronize()
            vc_A.clickPerSec+=10
            vc_A.lblClickPerSec.text = "Clicks Per Second: " + String(vc_A.clickPerSec)
            userDefaults.set(vc_A.clickPerSec, forKey: "Clicks")
            userDefaults.synchronize()
        }
        else
        {
            displayAlert(msgTitle: "Not Enough Bricks!", msgContent: "You don't have enough bricks to buy this item!")
            
        }
    }
    
    @IBAction func btnBuyFive(_ sender: Any)
    {
        let vc_A = user.viewControllers[0] as! ViewControllerA
        if vc_A.value >= 100
        {
            vc_A.value -= 100
            displayAlert(msgTitle: "Success!", msgContent: "You bought one of this item!")
            userDefaults.set(vc_A.value, forKey: "Key")
            userDefaults.synchronize()
            vc_A.clickPerSec+=5
            vc_A.lblClickPerSec.text = "Clicks Per Second: " + String(vc_A.clickPerSec)
            userDefaults.set(vc_A.clickPerSec, forKey: "Clicks")
            userDefaults.synchronize()
        }
        else
        {
            displayAlert(msgTitle: "Not Enough Bricks!", msgContent: "You don't have enough bricks to buy this item!")
            
        }
    }
    
    
    @IBAction func buy1(_ sender: Any)
     {
    
        let vc_A = user.viewControllers[0] as! ViewControllerA
        if vc_A.value >= 25
        {
            vc_A.value -= 25
            displayAlert(msgTitle: "Success!", msgContent: "You bought one of this item!")
            userDefaults.set(vc_A.value, forKey: "Key")
            userDefaults.synchronize()
        vc_A.clickPerSec+=1
        vc_A.lblClickPerSec.text = "Clicks Per Second: " + String(vc_A.clickPerSec)
        userDefaults.set(vc_A.clickPerSec, forKey: "Clicks")
        userDefaults.synchronize()
        }
        else
        {
            displayAlert(msgTitle: "Not Enough Bricks!", msgContent: "You don't have enough bricks to buy this item!")
            
        }
        
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
