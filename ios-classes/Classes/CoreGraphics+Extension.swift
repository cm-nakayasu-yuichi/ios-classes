import Foundation
import CoreGraphics

// MARK: - CGRect
extension CGRect {
    
}

// MARK: - CGPoint
extension CGPoint {
    
}

// MARK: - CGSize
extension CGSize {
    
}

// MARK: - CGFloat
extension CGFloat {
    
    func percentage(of denominator: CGFloat) -> CGFloat {
        if denominator <= 0 { return 0 }
        if self >= denominator { return 1 }
        return self / denominator
    }
    
    func percentageText(place: Int) -> String {
        let format = "%.\(NSString(format: "%02d", place) as String)f" as NSString
        return NSString(format: format, self * 100) as String
    }
}

// MARK: - Other Number Type to CGFloat
extension Int {
    
    var f: CGFloat {
        return CGFloat(self)
    }
}

extension Double {
    
    var f: CGFloat {
        return CGFloat(self)
    }
}

extension Float {
    
    var f: CGFloat {
        return CGFloat(self)
    }
}
