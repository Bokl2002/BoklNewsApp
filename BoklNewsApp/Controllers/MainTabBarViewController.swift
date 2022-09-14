//
//  MainTabBarViewController.swift
//  BoklNewsApp
//
//  Created by Abdullah Elbokl on 12/09/2022.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    @IBOutlet weak var tabBarButtons: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = .label
        // Do any additional setup after loading the view.
    }

}
