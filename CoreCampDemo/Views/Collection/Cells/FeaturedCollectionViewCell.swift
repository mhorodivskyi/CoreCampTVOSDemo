//
//  FeaturedCollectionViewCell.swift
//  CoreCampDemo
//
//  Created by Maksym Horodivskyi on 12/6/19.
//  Copyright © 2019 CoreValue. All rights reserved.
//

import UIKit
import Kingfisher

class FeaturedCollectionViewCell: BaseCollectionViewCell<VideoModel> {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var overlayView: UIView!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var infoBottomConstraint : NSLayoutConstraint!
    
    private weak var maskingView: UIView!
    private let focusScale = CGFloat(1.1)
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        if isFocused {
            coordinator.addCoordinatedFocusingAnimations({
                [unowned self] _ in self.updateAppearance() }, completion: nil)
        } else {
            coordinator.addCoordinatedUnfocusingAnimations({
                [unowned self] _ in self.updateAppearance() }, completion: nil)
        }
    }
    
    private func updateAppearance() {
        overlayView.alpha = isFocused ? 0 : 1
        infoView.alpha = isFocused ? 1 : 0
        
        transform3D = isFocused ? CATransform3DIdentity.withScale(by: focusScale) : CATransform3DIdentity
        
        infoBottomConstraint.constant = isFocused ? 0 : -infoView.bounds.height + 180
        updateMaskingView()
        layoutIfNeeded()
    }
    
    func updateMaskingView() {
        maskingView.frame = isFocused ? bounds : bounds.inset(by: UIEdgeInsets(top: 0, left: 70, bottom: 0, right: 70))
    }
    
    override func layoutSubviews() {
        updateMaskingView()
    }
    
    override func didHintFocusMovement(_ hint: UIFocusMovementHint) {
//        transform3D = hint.interactionTransform.withScale(by: focusScale)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
        updateAppearance()
        mask = maskingView
    }
    
    private func configureAppearance() {
        let maskingView = UIView(frame: bounds)
        maskingView.backgroundColor = .white
        maskingView.layer.cornerRadius = 30
        maskingView.layer.masksToBounds = true
        
        mask = maskingView
        self.maskingView = maskingView
    }
    
    override func fill(with model: VideoModel?) {
        imageView.kf.setImage(with: model?.imageUrl)
        titleLabel.text = model?.title
        descriptionLabel.text = model?.descriprion
    }
    
    override func prepareForReuse() {
        imageView.kf.cancelDownloadTask()
        imageView.image = nil
    }
}


