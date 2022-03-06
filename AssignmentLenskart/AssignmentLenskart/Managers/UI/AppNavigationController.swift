//
//  AppNavigationController.swift
//  AssignmentLenskart
//
//  Created by SHAILENDRA KUSHWAHA on 27/02/22.
//

import Foundation
import UIKit

class AppNavigationBar : UINavigationController {
    
    override class func awakeFromNib() {
    }
    
    override func viewDidLoad() {
        
        self.navigationBar.backgroundColor = .white
        self.navigationBar.isTranslucent = false
        self.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        
        self.navigationBar.tintColor = #colorLiteral(red: 1, green: 0.99997437, blue: 0.9999912977, alpha: 1)
    
        self.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationBar.shadowImage = UIImage()
        
        if #available(iOS 15.0, *) {

            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .white
            appearance.shadowColor     = .clear
            appearance.shadowImage     = UIImage()
            navigationBar.standardAppearance = appearance
            navigationBar.scrollEdgeAppearance = navigationBar.standardAppearance
        }
        
        self.navigationBar.layoutIfNeeded()
    }
}

