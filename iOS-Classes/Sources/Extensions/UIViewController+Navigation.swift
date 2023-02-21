import UIKit

extension UIViewController {
    
    /// 自身をルートビューコントローラとしたナビゲーションコントローラを返す
    /// - Returns: ナビゲーションコントローラ
    func withinNavigation() -> UIViewController {
        if let navi = navigationController {
            return navi
        }        
        return NavigationController(rootViewController: self)
    }
    
    /// ビューコントローラをナビゲーションにプッシュする
    /// - Parameters:
    ///   - viewController: ビューコントローラ
    /// - Parameter animated: アニメーションするかどうか
    func push(_ viewController: UIViewController, animated: Bool = true) {
        navigationController?.pushViewController(viewController, animated: animated)
    }
    
    /// 複数のビューコントローラを一気にナビゲーションにプッシュする
    /// - Parameters:
    ///   - viewControllers: ビューコントローラの配列
    /// - Parameter animated: アニメーションするかどうか
    func push(_ viewControllers: [UIViewController], animated: Bool = true) {
        viewControllers.enumerated().forEach { i, viewController in
            let animatedInLast = (i == viewControllers.count - 1) ? animated : false
            navigationController?.pushViewController(viewController, animated: animatedInLast)
        }
    }
    
    /// ナビゲーションから先頭のビューコントローラをポップする
    /// - Parameter animated: アニメーションするかどうか
    func pop(animated: Bool = true) {
        navigationController?.popViewController(animated: animated)
    }
    
    /// ナビゲーションから指定のビューコントローラまでポップする
    /// - Parameters:
    ///   - viewController: 指定のビューコントローラ
    /// - Parameter animated: アニメーションするかどうか
    func pop(to viewController: UIViewController, animated: Bool = true) {
        navigationController?.popToViewController(viewController, animated: animated)
    }
    
    /// ナビゲーションをルートビューコントローラまでポップする
    /// - Parameter animated: アニメーションするかどうか
    func popToRoot(animated: Bool = true) {
        navigationController?.popToRootViewController(animated: animated)
    }
}
