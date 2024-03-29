//
//  UITableView+Extension
//  TimePot
//
//  Created by Yujin Kim on 2024-03-30.
//  

import UIKit

extension UITableView {
    func register<T: UITableViewCell>(withClass name: T.Type) {
        self.register(T.self, forCellReuseIdentifier: String(describing: name))
    }
    
    func dequeueReusableCell<T: UITableViewCell>(withClass name: T.Type) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: String(describing: name)) as? T
        else { return .init() }
        
        return cell
    }
    
    func dequeueReusableCell<T: UITableViewCell>(withClass name: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: String(describing: name), for: indexPath) as? T
        else { return .init() }
        
        return cell
    }
}
