import UIKit

extension Array where Element == UIView {
    
    var isHidden: Bool {
        get {
            return first?.isHidden ?? false
        }
        set {
            forEach { $0.isHidden = newValue }
        }
    }
}
