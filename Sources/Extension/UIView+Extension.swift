//
//  UIView+Extension
//  TimePot
//
//  Created by Yujin Kim on 2024-03-29.
//  

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach { view in
            self.addSubview(view)
        }
    }
    
    @discardableResult
    func anchor(
        leading: NSLayoutXAxisAnchor? = nil,
        leadingConstant: CGFloat = 0,
        trailing: NSLayoutXAxisAnchor? = nil,
        trailingConstant: CGFloat = 0,
        top: NSLayoutYAxisAnchor? = nil,
        topConstant: CGFloat = 0,
        bottom: NSLayoutYAxisAnchor? = nil,
        bottomConstant: CGFloat = 0,
        widthConstant: CGFloat = 0,
        heightConstant: CGFloat = 0,
        sizeConstant: CGFloat = 0
    ) -> [NSLayoutConstraint] {
        var anchors: [NSLayoutConstraint] = []
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let leadingRef = leading {
            anchors.append(leadingAnchor.constraint(equalTo: leadingRef, constant: leadingConstant))
        }
        
        if let trailingRef = trailing {
            anchors.append(trailingAnchor.constraint(equalTo: trailingRef, constant: -trailingConstant))
        }
        
        if let topRef = top {
            anchors.append(topAnchor.constraint(equalTo: topRef, constant: topConstant))
        }
        
        if let bottomRef = bottom {
            anchors.append(bottomAnchor.constraint(equalTo: bottomRef, constant: bottomConstant))
        }
        
        if widthConstant > 0 {
            anchors.append(widthAnchor.constraint(equalToConstant: widthConstant))
        }
        
        if heightConstant > 0 {
            anchors.append(heightAnchor.constraint(equalToConstant: heightConstant))
        }
        
        if sizeConstant > 0 {
            anchors.append(widthAnchor.constraint(equalToConstant: sizeConstant))
            anchors.append(heightAnchor.constraint(equalToConstant: sizeConstant))
        }
        
        NSLayoutConstraint.activate(anchors)
        
        return anchors
    }
    
    func equalToSuperview() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let superviewRef = superview {
            let leading = leadingAnchor.constraint(equalTo: superviewRef.leadingAnchor)
            let trailing = trailingAnchor.constraint(equalTo: superviewRef.trailingAnchor)
            let top = topAnchor.constraint(equalTo: superviewRef.topAnchor)
            let bottom = bottomAnchor.constraint(equalTo: superviewRef.bottomAnchor)
            
            NSLayoutConstraint.activate([
                leading,
                trailing,
                top,
                bottom
            ])
        }
    }
}
