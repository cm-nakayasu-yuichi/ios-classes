import UIKit

extension UITextView {
    
    var textValue: String {
        get {
            return text ?? ""
        }
        set {
            text = newValue
        }
    }
}
