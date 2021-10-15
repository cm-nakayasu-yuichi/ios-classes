import Foundation

extension NotificationCenter {
    
    static func add(_ name: NSNotification.Name, handler: @escaping (Notification) -> ()) {
        NotificationCenter.default.addObserver(forName: name, object: nil, queue: nil, using: handler)
    }
    
    static func add(_ name: NSNotification.Name, observer: Any, selector: Selector) {
        NotificationCenter.default.addObserver(observer, selector: selector, name: name, object: nil)
    }
    
    static func post(_ name: NSNotification.Name, object: Any? = nil, userInfo: [AnyHashable : Any]? = nil) {
        NotificationCenter.default.post(name: name, object: object, userInfo: userInfo)
    }
}
