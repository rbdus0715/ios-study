//
//  ViewController.swift
//  TabBarController
//
//  Created by gyuyeon jo on 9/5/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonMoveImageView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }

    @IBAction func buttonMoveDatePickerView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
}

