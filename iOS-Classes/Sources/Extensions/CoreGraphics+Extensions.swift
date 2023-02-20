import Foundation
import CoreGraphics

// MARK: - CGRect
extension CGRect {
    
    /// イニシャライザ
    /// - Parameters:
    ///   - width: 幅
    ///   - height: 高さ
    ///   - x: X座標
    ///   - y: Y座標
    init(_ width: CGFloat, _ height: CGFloat, _ x: CGFloat, _ y: CGFloat) {
        self.init(x: x, y: y, width: width, height: height)
    }
    
    /// イニシャライザ
    /// - Parameters:
    ///   - origin: 座標
    ///   - size: サイズ
    init(_ origin: CGPoint, _ size: CGSize) {
        self.init(origin: origin, size: size)
    }
    
    /// 座標を0位置に固定してイニシャライザ
    ///  - Parameter size: サイズ
    init(_ size: CGSize) {
        self.init(origin: .zero, size: size)
    }
}

// MARK: - CGPoint
extension CGPoint {
    
    /// イニシャライザ
    /// - Parameters:
    ///   - x: X座標
    ///   - y: Y座標
    init(_ x: CGFloat, _ y: CGFloat) {
        self.init(x: x, y: y)
    }
}

// MARK: - CGSize
extension CGSize {
    
    /// イニシャライザ
    /// - Parameters:
    ///   - width: 幅
    ///   - height: 高さ
    init(_ width: CGFloat, _ height: CGFloat) {
        self.init(width: width, height: height)
    }
}

// MARK: - CGFloat
extension CGFloat {
    
    /// 引数の値に対するパーセンテージを取得する
    /// - Parameter denominator: 対象の値
    /// - Returns: denominatorに対するパーセンテージ
    func percentage(of denominator: CGFloat) -> CGFloat {
        if denominator <= 0 { return 0 }
        if self >= denominator { return 1 }
        return self / denominator
    }
    
    /// パーセンテージ表示用の文字列を取得
    /// - Parameter place: 小数点位置
    /// - Returns: パーセンテージ表示用の文字列
    func percentageText(place: Int) -> String {
        let format = "%.\(NSString(format: "%02d", place) as String)f" as NSString
        return NSString(format: format, self * 100) as String
    }
}

// MARK: - 他の型からCGFloatへの変換
extension Int {
    
    /// CGFloat値を取得
    var f: CGFloat {
        return CGFloat(self)
    }
}

extension Double {
    
    /// CGFloat値を取得
    var f: CGFloat {
        return CGFloat(self)
    }
}

extension Float {
    
    /// CGFloat値を取得
    var f: CGFloat {
        return CGFloat(self)
    }
}
