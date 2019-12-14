//
//  VideoDetailsViewController.swift
//  CoreCampDemo
//
//  Created by Maksym Horodivskyi on 12/11/19.
//  Copyright © 2019 CoreValue. All rights reserved.
//

import UIKit
import AVKit
import XCDYouTubeKit

class VideoDetailsViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    weak var previewView: PreviewPlayerView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var overlayView: UIView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var skatersCollectionView: UICollectionView!
    @IBOutlet weak var similarCollectionView: UICollectionView!
    
    var model: VideoModel?
    private var videoUrl: URL?
    
    private weak var playerLayer: AVPlayerLayer!
    
    private let darkenOpaqueScrollPosition = CGFloat(700)
    
    @IBAction func playClicked(_ sender: Any) {
        guard let videoUrl = videoUrl else { return }
        let playerController = AVPlayerViewController()
        let player = AVPlayer(url: videoUrl)
        playerController.player = player
        present(playerController, animated: true) { [weak player] in player?.play() }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.tabBarObservedScrollView = scrollView
        
        previewView.alpha = 0
        previewView.stopPreview()
        previewView.startPreviewCountDown()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        previewView.stopPreview()
    }
    
    private func setUpUI() {
        
        let previewView = PreviewPlayerView()
        previewView.translatesAutoresizingMaskIntoConstraints = false
        previewView.alpha = 0
        previewView.didStartPreviewPlayback = {
            UIView.animate(withDuration: 1, animations: { [unowned self] in self.previewView.alpha = 1 })
        }
        view.insertSubview(previewView, belowSubview: overlayView)
        view.setEqualConstraints(forChildView: previewView)
        
        self.previewView = previewView
        
        skatersCollectionView.registerNib(forType: SkaterCollectionViewCell.self)
        similarCollectionView.registerNib(forType: VideoCollectionViewCell.self)
        
        similarCollectionView.collectionViewLayout = VideoCollectionFlowLayout()
        
        additionalSafeAreaInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        scrollView.delegate = self
        tabBarObservedScrollView = scrollView
    }
    
    
    private func loadData() {
        guard let model = model else { return }
        skatersCollectionSource = SkaterCollectionSource(withModels: model.skaters)
        similarCollectionSource = VideoCollectionSource(withModels: DataProvider.randomVideos())
        
        titleLabel.text = model.title
        descriptionLabel.text = model.descriprion
        imageView.kf.setImage(with: model.imageUrl)
        
        XCDYouTubeClient.default().getVideoWithIdentifier(model.youtubeId) { [weak self] (video, error) in
            guard let url = video?.streamURL else { return }
            self?.previewView.fillPreview(videoUrl: url)
            self?.previewView.startPreviewCountDown()
            self?.videoUrl = url
        }
    }
    
    deinit {
        previewView?.resetPreview()
    }
    
    private var skatersCollectionSource: SkaterCollectionSource! {
        didSet {
            skatersCollectionView.setSource(skatersCollectionSource)
        }
    }
    
    private var similarCollectionSource: VideoCollectionSource! {
        didSet {
            similarCollectionSource.didSelectItem = didSelectItem
            similarCollectionView.setSource(similarCollectionSource)
        }
    }
    
    func didSelectItem(_ model: VideoModel) -> Void {
        let controller = storyboard?.instantiateViewController(identifier: "VideoDetailsViewController") as! VideoDetailsViewController
        controller.model = model
        present(controller, animated: true, completion: nil)
    }
}

extension VideoDetailsViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        overlayView.alpha = min(scrollView.contentOffset.y / darkenOpaqueScrollPosition, 1)
    }
}
