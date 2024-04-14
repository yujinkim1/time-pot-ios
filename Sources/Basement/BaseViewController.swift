//
//  BaseViewController
//  TimePot
//
//  Created by Yujin Kim on 2024-03-24.
//  

import UIKit

class BaseViewController<View: UIView>: UIViewController {
    var rootview: View {
        self.view as! View
    }
    
    override func loadView() {
        self.view = View()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setIfNeeds()
    }
    
    deinit {
        self.setIfDeinitializes()
        
        #if DEBUG
        debugPrint("\(self) >>>> deinitialized")
        #endif
    }
    
    func setIfDeinitializes() {}
    
    func setIfNeeds() {}
}
