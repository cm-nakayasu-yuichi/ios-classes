import UIKit

class NavigationController: UINavigationController {
    
    struct Appearance {
        static let backgroundColor: UIColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        static let normalForegroundColor: UIColor = .white
        static let disabledForegroundColor: UIColor = .lightText
        static let highlightedForegroundColor: UIColor = .label
        static let focusedForegroundColor: UIColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        configureAppearance()
    }
    
    private func configureAppearance() {
        if #available(iOS 13.0, *) {
            let navigationBarAppearance = createCustomNavigationBarAppearance()
                
            let appearance = UINavigationBar.appearance()
            appearance.scrollEdgeAppearance = navigationBarAppearance
            appearance.compactAppearance = navigationBarAppearance
            appearance.standardAppearance = navigationBarAppearance
            
            if #available(iOS 15.0, *) {
                appearance.compactScrollEdgeAppearance = navigationBarAppearance
            }
        } else {
            navigationBar.tintColor = Appearance.normalForegroundColor
            navigationBar.barTintColor = Appearance.backgroundColor
            navigationBar.isTranslucent = false
            navigationBar.titleTextAttributes = [.foregroundColor : Appearance.normalForegroundColor]
        }
        
        navigationBar.layer.shadowOffset = CGSize(width: 0, height: 4)
        navigationBar.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        navigationBar.layer.shadowOpacity = 0.1
        navigationBar.layer.shadowRadius = 3
    }
    
    @available(iOS 13.0, *)
    func createCustomNavigationBarAppearance() -> UINavigationBarAppearance {
        let customNavBarAppearance = UINavigationBarAppearance()
        // 背景
        customNavBarAppearance.configureWithOpaqueBackground()
        customNavBarAppearance.backgroundColor = Appearance.backgroundColor
        // タイトル文字
        customNavBarAppearance.titleTextAttributes = [.foregroundColor: Appearance.normalForegroundColor]
        customNavBarAppearance.largeTitleTextAttributes = [.foregroundColor: Appearance.normalForegroundColor]

        // ナビゲーションバーボタン
        let barButtonItemAppearance = UIBarButtonItemAppearance(style: .plain)
        barButtonItemAppearance.normal.titleTextAttributes = [.foregroundColor: Appearance.normalForegroundColor]
        barButtonItemAppearance.disabled.titleTextAttributes = [.foregroundColor: UIColor.lightText]
        barButtonItemAppearance.highlighted.titleTextAttributes = [.foregroundColor: UIColor.label]
        barButtonItemAppearance.focused.titleTextAttributes = [.foregroundColor: Appearance.normalForegroundColor]
        customNavBarAppearance.buttonAppearance = barButtonItemAppearance
        customNavBarAppearance.backButtonAppearance = barButtonItemAppearance
        customNavBarAppearance.doneButtonAppearance = barButtonItemAppearance
        
        return customNavBarAppearance
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
