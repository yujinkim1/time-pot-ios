//
//  BaseCollectionViewCell
//  TimePot
//
//  Created by Yujin Kim on 2024-03-25.
//  

import UIKit

class BaseCollectionViewCell<M>: UICollectionViewCell {
    static var identifier: String {
        return NSStringFromClass(self)
    }
    
    var model: M? {
        willSet {
            if newValue != nil {
                debugPrint("\(self) model is available.")
            } else {
                debugPrint("\(self) model is not available.")
            }
        }
        
        didSet {
            if let model = self.model {
                self.bind(model: model)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setLayouts()
        self.setConstraints()
        self.setIfNeeds()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(model: M) {}
    
    func setLayouts() {}
    
    func setConstraints() {}
    
    func setIfNeeds() {}
}
