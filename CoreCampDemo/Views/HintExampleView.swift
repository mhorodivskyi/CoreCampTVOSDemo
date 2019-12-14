//
//  HintExampleView.swift
//  CoreCampDemo
//
//  Created by Maksym Horodivskyi on 12/3/19.
//  Copyright © 2019 CoreValue. All rights reserved.
//

import UIKit

class HintExampleView: UIView {
    override var canBecomeFocused: Bool { return true }

    override var backgroundColor: UIColor? {
        get { return realBgColor }
        set {
            realBgColor = newValue
            super.backgroundColor = newValue
        }
    }
    
    private var realBgColor: UIColor?
    private let focusedScale = CGFloat(1.1)
    
    override func didHintFocusMovement(_ hint: UIFocusMovementHint) {
        transform3D = hint.interactionTransform.withScale(by: focusedScale)
        
        super.backgroundColor = getHintedColor(from: realBgColor, withOffset: hint.movementDirection)
    }
    
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        if isFocused {
            coordinator.addCoordinatedFocusingAnimations({ [unowned self] _ in
                self.transform3D.scaled(by: self.focusedScale)
                }, completion: nil)
        } else {
            coordinator.addCoordinatedUnfocusingAnimations({ [unowned self] _ in
                self.transform = .identity
                }, completion: nil)
        }
    }
    
    
    private func getHintedColor(from color: UIColor?, withOffset offset: CGVector) -> UIColor {
        
        func fixValueRange(_ value: inout CGFloat) {
            value = min(value, 1)
            value = max(value, 0)
        }
        
        var red = CGFloat(0)
        var green = CGFloat(0)
        var blue = CGFloat(0)
        var alpha = CGFloat(0)
        
        color?.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        red += offset.dx * 2 // 20
        blue -= offset.dx * 2 // 5
        green += offset.dx * offset.dy
        
        fixValueRange(&red)
        fixValueRange(&blue)
        fixValueRange(&green)
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    private func configureStyle() {
        layer.cornerRadius = 10
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

extension CATransform3D {
    func withScale(by scale: CGFloat) -> CATransform3D {
        return CATransform3DScale(self, scale, scale, scale)
    }
    
    mutating func scaled(by scale: CGFloat) {
        self = self.withScale(by: scale)
    }
}
