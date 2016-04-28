//
//  FirstViewController.swift
//  iKid
//
//  Created by ishansaksena on 4/26/16.
//  Copyright © 2016 ishansaksena. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Read in jokes
        let jokes = GetJokes()
        jokes.readJokes()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

