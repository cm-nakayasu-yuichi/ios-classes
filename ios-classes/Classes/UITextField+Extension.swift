import UIKit

extension UITextField {
    
    var textValue: String {
        get {
            return text ?? ""
        }
        set {
            text = newValue
        }
    }
}
