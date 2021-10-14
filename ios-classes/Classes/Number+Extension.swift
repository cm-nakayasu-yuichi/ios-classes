import Foundation

// MARK: - Int
extension Int {
    
    /// 金額表示用の文字列
    var currency: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = ","
        formatter.groupingSize = 3
        return formatter.string(for: self)!
    }
    
    /// 文字列に変換した値
    var string: String {
        return "\(self)"
    }
}

// MARK: - Double
extension Double {
    
    /// 文字列に変換した値
    var string: String {
        return "\(self)"
    }
}

// MARK: - Float
extension Float {
    
    /// 文字列に変換した値
    var string: String {
        return "\(self)"
    }
}

// MARK: - Bool
extension Bool {
    
    /// 文字列に変換した値
    var string: String {
        return self ? "true" : "false"
    }
    
    /// 整数に変換した値
    var int: Int {
        return self ? 1 : 0
    }
    
    /// 真偽反対の値
    var reversed: Bool {
        return self ? false : true
    }
    
    /// 真偽反対の値
    mutating func reverse() {
        self = self ? false : true
    }
}
