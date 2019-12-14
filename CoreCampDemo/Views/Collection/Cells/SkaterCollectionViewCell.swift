//
//  SkaterCollectionViewCell.swift
//  CoreCampDemo
//
//  Created by Maksym Horodivskyi on 12/11/19.
//  Copyright © 2019 CoreValue. All rights reserved.
//

import UIKit
import TVUIKit
import Kingfisher

class SkaterCollectionViewCell: BaseCollectionViewCell<SkaterModel> {
    
    @IBOutlet weak var monogramView: TVMonogramView!
    private var task: DownloadTask?
    
    override func fill(with model: SkaterModel?) {
        monogramView.title = model?.fullName
        monogramView.personNameComponents = model?.nameComponents
        
        if let url = model?.monoImageUrl {
            task = KingfisherManager.shared.retrieveImage(with: url, completionHandler: { (result) in
                if case let Result.success(image) = result { self.monogramView.image = image.image }
            })
        }
    }
    
    override func prepareForReuse() {
        task?.cancel()
        monogramView.image = nil
    }
}
