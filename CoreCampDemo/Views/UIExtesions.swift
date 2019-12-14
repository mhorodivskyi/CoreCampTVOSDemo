//
//  UIExtesions.swift
//  CoreCampDemo
//
//  Created by Maksym Horodivskyi on 12/12/19.
//  Copyright © 2019 CoreValue. All rights reserved.
//

import UIKit

extension UIViewController {
    class var identifier: String {
        return String(describing: self)
    }
}

extension UIStoryboard {
    func instatinateViewController<T: UIViewController>(forType type: T.Type) -> T {
        return self.instantiateViewController(withIdentifier: type.identifier) as! T
    }
}

extension UIView {
    func setEqualConstraints(forChildView childView: Any) {
        self.addConstraints([
            NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: childView, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: childView, attribute: .centerY, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: childView, attribute: .width, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: childView, attribute: .height, multiplier: 1, constant: 0)
            ])
    }
}
