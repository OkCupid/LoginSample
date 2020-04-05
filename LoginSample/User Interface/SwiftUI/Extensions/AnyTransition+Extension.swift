import SwiftUI

@available(iOS 13.0.0, *)
extension AnyTransition {
    
    static var moveTopEdgeInOutWithOpacity: AnyTransition {
        let insertion = AnyTransition.move(edge: .top)
            .combined(with: .opacity)
        let removal = AnyTransition.move(edge: .top)
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
    
}
