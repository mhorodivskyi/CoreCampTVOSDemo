//
//  BaseSingleCollectionSource.swift
//
//  Created by Maksym Horodivskyi on 1/8/19.
//  Copyright © 2019 appletv. All rights reserved.
//

import UIKit

class CollectionSourceDataContainer<M>: NSObject {
    fileprivate var models: [M]
    
    var itemsCount: Int { return models.count }
    
    init(withModels models: [M]) {
        self.models = models
        super.init()
    }
    
    func item(forIndexPath indexPath: IndexPath) -> M? {
        let index = indexPath.row
        guard index < models.endIndex else { return nil }
        return models[index]
    }
    
    func indexPath(forPosition position: Int) -> IndexPath {
        return IndexPath(item: position, section: 0)
    }
}

extension CollectionSourceDataContainer where M: Equatable {
    func indexPath(forItem item: M) -> IndexPath? {
        if let itemIndex = models.firstIndex(of: item) { return indexPath(forPosition: itemIndex) }
        return nil
    }
}

class BaseSingleCollectionSource<M, C>: CollectionSourceDataContainer<M>, UICollectionViewDataSource, UICollectionViewDelegate where C: BaseCollectionViewCell<M> {
    
    var didSelectItem: ((M) -> Void)?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: C.identifier, for: indexPath)
        guard let modelCell = cell as? C else { return cell }
        modelCell.model = item(forIndexPath: indexPath)
        return modelCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        guard let item = item(forIndexPath: indexPath) else { return }
        didSelectItem?(item)
    }
}

extension UICollectionView {
    func setSource<M, C>(_ source: BaseSingleCollectionSource<M, C>) {
        dataSource = source
        delegate = source
        reloadData()
    }
    
    func registerNib(forType cellType: UICollectionViewCell.Type) {
        self.register(cellType.nib, forCellWithReuseIdentifier: cellType.identifier)
    }
}
