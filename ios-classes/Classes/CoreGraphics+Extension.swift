import Foundation
import CoreGraphics

// MARK: - CGRect
extension CGRect {
    
    init(_ width: CGFloat, _ height: CGFloat, _ x: CGFloat, _ y: CGFloat) {
        self.init(x: x, y: y, width: width, height: height)
    }
    
    init(_ origin: CGPoint, _ size: CGSize) {
        self.init(origin: origin, size: size)
    }
    
    init(_ size: CGSize) {
        self.init(origin: .zero, size: size)
    }
}

// MARK: - CGPoint
extension CGPoint {
    
    init(_ x: CGFloat, _ y: CGFloat) {
        self.init(x: x, y: y)
    }
}

// MARK: - CGSize
extension CGSize {
    
    init(_ width: CGFloat, _ height: CGFloat) {
        self.init(width: width, height: height)
    }
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
