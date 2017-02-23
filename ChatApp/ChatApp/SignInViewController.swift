//
//  ViewController.swift
//  ChatApp
//
//  Created by Mark Stephenson on 20/02/2017.
//  Copyright © 2017 Mark Stephenson. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var signInButton: UIButton!

    @IBAction func signInButtonAction(_ sender: Any) {
        if username.text != "" {
            performSegue(withIdentifier: "signInSegue", sender: self)
            defaults.set(username.text!, forKey: "username")
        } else {
            let alertController = UIAlertController(title: "Error", message: "Please enter a username before proceeding", preferredStyle: UIAlertControllerStyle.alert)
            
            let cancelAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel) {
                (result: UIAlertAction) -> Void in
            }
            
            alertController.addAction(cancelAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
}

