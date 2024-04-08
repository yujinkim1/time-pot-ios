//
//  NotFoundModeView
//  TimePot
//
//  Created by Yujin Kim on 2024-03-30.
//  

import UIKit

final class NotFoundModeView: UIView {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "사용 가능한 모드가 없어요"
        label.textColor = .gray
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "+버튼으로 새로운 모드를 만들고 나의 시간을 기록해보세요"
        label.textColor = .gray
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 11, weight: .regular)
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .clear
        
        self.setLayouts()
        self.setConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayouts() {
        self.addSubviews([self.titleLabel, self.subtitleLabel])
    }
    
    private func setConstraints() {
        self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        self.subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        self.subtitleLabel.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor).isActive = true
    }
}
