import UIKit

extension UIImage {
    
    class func imageFromContext(_ size: CGSize, _ block: (CGContext) -> Void) -> UIImage {
        UIGraphicsBeginImageContext(size)
        block(UIGraphicsGetCurrentContext()!)
        let ret = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return ret!
    }
    
    class func imageFromContext(width: CGFloat, height: CGFloat, _ block: (CGContext) -> Void) -> UIImage {
        return imageFromContext(CGSize(width: width, height: height), block)
    }
}
