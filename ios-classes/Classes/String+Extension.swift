import Foundation

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
