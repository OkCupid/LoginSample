import UIKit

final class LoginTextEntryView: UIView {
    
    // MARK: - Properties
    
    lazy var stackView: UIStackView = .init()
    lazy var titleLabel: UILabel = .init()
    lazy var textField: PaddedTextField = .init()
    
    private let configurator: LoginTextEntryViewConfigurator = .init()
    
    // MARK: - Lifecycle

    init(viewModel: LoginTextEntryViewModel) {
        super.init(frame: .zero)
        
        configurator.configure(view: self, viewModel: viewModel)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
