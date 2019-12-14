//
//  VideoCollectionViewCell.swift
//  CoreCampDemo
//
//  Created by Maksym Horodivskyi on 12/6/19.
//  Copyright © 2019 CoreValue. All rights reserved.
//

import UIKit
import Kingfisher

class VideoCollectionViewCell: BaseCollectionViewCell<VideoModel> {
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    private var timeView: UIView!
    private var timeLabel: UILabel!
    
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
//        titleLabel.transform = isFocused ? CGAffineTransform.init(translationX: 0, y: 30).scaledBy(x: 1.1, y: 1.1) : .identity
//        titleLabel.alpha = isFocused ? 1 : 0.6
//        timeView.alpha = isFocused ? 1 : 0
    }
    
    override func fill(with model: VideoModel?) {
        posterImageView.kf.setImage(with: model?.imageUrl)
        titleLabel.text = model?.title
        timeLabel.text = model?.durationString
    }
    
    override func prepareForReuse() {
        posterImageView.kf.cancelDownloadTask()
        posterImageView.image = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
        updateAppearance()
    }
    
    private func configureAppearance() {
        let view = posterImageView!.overlayContentView
        
        let timeView = UIView(frame: .zero)
        timeView.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        timeView.translatesAutoresizingMaskIntoConstraints = false
        timeView.layer.cornerRadius = 4
        timeView.layer.masksToBounds = true
        timeView.alpha = 0
        
        let timeLabel = UILabel(frame: .zero)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.font = .systemFont(ofSize: 20, weight: .medium)
        timeLabel.textColor = .white
        timeView.addSubview(timeLabel)
        
        view.addSubview(timeView)
        
        [
            timeLabel.centerYAnchor.constraint(equalTo: timeView.centerYAnchor),
            timeLabel.centerXAnchor.constraint(equalTo: timeView.centerXAnchor),
            timeLabel.leadingAnchor.constraint(equalTo: timeView.leadingAnchor, constant: 7),
            timeLabel.topAnchor.constraint(equalTo: timeView.topAnchor, constant: 5),
            view.trailingAnchor.constraint(equalTo: timeView.trailingAnchor, constant: 20),
            view.bottomAnchor.constraint(equalTo: timeView.bottomAnchor, constant: 20)
            ].forEach{ $0.isActive = true }
        
        self.timeLabel = timeLabel
        self.timeView = timeView
    }
}
