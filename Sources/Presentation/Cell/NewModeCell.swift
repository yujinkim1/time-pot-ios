//
//  NewModeCell
//  TimePot
//
//  Created by Yujin Kim on 2024-04-04.
//  

import UIKit

/// 사용자가 메인 화면에서 추가하기 버튼을 누르면 나타나는 셀
final class NewModeCell: BaseTableViewCell<Mode> {
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "모드 이름"
        textField.delegate = self
        
        return textField
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .gray
        self.layer.cornerRadius = CGFloat(16)
        self.layer.masksToBounds = false
    }
    
    override func bind(_ model: Mode) {
        super.bind(model)
    }
    
    override func setLayouts() {
        super.setLayouts()
        
        self.contentView.addSubview(textField)
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        let contentViewLeadingAnchor = self.contentView.leadingAnchor
        let contentViewTrailingAnchor = self.contentView.trailingAnchor
        let contentViewTopAnchor = self.contentView.topAnchor
        let contentViewBottomAnchor = self.contentView.bottomAnchor
        
        self.textField.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
        self.textField.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
        self.textField.topAnchor.constraint(equalTo: contentViewTopAnchor).isActive = true
        self.textField.bottomAnchor.constraint(equalTo: contentViewBottomAnchor).isActive = true
    }
}

extension NewModeCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.textField.resignFirstResponder()
        
        return true
    }
}
