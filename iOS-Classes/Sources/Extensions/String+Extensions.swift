import Foundation

// MARK: - 部分取得
extension String {
    
    /// 部分取得
    /// - Parameters:
    ///   - from: 取得開始地点インデックス
    ///   - length: 文字列長
    /// - Returns: 部分取得した文字列
    func substring(from: Int, length: Int) -> String {
        if from < 0 || length < 0 { return "" }
        let fromIndex = index(startIndex, offsetBy: from, limitedBy: endIndex) ?? endIndex
        let toIndex = index(startIndex, offsetBy: from + length, limitedBy: endIndex) ?? endIndex
        return String(self[fromIndex..<toIndex])
    }
    
    /// 部分取得
    ///
    ///  ```
    ///  let str = "abcdefghijk"[from: 2, length: 3]
    ///  // "cde"
    ///  ```
    /// - Parameters:
    ///   - from: 取得開始地点インデックス
    ///   - length: 文字列長
    /// - Returns: 部分取得した文字列
    subscript(from fromIndex: Int, length len: Int) -> String {
        return substring(from: fromIndex, length: len)
    }
    
    /// 1文字取得
    ///
    ///  ```
    ///  let str = "abcdefghijk"[3]
    ///  // "d"
    ///  ```
    /// - Parameters:
    ///   - index: 取得位置インデックス
    /// - Returns: 部分取得した文字列
    subscript(_ index: Int) -> String {
        return substring(from: index, length: 1)
    }
}

// MARK: - 空文字列対応
extension String {
    
    /// 空文字列の場合にnilを返す
    var emptyToNil: String? {
        return isEmpty ? nil : self
    }
    
    /// 空文字列の場合に代替文字を返す
    /// - Parameter substitute: 代替文字
    /// - Returns: 空文字列の場合は代替文字を返す
    func empty(to substitute: String) -> String {
        return isEmpty ? substitute : self
    }
}

// MARK: - 文字列置換
extension String {
    
    /// 文字列置換
    /// - Parameters:
    ///   - target: 置換される文字
    ///   - replacement: 置換する文字
    /// - Returns: 文字列置換された文字列
    func replace(_ target: String, _ replacement: String) -> String {
        return (self as NSString).replacingOccurrences(of: target, with: replacement)
    }
}

// MARK: - 正規表現
extension String {

    /// 正規表現パターンにマッチするかどうか
    /// - Parameter pattern: 正規表現パターン
    /// - Returns: パターンにマッチするかどうか
    func isPatternMatch(_ pattern: String) -> Bool {
        return matches(pattern: pattern).count > 0
    }
    
    /// 最初にパターンにマッチする文字列と範囲をタプルで返す
    func firstMatched(pattern: String) -> (string: String, range: NSRange)? {
        let results = matches(pattern: pattern)
        if (results.isEmpty) { return nil }
        return (
            string: (self as NSString).substring(with: results.first!.range),
            range: results.first!.range
        )
    }

    /// パターンマッチの結果を返す
    func matches(pattern: String) -> [NSTextCheckingResult] {
        guard let regex = try? NSRegularExpression(pattern: pattern) else {
            return []
        }
        let range = NSRange(location: 0, length: count)
        return regex.matches(in: self, options: [], range: range)
    }
}

// MARK: - 値の型名
extension String {
    
    /// 与えられた値の型名を取得する
    /// - Parameter value: 値
    /// - Returns: 型名。nilが与えられた場合は"nil"が返る
    static func typeOf(_ value: Any?) -> String {
        guard let value = value else { return "nil" }
        return String(describing: type(of: value))
    }

    /// 与えられた値の型名で初期化する
    /// - Parameter value: 値
    init(typeOf value: Any?) {
        guard let value = value else { self.init("nil"); return }
        self.init(describing: type(of: value))
    }
}

// MARK: - 記法の変換
extension String {
    
    /// スネークケースへの変換
    var snakeCased: String {
        let rex = try! NSRegularExpression(pattern: "(?<=\\w)([A-Z])", options: NSRegularExpression.Options())
        let mutableRawValue = NSMutableString(string: self)
        rex.replaceMatches(
            in: mutableRawValue,
            options: NSRegularExpression.MatchingOptions(),
            range: NSMakeRange(0, count),
            withTemplate: "_$1"
        )
        return (mutableRawValue as String).lowercased(with: nil)
    }
}

// MARK: - パディング
extension String {
    
    /// 文字列のパディング (デフォルトはゼロパディングを行う)
    /// - Parameters:
    ///   - length: パディング後の文字数
    ///   - pad: パディングする文字列 (省略時は"0")
    /// - Returns: パディングされた文字列
    func padding(length: Int, pad: String = "0") -> String {
        if count < length {
            return String(repeating: pad, count: length - count) + self
        }
        return self
    }
}
