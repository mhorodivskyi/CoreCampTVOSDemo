//
//  AdvancedViewController.swift
//  CoreCampDemo
//
//  Created by Maksym Horodivskyi on 12/6/19.
//  Copyright © 2019 CoreValue. All rights reserved.
//

import UIKit

class AdvancedViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var featuredCollectionView: UICollectionView!
    @IBOutlet weak var freshCollectionView: UICollectionView!
    @IBOutlet weak var recommendedCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.tabBarObservedScrollView = scrollView
    }
    
    private func setUpUI() {
        
        featuredCollectionView.collectionViewLayout = CarouselCollectionLayout()
        freshCollectionView.registerNib(forType: VideoCollectionViewCell.self)
        recommendedCollectionView.registerNib(forType: VideoCollectionViewCell.self)
        
        freshCollectionView.collectionViewLayout = VideoCollectionFlowLayout()
        recommendedCollectionView.collectionViewLayout = VideoCollectionFlowLayout()
        
        additionalSafeAreaInsets = UIEdgeInsets(top: 10, left: 20, bottom: 0, right: 20)
    }
    
    private func loadData() {
        featuredCollectionSource = FeaturedCollectionSource(withModels: DataProvider.topVideos)
        freshCollectionSource = VideoCollectionSource(withModels: DataProvider.newVideos)
        recommendedCollectionSource = VideoCollectionSource(withModels: DataProvider.randomVideos())
    }
    
    private var featuredCollectionSource: FeaturedCollectionSource! {
        didSet {
            featuredCollectionSource.didSelectItem = didSelectItem
            featuredCollectionView.setSource(featuredCollectionSource)
        }
    }
    
    private var freshCollectionSource: VideoCollectionSource! {
        didSet {
            freshCollectionSource.didSelectItem = didSelectItem
            freshCollectionView.setSource(freshCollectionSource)
        }
    }
    
    private var recommendedCollectionSource: VideoCollectionSource! {
        didSet {
            recommendedCollectionSource.didSelectItem = didSelectItem
            recommendedCollectionView.setSource(recommendedCollectionSource)
        }
    }
    
    func didSelectItem(_ model: VideoModel) -> Void {
        let controller = storyboard?.instantiateViewController(identifier: "VideoDetailsViewController") as! VideoDetailsViewController
        controller.model = model
        navigationController?.pushViewController(controller, animated: true)
//        present(controller, animated: true, completion: nil)
    }
}
