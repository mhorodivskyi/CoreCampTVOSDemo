//
//  PreviewPlayerView.swift
//  NBTV-tvos
//
//  Created by Maksym Horodivskyi on 1/21/19.
//  Copyright © 2019 appletv. All rights reserved.
//

import UIKit
import AVKit
import Kingfisher

class PreviewPlayerView: UIView {
    var isLooped = true
    var isMuted = true
    private(set) var isPlaying = false
    
    var didStartPreviewPlayback: (() -> Void)?
    var didStopPreviewPlayback: (() -> Void)?
    
    private weak var playerLayer: AVPlayerLayer!
    private var previewCountdownTimer: Timer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addUIComponents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addUIComponents()
    }
    
    deinit {
        resetPreview()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
    
    func fillPreview(videoUrl: URL) {
        resetPreview()
        loadVideoPreview(forUrl: videoUrl)
    }
    
    func startPreviewCountDown(withTimeInterval timeInterval: TimeInterval = 3.5) {
        previewCountdownTimer?.invalidate()
        previewCountdownTimer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: false, block: { [unowned self] (_) in
            self.seekToBeginingVideo()
            self.playPreview()
            self.didStartPreviewPlayback?()
        })
    }
    
    func seekToBeginingVideo() {
        guard let player = playerLayer.player else { return }
        DispatchQueue.main.async { [weak player] in
            player?.seek(to: .zero)
            player?.play()
        }
    }
    
    func playPreview() {
        playerLayer.player?.play()
        isPlaying = true
    }
    
    func stopPreview() {
        previewCountdownTimer?.invalidate()
        playerLayer.player?.pause()
        isPlaying = false
    }
    
    func resetPreview() {
        previewCountdownTimer?.invalidate()
        
        isPlaying = false
        
        NotificationCenter.default.removeObserver(self, name: .AVPlayerItemDidPlayToEndTime, object: nil)
        playerLayer.player = nil
    }
    
    private func addUIComponents() {
        let playerLayer = AVPlayerLayer()
        playerLayer.videoGravity = .resizeAspectFill
        playerLayer.frame = bounds
        layer.addSublayer(playerLayer)
        self.playerLayer = playerLayer
    }
    
    private func loadVideoPreview(forUrl url: URL) {
        let player = AVPlayer(url: url)
        player.isMuted = isMuted
        playerLayer.player = player
            NotificationCenter.default.addObserver(self, selector: #selector(didEndPlayingVideo), name: .AVPlayerItemDidPlayToEndTime, object: player.currentItem)
    }
    
    @objc func didEndPlayingVideo() {
        isPlaying = isLooped
        if isLooped { seekToBeginingVideo() }
    }
}
