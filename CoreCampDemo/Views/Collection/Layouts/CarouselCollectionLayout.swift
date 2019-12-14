//
//
//  Created by Maksym Horodivskyi on 1/8/19.
//  Copyright © 2019 appletv. All rights reserved.
//

import UIKit

class CarouselCollectionLayout: UICollectionViewLayout {
    var layoutAttributes = [UICollectionViewLayoutAttributes]()
    
    let itemAspectRatio: CGFloat = 1.5
    var contentSize: CGSize = .zero
    
    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView, let dataSource = collectionView.dataSource else { return }
        
        let verticalInset = CGFloat(60.0)
        let itemInterval = CGFloat(0)
        
        let itemHeight = collectionView.bounds.height - verticalInset
        let itemWidth = itemHeight * itemAspectRatio
        let itemSize = CGSize(width: itemWidth, height: itemHeight)
        
        let sectionInset = (collectionView.bounds.width - itemWidth) / 2 - 110
        
        let numberOfItems = dataSource.collectionView(collectionView, numberOfItemsInSection: 0)
        var cellsAttributes = [UICollectionViewLayoutAttributes]()
        var xOrigin = sectionInset
        
        for itemIndex in 0..<numberOfItems {
            let indexPath = IndexPath(row: itemIndex, section: 0)
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            let itemOrigin = CGPoint(x: xOrigin, y: 0)
            attributes.frame = CGRect(origin: itemOrigin, size: itemSize)
            cellsAttributes.append(attributes)
            
            xOrigin += itemWidth + itemInterval
        }
        
        xOrigin += sectionInset - itemInterval
        contentSize = CGSize(width: xOrigin, height: collectionView.bounds.height)
        layoutAttributes = cellsAttributes
    }
    
    override var collectionViewContentSize: CGSize {
        return contentSize
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return layoutAttributes.filter { rect.intersects($0.frame) }
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let collectionView = collectionView,
        let focusedCell = UIScreen.main.focusedItem as? UICollectionViewCell,
        let focusedIndexPath = collectionView.indexPath(for: focusedCell) else { return proposedContentOffset }
        
        let centerAttributes = layoutAttributes[focusedIndexPath.row]
        let xContentOffset = centerAttributes.frame.midX - collectionView.bounds.width / 2
        return CGPoint(x: xContentOffset, y: proposedContentOffset.y)
    }
}
