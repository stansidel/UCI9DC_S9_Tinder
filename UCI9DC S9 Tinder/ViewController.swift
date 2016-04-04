//
//  ViewController.swift
//  UCI9DC S9 Tinder
//
//  Created by Stanislav Sidelnikov on 26/03/16.
//  Copyright © 2016 Stanislav Sidelnikov. All rights reserved.
//

import UIKit
import Parse
import ParseFacebookUtils

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let permissions = ["public_profile"]
        PFFacebookUtils.logInWithPermissionsInBackground(permissions).continueWithBlock { (task) -> AnyObject? in
            if let error = task.error {
                print("Error logging user in: \(error.localizedDescription)")
            } else {
                print("Current user: \(PFUser.currentUser())")
                if let user = task.result as? PFUser {
                    print(user)
                } else {
                    print("Unable to log user in with Facebook. Completed: \(task.completed). Result is not converible to PFUser: \(task.result)")
                }
            }
            return nil
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

