import UIKit

class DialogBehavior {
    
    var animationDuration: TimeInterval = 0.25
    
    var overlayTapDismissalEnabled = true
    
    var overlayColor = UIColor.black.withAlphaComponent(0.5)
    
    var overlayIsBlur = false
    
    var overlayBlurEffectStyle: UIBlurEffect.Style = .regular
    
    var overlayBlurAlpha: CGFloat = 1.0
    
    var fixedSize: CGSize?
    
    var presentation: DialogAnimatedTransitioning? {
        return nil
    }
    
    var dismissal: DialogAnimatedTransitioning? {
        return nil
    }
    
    func frame(containerSize: CGSize, presentedSize: CGSize) -> CGRect {
        let origin = CGPoint(
            x: (containerSize.width  - presentedSize.width)  / 2,
            y: (containerSize.height - presentedSize.height) / 2
        )
        return CGRect(origin: origin, size: presentedSize)
    }
}

extension DialogBehavior {
    enum Name {
        case none
        case rightDraw(width: CGFloat = 200)
        case leftDraw(width: CGFloat = 200)
        case topDraw(height: CGFloat = 250)
        case bottomDraw(height: CGFloat = 250)
        case zoom(scale: CGFloat = 0.25)
        case riseup(offset: CGFloat = 30)
        case fade
        
        func instantiate() -> DialogBehavior {
            switch self {
            case .none:
                return DialogNoneBehavior()
            case .rightDraw(let width):
                return DialogRightDrawBehavior(width: width)
            case .leftDraw(let width):
                return DialogLeftDrawBehavior(width: width)
            case .topDraw(let height):
                return DialogTopDrawBehavior(height: height)
            case .bottomDraw(let height):
                return DialogBottomDrawBehavior(height: height)
            case .zoom(let scale):
                return DialogZoomBehavior(scale: scale)
            case .riseup(let offset):
                return DialogRiseupBehavior(offset: offset)
            case .fade:
                return DialogFadeBehavior()
            }
        }
    }
}
