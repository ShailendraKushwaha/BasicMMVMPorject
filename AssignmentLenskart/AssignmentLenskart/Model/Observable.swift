//
//  Observable.swift
//  AssignmentLenskart
//
//  Created by SHAILENDRA KUSHWAHA on 28/02/22.
//

import Foundation

//MARK: using Box Bindings for view model Binding, Eliminating delegate pattern and KVO in this case.

class Observable<T> {
    
    var value : T? {
        didSet {
           listener?(value)
        }
    }
    
    init(_ value : T?){
        self.value = value
    }
    
    private var listener: ((T?) -> Void)?
    
    func bind(_ listener: @escaping ((T?) -> Void)){
        listener(value)
        self.listener = listener
    }
}
