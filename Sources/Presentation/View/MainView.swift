//
//  MainView
//  TimePot
//
//  Created by Yujin Kim on 2024-04-05.
//  

import UIKit

final class MainView: UIView {
    static var identifier: String {
        return NSStringFromClass(self)
    }
    
    lazy var modeTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 100
        tableView.register(withClass: NewModeCell.self)
        tableView.register(withClass: ModeCell.self)
        
        return tableView
    }()
    
    lazy var plusTouchableImageView: TouchableImageView = {
        let imageView = TouchableImageView(frame: .zero)
        imageView.image = UIImage(systemName: "plus.circle.fill")
        
        return imageView
    }()
    
    init() {
        super.init(frame: .zero)
        
        self.backgroundColor = .gray
        
        self.setLayouts()
        self.setConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayouts() {
        self.addSubviews([self.modeTableView, self.plusTouchableImageView])
    }
    
    private func setConstraints() {
        self.modeTableView.equalToSuperview()
        
        self.plusTouchableImageView.anchor(trailing: self.trailingAnchor,
                                           trailingConstant: 20,
                                           bottom: self.safeAreaLayoutGuide.bottomAnchor,
                                           bottomConstant: -28,
                                           sizeConstant: 48)
    }
}
