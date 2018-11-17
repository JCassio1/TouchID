//
//  ViewController.swift
//  TouchID
//
//  Created by MR.Robot 💀 on 17/11/2018.
//  Copyright © 2018 Joselson Dias. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    @IBAction func IDAction(_ sender: Any)
    {
        let context: LAContext = LAContext()
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        {
            context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Please verify your ID") { (wasSuccessful, error) in
                if wasSuccessful{
                    print("Success")
                }
                
                else{
                    let alert = UIAlertController(title: "Error Authenticating", message: "Unable to authenticate", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                        NSLog("The \"OK\" alert occured.")
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
        
        else{
            print("Execute another code because this device does not have touch/face ID")
        }
    }
}

