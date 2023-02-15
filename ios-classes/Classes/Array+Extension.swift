import Foundation

extension Array {
    
    /// 安全な要素の取り出し
    subscript(safe index: Int) -> Element? {
        if !isEmpty, 0 <= index, index < count {
            return self[index]
        }
        return nil
    }
    
    /// 指定した要素数の空配列を生成して返す
    /// - Parameter count: 要素数
    /// - Returns: 指定した要素数の空配列
    static func empty(count: Int) -> [Element?] {
        return (0..<count).map { _ -> Element? in return nil }
    }
    
    /// 別の配列を追加する
    /// - Parameter newElements: 追加する配列
    mutating func append(_ newElements: [Element]) {
        append(contentsOf: newElements)
    }
    
    /// 要素を追加した配列を生成して返す
    /// - Parameter newElement: 追加する配列
    /// - Returns: 生成した配列
    func appended(_ newElement: Element) -> [Element] {
        var myself = self
        myself.append(newElement)
        return myself
    }
    
    /// 別の配列を追加した配列を生成して返す
    /// - Parameter newElement: 追加する配列
    /// - Returns: 生成した配列
    func appended(_ newElements: [Element]) -> [Element] {
        var myself = self
        myself.append(contentsOf: newElements)
        return myself
    }
}

extension Array where Element: Equatable {
    
    /// 指定した要素を配列からすべて削除する
    /// - Parameter element: 要素
    mutating func removeAllElements(for element: Element) {
        while let index = firstIndex(of: element) {
            remove(at: index)
        }
    }
    
    /// 指定した要素を配列の先頭から検索して削除する
    /// - Parameter element: 要素
    mutating func removeFirstElement(for element: Element) {
        if let index = firstIndex(of: element) {
            remove(at: index)
        }
    }
    
    /// 指定した要素を配列の末尾から検索して削除する
    /// - Parameter element: 要素
    mutating func removeLastElement(for element: Element) {
        if let index = lastIndex(of: element) {
            remove(at: index)
        }
    }
    
    /// 配列内の指定した要素をすべて置換する
    /// - Parameters:
    ///   - targetElement: 対象の要素
    ///   - replaceElement: 置き換える要素
    mutating func replace(_ targetElement: Element, to replaceElement: Element) {
        while let index = firstIndex(of: targetElement) {
            self[index] = replaceElement
        }
    }
}
