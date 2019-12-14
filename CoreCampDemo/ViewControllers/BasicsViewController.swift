//
//  BasicsViewController.swift
//  CoreCampDemo
//
//  Created by Maksym Horodivskyi on 12/5/19.
//  Copyright © 2019 CoreValue. All rights reserved.
//

import UIKit

class BasicsViewController: UIViewController {
    
    @IBOutlet weak var b3View: BasicExampleView!
    @IBOutlet weak var b4View: BasicExampleView!
    @IBOutlet weak var b5View: BasicExampleView!
    
    @IBOutlet weak var topStackView: UIStackView!
    @IBOutlet weak var bottomStackView: UIStackView!
    
    @IBOutlet weak var focusedRowLabel: UILabel!
    @IBOutlet weak var lastFocusDirectionLabel: UILabel!
    
    override func shouldUpdateFocus(in context: UIFocusUpdateContext) -> Bool {
        
        var focusDirection: String?
        switch context.focusHeading {
        case .up:
            focusDirection = "⬆️"
        case .down:
            focusDirection = "⬇️"
        case .left:
            focusDirection = "⬅️"
        case .right:
            focusDirection = "➡️"
        default:
            focusDirection = "⏺"
        }
        
        lastFocusDirectionLabel.text = focusDirection
        
        if let previouslyFocusedItem = context.previouslyFocusedItem,
            let nextFocusedItem = context.nextFocusedItem,
            b3View.contains(previouslyFocusedItem),
            b4View.contains(nextFocusedItem) { return false }
        
        return super.shouldUpdateFocus(in: context)
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        guard let nextFocusedItem = context.nextFocusedItem else {
            return
        }
        
        var rowTitle = "None"
        if topStackView.contains(nextFocusedItem) { rowTitle = "Top" }
        else if bottomStackView.contains(nextFocusedItem) { rowTitle = "Bottom" }
        
        focusedRowLabel.text = rowTitle
    }
}
