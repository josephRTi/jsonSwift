//
//  SceneDelegate.swift
//  Network_Layer
//
//  Created by Егор Уваров on 27.03.2021.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: mainVC())
        
        window?.makeKeyAndVisible()
        return true
        
    }


}

