//
//  NotFoundModeTableViewCell
//  TimePot
//
//  Created by Yujin Kim on 2024-03-30.
//  

import UIKit

final class NotFoundModeTableViewCell: UITableViewCell {
    static var identifier: String {
        return NSStringFromClass(self)
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "사용할 수 있는 모드가 없어요"
        label.font = .systemFont(ofSize: CGFloat(24), weight: .semibold)
        
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "+ 버튼으로 모드를 생성하고 시간을 기록해보세요"
        label.font = .systemFont(ofSize: CGFloat(18), weight: .regular)
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clear
        
        self.setLayouts()
        self.setConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayouts() {
        self.addSubviews([titleLabel, subtitleLabel])
    }
    
    private func setConstraints() {
        self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        self.subtitleLabel.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor).isActive = true
        self.subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: CGFloat(8)).isActive = true
    }
}
