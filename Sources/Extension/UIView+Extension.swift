//
//  UIView+Extension
//  TimePot
//
//  Created by Yujin Kim on 2024-03-29.
//  

import UIKit

public extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach { view in
            self.addSubview(view)
        }
    }
}
