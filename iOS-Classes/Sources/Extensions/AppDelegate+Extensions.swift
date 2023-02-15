import UIKit

extension AppDelegate {
    
    /// シングルトンオブジェクト
    static var shared: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    /// 画面全体を指定のビューコントローラに変更する
    /// - Parameter controller: 変更するビューコントローラ
    func change(to controller: UIViewController) {
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
    }
    
    /// ウィンドウシーンの取得
    var windowScene: UIWindowScene? {
        return UIApplication.shared.connectedScenes.first as? UIWindowScene
    }
    
    /// キーウィンドウの取得
    var keyWindow: UIWindow? {
        return windowScene?.windows.first(where: { $0.isKeyWindow })
    }
    
    /// ステータスバーの高さを取得
    var statusBarHeight: CGFloat {
        return windowScene?.statusBarManager?.statusBarFrame.height ?? 0
    }
    
    /// セーフエリアのインセット
    var safeAreaInsets: UIEdgeInsets {
        return keyWindow?.safeAreaInsets ?? .zero
    }
}

extension AppDelegate {
    
    /// 指定したクラスのビューコントローラが画面トップに存在するかを検索する
    /// - Parameter type: 検索するビューコントローラのクラス
    /// - Returns: ビューコントローラ。見つからなかった場合はnil
    func searchTopViewController<T: UIViewController>(type: T.Type) -> T? {
        return searchTopViewControllerRecursive(targetViewController: keyWindow?.rootViewController) as? T
    }
    
    private func searchTopViewControllerRecursive(targetViewController: UIViewController?) -> UIViewController? {
        if let navigationController = targetViewController as? UINavigationController,
           let visibleViewController = navigationController.visibleViewController {
            return searchTopViewControllerRecursive(targetViewController: visibleViewController)
        }
        
        if let tabBarController = targetViewController as? UITabBarController,
           let selectedViewController = tabBarController.selectedViewController {
            return searchTopViewControllerRecursive(targetViewController: selectedViewController)
        }
        
        if let presentedViewController = targetViewController?.presentedViewController {
            return searchTopViewControllerRecursive(targetViewController: presentedViewController)
        }
        
        return targetViewController
    }
}
