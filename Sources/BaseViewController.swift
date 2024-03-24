//
//  BaseViewController
//  TimePot
//
//  Created by Yujin Kim on 2024-03-24.
//  

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setLayouts()
        self.setConstraints()
        self.setIfNeeds()
    }
    
    deinit {
        self.setIfDeinitializes()
        
        #if DEBUG
        debugPrint("\(self) >>>> deinitialized")
        #endif
    }
    
    func setIfDeinitializes() {}
    
    func setLayouts() {}
    
    func setConstraints() {}
    
    func setIfNeeds() {}
}
