//
//  FavpuriteButton.swift
//  AssignmentLenskart
//
//  Created by SHAILENDRA KUSHWAHA on 27/02/22.
//

import Foundation
import UIKit

class FavouriteButton : UIButton {
    
    private var heartIcon = UIImage(named: "heart")?.withRenderingMode(.alwaysTemplate)
    private var heartFilledIcon = UIImage(named: "heart_fill")?.withRenderingMode(.alwaysTemplate)
    
    private var tapped : Bool = false {
        didSet{
            changeState()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.tintColor = .red
        self.setImage(heartIcon, for:.normal)
//        self.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
//    @objc private func buttonTapped(){
//        self.tapped.toggle()
//    }
    
    private func changeState(){
        
        if tapped {
            self.setImage(heartFilledIcon, for: .normal)
        } else {
            self.setImage(heartIcon, for:.normal)
        }
    }
    
    public func setButton(active:Bool){
        self.tapped = active
    }
}
