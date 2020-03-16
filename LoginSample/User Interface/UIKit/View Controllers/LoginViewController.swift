import UIKit

final class LoginViewController: UIViewController {
    
    private let viewModel: LoginViewModel
    private weak var dataManager: LoginDataManager?
    private weak var delegate: LoginViewDelegate?
    private let configurator: LoginViewControllerConfigurator = .init()
    
    lazy var scrollView: UIScrollView = .init()
    lazy var imageView: UIImageView = .init()
    lazy var contentStackView: UIStackView = .init()
    lazy var titleLabel: UILabel = .init()
    lazy var formStackView: UIStackView = .init()
    lazy var actionButton: UIButton = .init()
    
    private lazy var stateMachine: LoginViewControllerStateMachine = {
        .init(controller: self)
    }()
    
    lazy var emailTextEntryView: LoginTextEntryView = {
        .init(viewModel: viewModel.emailTextEntryModel)
    }()
    
    lazy var passwordTextEntryView: LoginTextEntryView = {
        .init(viewModel: viewModel.passwordTextEntryModel)
    }()
    
    lazy var viewTapGestureRecognizer: UITapGestureRecognizer = {
        .init(target: view, action: #selector(UIView.endEditing(_:)))
    }()
    
    // MARK: - Lifecycle

    init(viewModel: LoginViewModel = LoginViewModelFactory.create(),
         dataManager: LoginDataManager?,
         delegate: LoginViewDelegate?) {
        
        self.viewModel = viewModel
        self.dataManager = dataManager
        self.delegate = delegate
        
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configureViews(for: self, viewModel: viewModel)
        stateMachine.setup()
    }

    // MARK: - Functions
    
    @objc func actionButtonTapped() {
        guard
            let email = emailTextEntryView.textField.text,
            let password = passwordTextEntryView.textField.text
            else { return }

        dataManager?.createLogin(email: email, password: password) { (result) in
            switch result {
            case .success(let login):
                self.delegate?.didLogin(login)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
