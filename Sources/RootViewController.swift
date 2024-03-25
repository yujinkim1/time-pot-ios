//
//  RootViewController.swift
//  App
//
//  Created by Yujin Kim on 2024-02-29.
//

import UIKit

final class RootViewController: BaseViewController {
    lazy var helpTouchableImageView: TouchableImageView = {
        let view = TouchableImageView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(systemName: "questionmark")
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = CGFloat(16)
        view.layer.masksToBounds = false
        
        return view
    }()
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        super.viewDidLoad()
    }
    
    override func setLayouts() {
        super.setLayouts()
        
        view.addSubview(helpTouchableImageView)
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        self.helpTouchableImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.helpTouchableImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        self.helpTouchableImageView.widthAnchor.constraint(equalToConstant: CGFloat(33)).isActive = true
        self.helpTouchableImageView.heightAnchor.constraint(equalToConstant: CGFloat(33)).isActive = true
    }
    
    override func setIfNeeds() {
        self.helpTouchableImageView.setOpaqueTapEvent { [weak self] in
            guard let selfRef = self else { return }
            
            debugPrint("setOpaqueTapEvent() >>>> \(selfRef)")
            
            let testViewController = BaseViewController()
            testViewController.view.backgroundColor = .green
            
            selfRef.present(testViewController, animated: true)
        }
    }
}
