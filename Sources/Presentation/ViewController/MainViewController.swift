//
//  MainViewController
//  TimePot
//
//  Created by Yujin Kim on 2024-03-28.
//  

import UIKit

final class MainViewController: BaseViewController<MainView> {
    var isAddMode = false
    var modeOfList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.rootview.modeTableView.dataSource = self
        self.rootview.modeTableView.delegate = self
        self.prepareModeTableView()
    }
    
    override func setIfNeeds() {
        self.rootview.plusTouchableImageView.setOpaqueTapEvent {
            self.isAddMode = true
            
            self.rootview.modeTableView.beginUpdates()
            self.rootview.modeTableView.insertRows(at: [IndexPath.init(row: 0, section: 0)], with: .automatic)
            self.rootview.modeTableView.endUpdates()
        }
    }
    
    private func prepareModeTableView() {
        if modeOfList.count == 0 {
            self.rootview.modeTableView.backgroundView = NotFoundModeView()
        }
        
        self.rootview.modeTableView.reloadData()
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
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
        if indexPath.row == 0 && self.isAddMode {
            let cell = tableView.dequeueReusableCell(withClass: NewModeCell.self)
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withClass: ModeCell.self, for: indexPath)
        
        return cell
    }
}
