//
//  TabViewController.swift
//  CoreCampDemo
//
//  Created by Maksym Horodivskyi on 12/14/19.
//  Copyright © 2019 CoreValue. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    let kLastSelectedTabKey = "kLastSelectedTabKey"
    
    override func viewDidLoad() {
        selectedIndex = UserDefaults.standard.integer(forKey: kLastSelectedTabKey)
        delegate = self
    }
}

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        UserDefaults.standard.set(tabBarController.selectedIndex, forKey: kLastSelectedTabKey)
    }
}

