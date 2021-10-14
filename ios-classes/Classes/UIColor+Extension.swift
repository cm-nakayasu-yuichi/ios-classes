import UIKit

// MARK: -
extension UIColor {
    
    /// カラーコンポーネント
    struct Components<T> {
        let red: T
        let green: T
        let blue: T
        let alpha: T
    }
    
    /// 0〜255のRGBA整数値から初期化する
    /// - Parameters:
    ///   - r: R値(0-255)
    ///   - g: G値(0-255)
    ///   - b: B値(0-255)
    ///   - a: アルファ値(0-255)
    convenience init(_ r: Int, _ g: Int, _ b: Int, _ a: Int = 255) {
        self.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: CGFloat(a)/255.0)
    }
    
    /// RGB値から初期化する
    /// - Parameter rgb: RGB値 (例: red = 0xFF0000)
    convenience init(rgb: Int) {
        let r: CGFloat = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let g: CGFloat = CGFloat((rgb & 0x00FF00) >>  8) / 255.0
        let b: CGFloat = CGFloat( rgb & 0x0000FF       ) / 255.0
        self.init(red: r, green: g, blue: b, alpha: 1.0)
    }
    
    /// アルファ値を変更したUIColorを返す
    /// - Parameter alpha: アルファ値 (0.0 - 1.0)
    /// - Returns: アルファ値を変更したUIColor
    func alpha(to alpha: CGFloat) -> UIColor {
        return self.withAlphaComponent(alpha)
    }
    
    /// RBG値
    var rgb: Int {
        let comps = self.components
        return (comps.red * 0x010000) + (comps.green * 0x000100) + comps.blue
    }
    
    /// 文字列化したRBG値 (カラーコード)
    var rgbString: String {
        var r:CGFloat = -1, g:CGFloat = -1, b:CGFloat = -1, a:CGFloat = -1
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        return "\(toHex(r))\(toHex(g))\(toHex(b))"
    }
    
    /// パーセンテージベースのカラーコンポーネント ( 各要素の範囲が 0.0 - 1.0 )
    var percentagedComponents: UIColor.Components<CGFloat> {
        var r:CGFloat = -1, g:CGFloat = -1, b:CGFloat = -1, a:CGFloat = -1
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        return UIColor.Components(red: r, green: g, blue: b, alpha: a)
    }
    
    /// カラーコンポーネント ( 各要素の範囲が 0 - 255 )
    var components: UIColor.Components<Int> {
        let components = self.percentagedComponents
        return UIColor.Components(
            red:   percentageTo255(components.red),
            green: percentageTo255(components.green),
            blue:  percentageTo255(components.blue),
            alpha: percentageTo255(components.alpha)
        )
    }
}

// MARK: - Privates
private extension UIColor {
    
    func percentageTo255(_ floatValue: CGFloat) -> Int {
        return Int(round(floatValue * 255))
    }
    
    func toHex(_ floatValue: CGFloat) -> String {
        let n = percentageTo255(floatValue)
        return NSString(format: "%02X", n) as String
    }
}
