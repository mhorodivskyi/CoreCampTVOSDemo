//
//
//  Created by Maksym Horodivskyi on 1/8/19.
//  Copyright © 2019 appletv. All rights reserved.
//

import UIKit

class BaseCollectionViewCell<Model>: UICollectionViewCell {
    
    var model: Model? { didSet { fill(with: model) } }
    
    func fill(with model: Model?) {
        guard let model = model else { return } // TODO: temporary solution
        fill(with: model)
    }
    
    override func prepareForReuse() {
        model = nil
        super.prepareForReuse()
    }
}

extension UICollectionViewCell {
    class var identifier: String {
        return String(describing: self)
    }
    
    class var nib: UINib {
        return UINib.init(nibName: identifier, bundle: nil)
    }
}
