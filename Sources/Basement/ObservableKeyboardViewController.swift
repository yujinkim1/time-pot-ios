//
//  ObservableKeyboardViewController
//  TimePot
//
//  Created by Yujin Kim on 2024-03-25.
//  

import UIKit

/// 키보드가 필요할 때 사용하는 뷰 컨트롤러
///
class ObservableKeyboardViewController: BaseViewController<UIView> {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setIfNeeds() {
        super.setIfNeeds()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    override func setIfDeinitializes() {
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillShowNotification,
                                                  object: nil)
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillHideNotification,
                                                  object: nil)
    }

    @objc func keyboardWillShow(_ notification: NSNotification) {}
    
    @objc func keyboardWillHide(_ notification: NSNotification) {}
}
