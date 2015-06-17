//
//  CreateAccountViewController.swift
//  LoginProject
//
//  Created by Nicholai de Guzman on 6/16/15.
//  Copyright (c) 2015 Nic. All rights reserved.
//

import UIKit

protocol CreateAccountViewControllerDelegate {
    func accountCreated()
}

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var chooseUsernameTextField: UITextField!
    
    @IBOutlet weak var choosePasswordTextField: UITextField!
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    //this is an optional
    var delegate:CreateAccountViewControllerDelegate?
    
    
    let kUserNameKey = "userNameKey" //k for constant
    let kPasswordKey = "passwordKey"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createAccountButtonPressed(sender: UIButton) {
        
        if choosePasswordTextField.text == confirmPasswordTextField.text &&
        choosePasswordTextField.text != nil {
            //using NSUserDefault to store password, but this is not the recommend way due to security
            //CoreData is better, but this is just to introduce us
            NSUserDefaults.standardUserDefaults().setObject(self.chooseUsernameTextField, forKey: kUserNameKey)
            NSUserDefaults.standardUserDefaults().setObject(self.choosePasswordTextField, forKey: kPasswordKey)
            
            self.dismissViewControllerAnimated(true, completion: nil)
            
            delegate?.accountCreated()
        }
        
    }
    
    
    @IBAction func cancelButtonPressed(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
