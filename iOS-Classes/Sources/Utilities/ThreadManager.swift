import Foundation
import CoreGraphics

class ThreadManager {
    
    /// メインスレッドで処理を行う
    /// - Parameter block: 処理
    static func main(block: @escaping () -> ()) {
        DispatchQueue.main.async(execute: block)
    }
    
    /// 別スレッドで処理を行う
    /// - Parameter block: 処理
    static func new(block: @escaping () -> ()) {
        DispatchQueue.global(qos: .default).async(execute: block)
    }
    
    /// 別スレッドで処理を行った後にメインスレッドで処理を行う
    /// - Parameters:
    ///   - asynchronousProcess: 別スレッドでの処理
    ///   - completion: メインスレッドでの処理
    static func async(_ asynchronousProcess: @escaping () -> (), completion: @escaping () -> ()) {
        new {
            asynchronousProcess()
            main {
                completion()
            }
        }
    }
    
    /// 非同期にスリープする
    /// - Parameters:
    ///   - interval: スリープする期間
    ///   - block: スリープ後のメインスレッドでの処理
    static func sleepAsync(interval: DispatchTimeInterval, block: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + interval, execute: block)
    }
    
    /// 非同期にスリープする
    /// - Parameters:
    ///   - seconds: スリープする秒数
    ///   - block: スリープ後のメインスレッドでの処理
    static func sleepAsync(seconds: Double, block: @escaping () -> ()) {
        sleepAsync(interval: .microseconds(Int(seconds * 1000000)), block: block)
    }
    
    /// 同期的にスリープする
    /// - Parameter seconds: スリープする秒数
    static func sleepSync(seconds: Double) {
        Darwin.usleep(UInt32(seconds * 1000000))
    }
}
