//
//  AppDelegate.swift
//  AssignmentLenskart
//
//  Created by SHAILENDRA KUSHWAHA on 26/02/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navigationController = AppNavigationBar(rootViewController:MovieListVC())
//        navigationController.isNavigationBarHidden = true
        navigationController.title = "List"
               
       window = UIWindow.init(frame: UIScreen.main.bounds)
       window?.rootViewController = navigationController
       window?.makeKeyAndVisible()
        return true
    }

}

