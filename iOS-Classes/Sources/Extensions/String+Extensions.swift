import Foundation

// MARK: - 部分取得
extension String {
    
    /// 文字列の部分取得
    ///
    ///  ```
    ///  let str = "abcdefghijk".substring(from: 2, length: 3)
    ///  // "cde"
    ///  ```
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
    
    /// 文字列の部分取得
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
    
    /// 文字列の部分取得
    /// - Parameters:
    ///   - start: 開始位置インデックス
    ///   - end: 終了位置インデックス
    /// - Returns: 部分取得した文字列
    func substring(start: Int, end: Int) -> String {
        let max = count - 1
        var s = start, e = end
        if max < 0 || e < s || max < s || e < 0 {
            return ""
        }
        s = s >= 0 ? s : 0
        e = max > e ? e : max
        
        let substringStart = index(startIndex, offsetBy: s)
        let substringEnd = index(startIndex, offsetBy: e)
        return String(self[substringStart...substringEnd])
    }
    
    /// 文字列の部分取得
    ///
    ///  ```
    ///  let str = "abcdefghijk"[start: 2, end: 3]
    ///  // "cd"
    ///  ```
    /// - Parameters:
    ///   - start: 開始位置インデックス
    ///   - end: 終了位置インデックス
    /// - Returns: 部分取得した文字列
    subscript(start startIndex: Int, end endIndex: Int) -> String {
        return substring(start: startIndex, end: endIndex)
    }
    
    /// 文字列の部分取得
    /// - Parameter range: 取得範囲
    /// - Returns: 部分取得した文字列
    func substring(range: NSRange) -> String {
        return substring(from: range.location, length: range.length)
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
    
    // [0..<9]
    subscript(bounds: CountableRange<Int>) -> String {
        return substring(start: bounds.lowerBound, end: bounds.upperBound - 1)
    }
    
    // [0..<9]
    subscript(bounds: CountableClosedRange<Int>) -> String {
        return substring(start: bounds.lowerBound, end: bounds.upperBound)
    }
    
    // [..<9]
    subscript(bounds: PartialRangeUpTo<Int>) -> String {
        return substring(start: 0, end: bounds.upperBound - 1)
    }
    
    // [...9]
    subscript(bounds: PartialRangeThrough<Int>) -> String {
        return substring(start: 0, end: bounds.upperBound)
    }
    
    // [0...]
    subscript(bounds: CountablePartialRangeFrom<Int>) -> String {
        return substring(start: bounds.lowerBound, end: count - 1)
    }
}

// MARK: - 文字列分割
extension String {
    
    /// 1文字ずつ分割した文字列配列を取得する
    /// - Returns: 1文字ずつ分割した文字列配列
    func divided() -> [String] {
        return reduce(into: [String]()) { result, element in
            result.append(String(element))
        }
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
    ///
    /// ```
    /// "abcdefghijk".replace("h", "?")
    /// // abcdefg?ijk
    ///
    /// "ab?de?ghi?k".replace("?", "@")
    /// // ab@de@ghi@k
    /// ```
    /// - Parameters:
    ///   - target: 置換される文字
    ///   - replacement: 置換する文字
    /// - Returns: 文字列置換された文字列
    func replace(_ target: String, _ replacement: String) -> String {
        return (self as NSString).replacingOccurrences(of: target, with: replacement)
    }
    
    /// 指定した範囲の文字列置換を行う
    ///
    /// ```
    /// "abcdefghijk".replace(range: NSMakeRange(1, 3), "xxx")
    /// // axxxefghijk
    /// ```
    /// - Parameters:
    ///   - range: 範囲
    ///   - replacement: 置換する文字
    /// - Returns: 置換された文字列
    func replace(range: NSRange, _ replacement: String) -> String {
        return (self as NSString).replacingCharacters(in: range, with: replacement)
    }
}

// MARK: - 文字列削除
extension String {
    
    /// 指定した文字数分だけ後ろから削除したものを返す
    ///
    /// ```
    /// "abcdefghijk".removedBackword()
    /// // abcdefghij
    ///
    /// "abcdefghijk".removedBackword(length: 4)
    /// // abcdefg
    /// ```
    /// - Parameter length: 削除する文字数
    func removedBackword(length: Int = 1) -> String {
        return self[..<(count - length)]
    }
    
    /// 指定した文字数分だけ後ろから削除したものを返す
    ///
    ///
    /// ```
    /// "abcdefghijk".removedForword()
    /// // bcdefghijk
    ///
    /// "abcdefghijk".removedForword(length: 4)
    /// // efghijk
    /// ```
    /// - Parameter length: 削除する文字数
    func removedForword(length: Int = 1) -> String {
        return self[length...]
    }
}

// MARK: - ローカライズ
extension String {
    
    /// ローカライズした文字列
    var localized: String {
        return localized(comment: "")
    }
    
    /// ローカライズした文字列を取得する
    /// - Parameter comment: コメント
    /// - Returns: ローカライズした文字列
    func localized(comment: String) -> String {
        return NSLocalizedString(self, comment: comment)
    }
}

// MARK: - フォーマット
extension String {
    
    /// フォーマットした文字列を取得する
    /// - Parameter args: フォーマット用の引数
    /// - Returns: フォーマットした文字列
    func format(_ args: CVarArg...) -> String {
        return NSString(format: self, arguments: getVaList(args)) as String
    }
}

// MARK: - 文字列分割
extension String {
    
    /// 文字列をセパレータ文字列で分割して配列で取得する
    /// - Parameter separator: セパレータ文字列
    /// - Returns: 分割した文字列配列
    func split(_ separator: String) -> [String] {
        return components(separatedBy: separator)
    }
    
    /// コンマで分割
    var splitByComma: [String] {
        return split(",")
    }
    
    /// ドットで分割
    var splitByDot: [String] {
        return split(".")
    }
    
    /// スラッシュで分割
    var splitBySlash: [String] {
        return split("/")
    }
    
    /// 半角スペースで分割
    var splitByWhitespace: [String] {
        return split(" ")
    }
    
    /// 改行文字で分割
    var splitByReturn: [String] {
        return split("\n")
    }
    
    /// キャリッジリターンで分割
    var splitByCarriageReturn: [String] {
        return split("\r\n")
    }
    
    /// タブで分割
    var splitByTab: [String] {
        return split("\t")
    }
}

// MARK: - トリム
extension String {
    
    /// 文字列のトリム
    /// - Parameter characterSet: トリムに使用するキャラクタセット(
    /// - Returns: トリムされた文字列
    func trim(_ characterSet: CharacterSet = .whitespaces) -> String {
        return trimmingCharacters(in: characterSet)
    }
}

// MARK: - 正規表現
extension String {

    /// 文字列から正規表現パターンに合った文字列を配列で返す
    /// - Parameters:
    ///   - pattern: 正規表現パターン
    ///   - options: 正規表現オプション
    ///   - matchingOptions: 正規表現マッチングオプション
    /// - Returns: 正規表現パターンに合った文字列の配列
    func matchedStrings(_ pattern: String, options: NSRegularExpression.Options? = nil, matchingOptions: NSRegularExpression.MatchingOptions? = nil) -> [String] {
        let opts = options ?? NSRegularExpression.Options()
        guard let rex = try? NSRegularExpression(pattern: pattern, options: opts) else {
            return []
        }
        
        let matchOpts = matchingOptions ?? NSRegularExpression.MatchingOptions()
        return rex.matches(in: self, options: matchOpts, range: NSMakeRange(0, count)).map { result -> String in
            return substring(range: result.range(at: 0))
        }
    }
    
    /// 指定した正規表現パターンに合うかどうかを返す
    /// - Parameters:
    ///   - pattern: 正規表現パターン
    ///   - options: 正規表現オプション
    ///   - matchingOptions: 正規表現マッチングオプション
    /// - Returns: 正規表現パターンに合った最初の文字列
    func matchedString(_ pattern: String, options: NSRegularExpression.Options? = nil, matchingOptions: NSRegularExpression.MatchingOptions? = nil) -> String? {
        return matchedStrings(pattern, options: options, matchingOptions: matchingOptions).first
    }
    
    /// 指定した正規表現パターンに合うかどうかを返す
    /// - Parameter pattern: 正規表現パターン
    /// - Returns: 文字列が正規表現パターンに合うかどうか
    func isMatched(_ pattern: String) -> Bool {
        let range = (self as NSString).range(of: pattern, options: .regularExpression)
        return range.location != NSNotFound
    }
    
    /// 文字列から正規表現パターンに合った箇所を置換した文字列を返す
    /// - Parameters:
    ///   - pattern: 正規表現パターン
    ///   - replacement: 置換する文字列
    ///   - options: 正規表現オプション
    ///   - matchingOptions: 正規表現マッチングオプション
    /// - Returns: 置換した文字列
    func replaceMatched(_ pattern: String, replacement: String, options: NSRegularExpression.Options? = nil, matchingOptions: NSRegularExpression.MatchingOptions? = nil) -> String {
        let opts = options ?? NSRegularExpression.Options()
        guard let rex = try? NSRegularExpression(pattern: pattern, options: opts) else {
            return self
        }
        
        let mutableSelf = NSMutableString(string: self)
        let matchOpts = matchingOptions ?? NSRegularExpression.MatchingOptions()
        rex.replaceMatches(in: mutableSelf, options: matchOpts, range: NSMakeRange(0, count), withTemplate: replacement)
        
        return mutableSelf as String
    }
    
    /// 文字列から正規表現パターンに合った箇所を削除した文字列を返す
    /// - Parameters:
    ///   - pattern: 正規表現パターン
    ///   - options: 正規表現オプション
    ///   - matchingOptions: 正規表現マッチングオプション
    /// - Returns: 削除した文字列
    func removeMatched(_ pattern: String, options: NSRegularExpression.Options? = nil, matchingOptions: NSRegularExpression.MatchingOptions? = nil) -> String {
        return replaceMatched(pattern, replacement:"", options: options, matchingOptions: matchingOptions)
    }
}

// MARK: - 変換
extension String {
    
    /// 半角文字を全角文字に変換
    var halfToFull: String {
        return applyingTransform(.fullwidthToHalfwidth, reverse: true) ?? ""
    }
    
    /// 全角文字を半角文字
    var fullToHalf: String {
        return applyingTransform(.fullwidthToHalfwidth, reverse: false) ?? ""
    }
    
    /// カタカタをひらがなに変換
    var katakanaToHiragana: String {
        return applyingTransform(.hiraganaToKatakana, reverse: true) ?? ""
    }
    
    /// ひらがなをカタカナに変換
    var hiraganaToKatakana: String {
        return applyingTransform(.hiraganaToKatakana, reverse: false) ?? ""
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

// MARK: - 構成チェック
extension String {
    
    struct Structure {
        static let number = "0123456789"
        static let lowercaseAlphabet = "abcdefghijklmnopqrstuvwxyz"
        static let uppercaseAlphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        static let whitespace = " "
        static let alphabet = lowercaseAlphabet + uppercaseAlphabet
        static let alphabetNumber = alphabet + number
        static let alphabetAndWhitespace = alphabet + whitespace
        static let alphabetNumberAndWhitespace = alphabetNumber + whitespace
    }
    
    /// 指定した文字のみで構成されているかどうかを返す
    /// - Parameter characters: 指定の文字
    /// - Returns: 指定した文字のみで構成されているかどうか
    func isOnly(characters: String) -> Bool {
        return trimmingCharacters(in: CharacterSet(charactersIn: characters)).isEmpty
    }
    
    /// 半角数字のみで構成されているかどうか
    var isOnlyNumber: Bool {
        return isOnly(characters: Structure.number)
    }
    
    /// 半角小文字英字のみで構成されているかどうか
    var isOnlyLowercasedAlphabet: Bool {
        return isOnly(characters: Structure.lowercaseAlphabet)
    }

    /// 半角大文字英字のみで構成されているかどうか
    var isOnlyUppercaseAlphabet: Bool {
        return isOnly(characters: Structure.uppercaseAlphabet)
    }
    
    /// 半角英字のみで構成されているかどうか
    var isOnlyAlphabet: Bool {
        return isOnly(characters: Structure.alphabet)
    }
    
    /// 半角英数字のみで構成されているかどうか
    var isOnlyAlphabetNumber: Bool {
        return isOnly(characters: Structure.alphabetNumber)
    }
    
    /// 半角英字+半角スペースのみで構成されているかどうか
    var isOnlyAlphabetAndWhitespace: Bool {
        return isOnly(characters: Structure.alphabetAndWhitespace)
    }
    
    /// 半角英数字+半角スペースのみで構成されているかどうか
    var isOnlyAlphabetNumberAndWhitespace: Bool {
        return isOnly(characters: Structure.alphabetNumberAndWhitespace)
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
    
    /// キャメル記法への変換
    var cameled: String {
        if isEmpty { return "" }
        let r = NSMakeRange(0, 1)
        var ret = capitalized.replacingOccurrences(of: "_", with: "")
        ret = (ret as NSString).replacingCharacters(in: r, with: (ret as NSString).substring(with: r).lowercased())
        return ret
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

// MARK: - URLエンコード/デコード
extension String {
    
    /// URLエンコードした文字列
    var urlEncoded: String {
        return addingPercentEncoding(withAllowedCharacters: .alphanumerics) ?? ""
    }
    
    /// URLデコードした文字列
    var urlDecoded: String {
        return removingPercentEncoding ?? ""
    }
}
