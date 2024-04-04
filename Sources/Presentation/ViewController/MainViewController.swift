//
//  MainViewController
//  TimePot
//
//  Created by Yujin Kim on 2024-03-28.
//  

import UIKit

// TODO: 1. 셀을 동적으로 추가하도록 하기
// TODO: 2. 데이터가 없으면 NotFoundModeTableViewCell을 보여주기

final class MainViewController: BaseViewController {
    var modeOfList: [String] = []
    
    lazy var modeTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        
        return tableView
    }()
    
    private lazy var menu: UIMenu = {
        let menu = UIMenu(children: createMenuAction())
        
        return menu
    }()
    
    private lazy var menuButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = CGFloat(8)
        button.setImage(UIImage(systemName: "line.3.horizontal"), for: .normal)
        button.menu = self.menu
        button.showsMenuAsPrimaryAction = true
        
        return button
    }()
    
    lazy var plusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.backgroundColor = .gray
        
        return button
    }()
    
    lazy var plusTouchableImageView: TouchableImageView = {
        let imageView = TouchableImageView(frame: .zero)
        imageView.image = UIImage(systemName: "plus")
        
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        self.prepareModeTableView()
    }
    
    override func setLayouts() {
        super.setLayouts()
        
        self.view.addSubviews([
            self.modeTableView,
            self.menuButton,
            self.plusButton
        ])
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        self.modeTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        self.modeTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        self.modeTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.modeTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
        
        self.menuButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        self.menuButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
        self.menuButton.widthAnchor.constraint(equalToConstant: CGFloat(33)).isActive = true
        self.menuButton.heightAnchor.constraint(equalToConstant: CGFloat(33)).isActive = true
        
        self.plusButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        self.plusButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
        self.plusButton.widthAnchor.constraint(equalToConstant: CGFloat(33)).isActive = true
        self.plusButton.heightAnchor.constraint(equalToConstant: CGFloat(33)).isActive = true
    }
    
    func createMenuAction() -> [UIAction] {
        var actions: [UIAction]
        
        let upgrade = UIAction(
            title: "Upgrade to Pro",
            image: UIImage(systemName: "dollarsign.circle.fill"),
            handler: { [weak self] _ in
                guard let selfRef = self else { return }
                
                let viewController = RootViewController()
                selfRef.present(viewController, animated: true)
            }
        )
        
        let settings = UIAction(
            title: "Settings",
            image: UIImage(systemName: "gear.circle.fill"),
            handler: { [weak self] _ in
                guard let selfRef = self else { return }
                
                let viewController = RootViewController()
                selfRef.present(viewController, animated: true)
            }
        )
        
        let policy = UIAction(
            title: "Privacy policy",
            image: UIImage(systemName: "arrow.up.right.circle.fill"),
            handler: { [weak self] _ in
                guard let selfRef = self else { return }
                
                let viewController = RootViewController()
                selfRef.present(viewController, animated: true)
            }
        )
        
        let terms = UIAction(
            title: "Terms of service",
            image: UIImage(systemName: "arrow.up.right.circle.fill"),
            handler: { [weak self] _ in
                guard let selfRef = self else { return }
                
                let viewController = RootViewController()
                selfRef.present(viewController, animated: true)
            }
        )
        
        actions = [upgrade, settings, policy, terms]
        
        return actions.reversed()
    }
    
    @objc private func createMode(_ button: UIButton) {}
    
    private func prepareModeTableView() {
        if modeOfList.count == 0 {
            self.modeTableView.backgroundView = NotFoundModeTableViewCell()
        }
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return modeOfList.count
    }
    
    func tableView(
        _ tableView: UITableView,
        canMoveRowAt indexPath: IndexPath
    ) -> Bool {
        return true
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        return .init()
    }
}

extension MainViewController: UITableViewDelegate {
    
}
