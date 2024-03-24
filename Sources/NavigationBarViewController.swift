//
//  NavigationBarViewController
//  TimePot
//
//  Created by Yujin Kim on 2024-03-25.
//  

import UIKit

/// 커스텀 네비게이션 바가 필요할 때 사용하는 뷰 컨트롤러
///
class NavigationBarViewController: BaseViewController {
    lazy var navigationView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.addTarget(self,
                         action: #selector(backButtonDidTapped(_:)),
                         for: .touchUpInside)
        
        return button
    }()
    
    override func setLayouts() {
        super.setLayouts()
        
        self.navigationView.addSubview(backButton)
        self.navigationView.addSubview(titleLabel)
        
        self.view.addSubview(navigationView)
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        self.navigationView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.navigationView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        self.navigationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.navigationView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.navigationView.heightAnchor.constraint(equalToConstant: CGFloat(52)).isActive = true
        
        self.backButton.leadingAnchor.constraint(equalTo: navigationView.leadingAnchor, constant: CGFloat(20)).isActive = true
        self.backButton.centerYAnchor.constraint(equalTo: navigationView.centerYAnchor).isActive = true
        self.backButton.widthAnchor.constraint(equalToConstant: CGFloat(24)).isActive = true
        self.backButton.heightAnchor.constraint(equalToConstant: CGFloat(24)).isActive = true
        
        self.titleLabel.leadingAnchor.constraint(equalTo: backButton.trailingAnchor).isActive = true
        self.titleLabel.centerXAnchor.constraint(equalTo: navigationView.centerXAnchor).isActive = true
        self.titleLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor).isActive = true
    }
    
    func setTitle(to value: String?) {
        self.titleLabel.text = value
    }
    
    @objc private func backButtonDidTapped(_ button: UIButton) {
        self.navigationController?.popViewController(animated: true)
        
        debugPrint("\(self.backButton) is tapped.")
    }
}
