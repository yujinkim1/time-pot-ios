//
//  BaseTableViewCell
//  TimePot
//
//  Created by Yujin Kim on 2024-04-04.
//  

import UIKit

class BaseTableViewCell<M>: UITableViewCell {
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
                self.bind(model)
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .gray
        
        self.setLayouts()
        self.setConstraints()
        self.setIfNeeds()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ model: M) {}
    
    func setLayouts() {}
    
    func setConstraints() {}
    
    func setIfNeeds() {}
}
