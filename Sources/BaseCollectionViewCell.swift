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
            if let model = newValue {
                self.bind(model: model)
                
                debugPrint("\(self).\(String(describing: newValue)) is available.")
            } else {
                debugPrint("\(self).\(String(describing: newValue)) is not available.")
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setLayout()
        self.setConstraints()
        self.setIfNeeds()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(model: M) {}
    
    func setLayout() {}
    
    func setConstraints() {}
    
    func setIfNeeds() {}
}
