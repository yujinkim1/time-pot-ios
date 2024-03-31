//
//  TouchableImageView
//  TimePot
//
//  Created by Yujin Kim on 2024-03-25.
//  

import Combine
import UIKit

class TouchableImageView: UIImageView {
    var isOpaqueEffectEnabled: Bool = true
    var onTapped: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.isUserInteractionEnabled = true
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setOpaqueTapEvent(opaqueEffect: Bool? = true, onTapped: @escaping () -> Void) {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(opaqueEffect(_:)))
        
        self.onTapped = onTapped
        
        if let opaqueEffect = opaqueEffect {
            isOpaqueEffectEnabled = opaqueEffect
        }
        
        self.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc private func opaqueEffect(_ gesture: UITapGestureRecognizer) {
        if self.onTapped != nil, self.alpha == CGFloat(1), self.isOpaqueEffectEnabled {
            self.alpha = CGFloat(0.5)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
                guard let selfRef = self else { return }
                selfRef.alpha = CGFloat(1)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
                guard let selfRef = self,
                      let onTapped = selfRef.onTapped
                else { return }
                
                onTapped()
            }
        }
    }
}
