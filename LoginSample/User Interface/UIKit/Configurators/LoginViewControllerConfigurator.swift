import UIKit

struct LoginViewControllerConfigurator {
    
    // MARK: - Functions
    
    func configureViews(for controller: LoginViewController, viewModel: LoginViewModel) {
        configureView(for: controller, viewModel: viewModel)
        configureScrollView(for: controller, viewModel: viewModel)
        configureContentStackView(for: controller, viewModel: viewModel)
        configureImageView(for: controller, viewModel: viewModel)
        configureTitleLabel(for: controller, viewModel: viewModel)
        configureFormStackView(for: controller, viewModel: viewModel)
        configureActionButton(for: controller, viewModel: viewModel)
        configureTapGestureRecognizer(for: controller)
        
        configureViewHierarchy(for: controller, viewModel: viewModel)
        
        configureScrollViewConstraints(for: controller, viewModel: viewModel)
        configureContentStackViewConstraints(for: controller, viewModel: viewModel)
        configureImageViewsConstraints(for: controller, viewModel: viewModel)
        configureTextEntryViewConstraint(for: controller, view: controller.emailTextEntryView, viewModel: viewModel)
        configureTextEntryViewConstraint(for: controller, view: controller.passwordTextEntryView, viewModel: viewModel)
        configureActionButtonConstraint(for: controller, viewModel: viewModel)
    }
    
    func configureErrorAlertView(for controller: LoginViewController, message: String) {
        let view: ErrorAlertView = .init(message: message, width: controller.view.frame.width)
        controller.errorAlertView = view
        controller.errorAlertView?.translatesAutoresizingMaskIntoConstraints = false
        controller.errorAlertView?.isHidden = true
        
        controller.view.addSubview(view)
        
        let height: CGFloat = ErrorAlertView.getHeight(text: message, width: controller.view.frame.width)
        
        let widthConstraint: NSLayoutConstraint = view.widthAnchor.constraint(equalToConstant: controller.view.frame.width)
        let heightConstraint: NSLayoutConstraint = view.heightAnchor.constraint(equalToConstant: height)
        let centerXConstraint: NSLayoutConstraint = view.centerXAnchor.constraint(equalTo: controller.view.centerXAnchor)
        let topConstraint: NSLayoutConstraint = view.topAnchor.constraint(equalTo: controller.view.topAnchor)
        let bottomConstraint: NSLayoutConstraint = view.bottomAnchor.constraint(equalTo: controller.view.topAnchor)
        
        controller.errorAlertViewTopConstraint = topConstraint
        controller.errorAlertViewBottomConstraint = bottomConstraint
        
        NSLayoutConstraint.activate([
            widthConstraint,
            heightConstraint,
            centerXConstraint,
            bottomConstraint
        ])
        
        controller.view.layoutIfNeeded()
        controller.errorAlertView?.isHidden = false
    }
    
    // MARK: Private
    
    private func configureView(for controller: LoginViewController, viewModel: LoginViewModel) {
        controller.view.backgroundColor = viewModel.backgroundColor
    }
       
    private func configureScrollView(for controller: LoginViewController, viewModel: LoginViewModel) {
        if #available(iOS 11.0, *) {
            controller.scrollView.contentInsetAdjustmentBehavior = .never
        } else {
            controller.parent?.automaticallyAdjustsScrollViewInsets = false
        }
        
        controller.scrollView.translatesAutoresizingMaskIntoConstraints = false
    }
   
    private func configureContentStackView(for controller: LoginViewController, viewModel: LoginViewModel) {
        controller.contentStackView.alignment = viewModel.contentStackModel.alignment
        controller.contentStackView.axis = viewModel.contentStackModel.axis
        controller.contentStackView.spacing = viewModel.contentStackModel.spacing
        controller.contentStackView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configureImageView(for controller: LoginViewController, viewModel: LoginViewModel) {
        controller.imageView.image = UIImage(named: viewModel.imageModel.name) ?? UIImage()
        controller.imageView.contentMode = viewModel.imageModel.contentMode
        controller.imageView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configureTitleLabel(for controller: LoginViewController, viewModel: LoginViewModel) {
        controller.titleLabel.font = viewModel.titleModel.font
        controller.titleLabel.numberOfLines = viewModel.titleModel.numberOfLines
        controller.titleLabel.text = viewModel.titleModel.text
        controller.titleLabel.textColor = viewModel.titleModel.textColor
    }

    private func configureFormStackView(for controller: LoginViewController, viewModel: LoginViewModel) {
        controller.formStackView.alignment = viewModel.formStackModel.alignment
        controller.formStackView.axis = viewModel.formStackModel.axis
        controller.formStackView.spacing = viewModel.formStackModel.spacing
    }

    private func configureActionButton(for controller: LoginViewController, viewModel: LoginViewModel) {
        let imageWidth: CGFloat = getContentWidth(for: controller, viewModel: viewModel)
        let imageHeight: CGFloat = viewModel.buttonModel.height
        let imageSize: CGSize = .init(width: imageWidth, height: imageHeight)
        
        let backgroundImage = UIImage(color: viewModel.buttonModel.backgroundColor, size: imageSize)
        let highlightedBackgroundImage = UIImage(color: viewModel.buttonModel.highlightedBackgroundColor, size: imageSize)
        let disabledBackgroundImage = UIImage(color: viewModel.buttonModel.disabledBackgroundColor, size: imageSize)
        
        controller.actionButton.setBackgroundImage(backgroundImage, for: .normal)
        controller.actionButton.setBackgroundImage(highlightedBackgroundImage, for: .highlighted)
        controller.actionButton.setBackgroundImage(disabledBackgroundImage, for: .disabled)
        
        controller.actionButton.setTitle(viewModel.buttonModel.title, for: .normal)
        controller.actionButton.setTitleColor(viewModel.buttonModel.titleColor, for: .normal)
        controller.actionButton.titleLabel?.font = viewModel.buttonModel.titleFont
        controller.actionButton.layer.cornerRadius = viewModel.buttonModel.cornerRadius
        controller.actionButton.clipsToBounds = true
        controller.actionButton.translatesAutoresizingMaskIntoConstraints = false
        
        controller.actionButton.addTarget(controller, action: #selector(controller.actionButtonTapped), for: .touchUpInside)
    }
    
    private func configureTapGestureRecognizer(for controller: LoginViewController) {
        controller.view.addGestureRecognizer(controller.viewTapGestureRecognizer)
    }

    private func configureViewHierarchy(for controller: LoginViewController, viewModel: LoginViewModel) {
       controller.view.addSubview(controller.scrollView)
       
       controller.scrollView.addSubview(controller.contentStackView)
       
       controller.contentStackView.addArrangedSubview(controller.imageView)
       controller.contentStackView.addArrangedSubview(controller.titleLabel)
       controller.contentStackView.addArrangedSubview(controller.formStackView)
       controller.contentStackView.addArrangedSubview(controller.actionButton)
       
       controller.formStackView.addArrangedSubview(controller.emailTextEntryView)
       controller.formStackView.addArrangedSubview(controller.passwordTextEntryView)
    }


    private func configureScrollViewConstraints(for controller: LoginViewController, viewModel: LoginViewModel) {
        let topConstraint: NSLayoutConstraint = controller.scrollView.topAnchor.constraint(equalTo: controller.view.topAnchor)
        let leadingConstraint: NSLayoutConstraint = controller.scrollView.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor)
        let bottomConstraint: NSLayoutConstraint = controller.scrollView.bottomAnchor.constraint(equalTo: controller.view.bottomAnchor)
        let trailingConstraint: NSLayoutConstraint = controller.scrollView.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor)
        
        NSLayoutConstraint.activate([
            topConstraint,
            leadingConstraint,
            bottomConstraint,
            trailingConstraint
        ])
    }
    
    private func configureContentStackViewConstraints(for controller: LoginViewController, viewModel: LoginViewModel) {
        let topConstraint: NSLayoutConstraint = controller.contentStackView.topAnchor.constraint(equalTo: controller.scrollView.topAnchor, constant: viewModel.contentStackModel.edgeInsets.top)
        let leadingConstraint: NSLayoutConstraint = controller.contentStackView.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: viewModel.contentStackModel.edgeInsets.left)
        let bottomConstraint: NSLayoutConstraint = controller.contentStackView.bottomAnchor.constraint(lessThanOrEqualTo: controller.scrollView.bottomAnchor, constant: -viewModel.contentStackModel.edgeInsets.bottom)
        let trailingConstraint: NSLayoutConstraint = controller.contentStackView.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: -viewModel.contentStackModel.edgeInsets.right)
        
        NSLayoutConstraint.activate([
            topConstraint,
            leadingConstraint,
            bottomConstraint,
            trailingConstraint
        ])
    }
    
    private func configureImageViewsConstraints(for controller: LoginViewController, viewModel: LoginViewModel) {
        let heightConstraint: NSLayoutConstraint = controller.imageView.heightAnchor.constraint(equalToConstant: viewModel.imageModel.height)
        let widthConstraint: NSLayoutConstraint = controller.imageView.widthAnchor.constraint(equalToConstant: 0)
        
        let imageSize = (controller.imageView.image ?? UIImage()).size
        widthConstraint.constant = (imageSize.width * viewModel.imageModel.height) / imageSize.height
        
        NSLayoutConstraint.activate([
            heightConstraint,
            widthConstraint
        ])
    }
    
    private func configureTextEntryViewConstraint(for controller: LoginViewController, view: UIView, viewModel: LoginViewModel) {
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let widthConstraint: NSLayoutConstraint = view.widthAnchor.constraint(equalToConstant: getContentWidth(for: controller, viewModel: viewModel))
        
        NSLayoutConstraint.activate([
            widthConstraint
        ])
    }
    
    private func configureActionButtonConstraint(for controller: LoginViewController, viewModel: LoginViewModel) {
        let heightConstraint: NSLayoutConstraint = controller.actionButton.heightAnchor.constraint(equalToConstant: viewModel.buttonModel.height)
        let widthConstraint: NSLayoutConstraint = controller.actionButton.widthAnchor.constraint(equalToConstant: getContentWidth(for: controller, viewModel: viewModel))
        
        NSLayoutConstraint.activate([
            heightConstraint,
            widthConstraint
        ])
    }
    
    private func getContentWidth(for controller: LoginViewController, viewModel: LoginViewModel) -> CGFloat {
        let horizontalInsets = viewModel.contentStackModel.edgeInsets.left + viewModel.contentStackModel.edgeInsets.right
        
        return controller.view.frame.width - horizontalInsets
    }
    
}
