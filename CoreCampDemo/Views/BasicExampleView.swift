//
//  BasicExampleView.swift
//  CoreCampDemo
//
//  Created by Maksym Horodivskyi on 12/5/19.
//  Copyright © 2019 CoreValue. All rights reserved.
//

import UIKit

class BasicExampleView: UIView {
    
    override var canBecomeFocused: Bool { return true }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
//        backgroundColor = isFocused ? focusColor : .clear
        
        coordinator.addCoordinatedAnimations(
            {[unowned self] in
                self.backgroundColor = self.isFocused ? self.focusColor : .clear
            }, completion: nil)
    }
    
    var focusColor: UIColor { .white }
     
    private func configureStyle() {
        layer.cornerRadius = 10
        layer.borderColor = focusColor.cgColor
        layer.borderWidth = 4
        backgroundColor = .clear
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureStyle()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureStyle()
    }
}
