import UIKit

struct LoginTextEntryViewConfigurator {
    
    // MARK: - Functions
    
    func configure(view: LoginTextEntryView, viewModel: LoginTextEntryViewModel) {
        configureStackView(view: view, viewModel: viewModel)
        configureTitleLabel(view: view, viewModel: viewModel)
        configureTextField(view: view, viewModel: viewModel)
        configureViewHierarchy(view: view, viewModel: viewModel)
        configureConstraints(view: view, viewModel: viewModel)
    }
    
    // MARK: Private
    
    private func configureStackView(view: LoginTextEntryView, viewModel: LoginTextEntryViewModel) {
        view.stackView.alignment = viewModel.stackModel.alignment
        view.stackView.axis = viewModel.stackModel.axis
        view.stackView.spacing = viewModel.stackModel.spacing
    }

    private func configureTitleLabel(view: LoginTextEntryView, viewModel: LoginTextEntryViewModel) {
        view.titleLabel.font = viewModel.titleModel.font
        view.titleLabel.numberOfLines = viewModel.titleModel.numberOfLines
        view.titleLabel.text = viewModel.titleModel.text
        view.titleLabel.textColor = viewModel.titleModel.textColor
    }

    private func configureTextField(view: LoginTextEntryView, viewModel: LoginTextEntryViewModel) {
        view.textField.padding = viewModel.textFieldModel.padding
        view.textField.autocapitalizationType = viewModel.textFieldModel.autocapitalizationType
        view.textField.autocorrectionType = viewModel.textFieldModel.autocorrectionType
        view.textField.backgroundColor = viewModel.textFieldModel.backgroundColor
        view.textField.font = viewModel.textFieldModel.font
        view.textField.isSecureTextEntry = viewModel.textFieldModel.isSecureTextEntry

        let placeholderText: String = viewModel.textFieldModel.placeholderText
        let placeholderTextColor: UIColor = viewModel.textFieldModel.placeholderTextColor
        view.textField.attributedPlaceholder = NSAttributedString(string: placeholderText,
                                                                  attributes: [.foregroundColor: placeholderTextColor])

        view.textField.layer.cornerRadius = viewModel.textFieldModel.cornerRadius
        view.textField.layer.shadowOpacity = Float(viewModel.textFieldModel.shadowModel.opacity)
        view.textField.layer.shadowColor = viewModel.textFieldModel.shadowModel.color.cgColor
        view.textField.layer.shadowOffset = viewModel.textFieldModel.shadowModel.offset
        view.textField.layer.shadowRadius = viewModel.textFieldModel.shadowModel.radius
    }

    private func configureViewHierarchy(view: LoginTextEntryView, viewModel: LoginTextEntryViewModel) {
        view.addSubview(view.stackView)

        view.stackView.addArrangedSubview(view.titleLabel)
        view.stackView.addArrangedSubview(view.textField)
    }

    private func configureConstraints(view: LoginTextEntryView, viewModel: LoginTextEntryViewModel) {
        view.stackView.translatesAutoresizingMaskIntoConstraints = false

        let stackViewTopConstraint: NSLayoutConstraint = view.stackView.topAnchor.constraint(equalTo: view.topAnchor)
        let stackViewLeadingConstraint: NSLayoutConstraint = view.stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let stackViewBottomConstraint: NSLayoutConstraint = view.stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        let stackViewTrailingConstraint: NSLayoutConstraint = view.stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)

        NSLayoutConstraint.activate([
            stackViewTopConstraint,
            stackViewLeadingConstraint,
            stackViewBottomConstraint,
            stackViewTrailingConstraint
        ])
        
        view.textField.translatesAutoresizingMaskIntoConstraints = false
        
        let textFieldWidthConstraint: NSLayoutConstraint = view.textField.widthAnchor.constraint(equalTo: view.widthAnchor)
        
        NSLayoutConstraint.activate([
            textFieldWidthConstraint
        ])
    }
    
}
