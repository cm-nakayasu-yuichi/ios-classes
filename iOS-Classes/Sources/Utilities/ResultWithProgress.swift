import Foundation
import CoreGraphics

enum ResultWithProgress<Success, Failure> where Failure : Error {

    case success(Success)

    case failure(Failure)
    
    case progress(CGFloat)
}
