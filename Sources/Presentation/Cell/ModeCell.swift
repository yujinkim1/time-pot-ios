//
//  ModeCell
//  TimePot
//
//  Created by Yujin Kim on 2024-04-05.
//  

import UIKit

final class ModeCell: BaseTableViewCell<Mode> {
    private lazy var modeNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    override func bind(_ model: Mode) {
        super.bind(model)
    }
    
    override func setLayouts() {
        super.setLayouts()
        
        self.addSubview(modeNameLabel)
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        self.modeNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
    }
    
    override func setIfNeeds() {}
}
