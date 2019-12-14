//
//
//  Created by Maksym Horodivskyi on 1/8/19.
//  Copyright © 2019 appletv. All rights reserved.
//

import UIKit

class VideoCollectionFlowLayout: UICollectionViewFlowLayout {
    override func prepare() {
        guard let collectionView = collectionView else { return }
        
        scrollDirection = .horizontal
        let topInset: CGFloat = 20
        sectionInset = UIEdgeInsets(top: topInset, left: 0, bottom: 0, right: 0)
        let height = collectionView.bounds.height - sectionInset.top - sectionInset.bottom
        let width = height *  1.21
        itemSize = CGSize(width: width, height: height)
        
        minimumLineSpacing = 78
    }
}
