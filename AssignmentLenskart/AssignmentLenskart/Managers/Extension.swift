//
//  Extension.swift
//  AssignmentLenskart
//
//  Created by SHAILENDRA KUSHWAHA on 27/02/22.
//

import Foundation
import UIKit




extension UIViewController {
    func setNavigationTitle(title: String,target:UIViewController? = nil,action:Selector? = nil)
    {
        let width = self.view.frame.size.width - 100
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 35))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: target, action: action))
        
        let titleLabel = UILabel.init(frame: CGRect(x: -18, y: 0, width: width, height: 35))
        titleLabel.textColor = .black
        titleLabel.text = title
        titleLabel.textAlignment = .left
        titleLabel.backgroundColor = .clear
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        view.addSubview(titleLabel)
        self.navigationItem.titleView = view
//        self.navigationItem.titleView?.frame.origin.x -= 20
    }
}

extension UIImageView {
    
    func setImageViaURL(url:String){
        self.image = nil
        
        if let image = imageCache.object(forKey: url as NSString) {
            self.image = image
            return
        }
        
        guard let url = URL(string: url)else {
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: {[weak self]data,response,error in
            
            if let data = data{
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        imageCache.setObject(image, forKey: url.absoluteString as NSString )
                        self?.image = image
                    }
                    
                } else {
                    self?.image = nil
                }
            }
        }).resume()
    }
}
