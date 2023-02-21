import UIKit

extension UIViewController {
    
    /// ストーリーボードから自身のビューコントローラをインスタンス化する
    /// - Returns: 自身のビューコントローラ
    ///
    /// `TopViewController`であれば`Top.storyboard`を用意して、その中でイニシャルビューコントローラとしている必要があります。
    /// イニシャルビューコントローラにできない場合は、`instantiate(identifier:)`を使用します
    static func instantiate() -> Self {
        let moduleName = controllerName.replacingOccurrences(of: "ViewController", with: "")
        guard let instance = UIStoryboard(name: moduleName, bundle: nil).instantiateInitialViewController() as? Self else {
            fatalError("UIViewController instantiate() Error. \(controllerName) could not instantiate from storyboard.")
        }
        return instance
    }
    
    /// ストーリーボードIDを指定してストーリーボードから自身のビューコントローラをインスタンス化する
    ///
    /// - Parameter identifier: ストーリーボードID
    /// - Returns: 自身のビューコントローラ
    ///
    /// `TopViewController`であれば`Top.storyboard`を用意して、その中でビューコントローラにIDを振っている必要があります。
    ///
    static func instantiate(identifier: String) -> Self {
        let moduleName = controllerName.replacingOccurrences(of: "ViewController", with: "")
        guard let instance = UIStoryboard(name: moduleName, bundle: nil).instantiateViewController(withIdentifier: identifier) as? Self else {
            fatalError("UIViewController instantiate() Error. \(controllerName) could not instantiate from storyboard.")
        }
        return instance
    }
    
    /// 自身のコントローラ名を返す
    static var controllerName: String {
        return String(describing: self)
    }
    
    /// 自身のコントローラ名を返す
    var controllerName: String {
        return String(describing: type(of: self))
    }
}
