import UIKit

final class LoginViewControllerStateMachine: NSObject {
    
    // MARK: - Properties
    
    private weak var controller: LoginViewController?
    private let notificationCenter: NotificationCenter
    
    // MARK: - Lifecycle
    
    init(controller: LoginViewController, notificationCenter: NotificationCenter = .default) {
        self.controller = controller
        self.notificationCenter = notificationCenter
        
        super.init()
    }
    
    // MARK: - Functions
    
    func setup() {
        addKeyboardObservers()
        assignTextFieldDelegates()
        trackTextFieldsEditingChangedEvent()
        updateActionButtonState()
    }
    
    func showErrorAlertView() {
        guard
            let _ = controller?.errorAlertView,
            let topConstraint = controller?.errorAlertViewTopConstraint,
            let bottomConstraint = controller?.errorAlertViewBottomConstraint
            else { return }
        
        UIView.animate(withDuration: ErrorAlertView.animationDuration) {
            NSLayoutConstraint.deactivate([bottomConstraint])
            NSLayoutConstraint.activate([topConstraint])
            self.controller?.view.layoutIfNeeded()
        }
    }
    
    // MARK: Private
    
    private func addKeyboardObservers() {
        notificationCenter.addObserver(self,
                                       selector: #selector(adjustForKeyboard),
                                       name: UIResponder.keyboardWillHideNotification, object: nil)
        
        notificationCenter.addObserver(self,
                                       selector: #selector(adjustForKeyboard),
                                       name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc private func adjustForKeyboard(notification: Notification) {
        if notification.name == UIResponder.keyboardWillHideNotification {
            controller?.scrollView.contentOffset = .zero
        } else {
            let textFieldMaxY = UIResponder.currentFirstResponder?.globalFrame?.maxY ?? 0
            let textFieldBottomPadding: CGFloat = 15
            let keyboardMinY = UIScreen.main.bounds.height - notification.keyboardHeight
            controller?.scrollView.contentOffset.y = max(0, (textFieldMaxY + textFieldBottomPadding) - keyboardMinY)
        }
    }
    
    private func assignTextFieldDelegates() {
        controller?.emailTextEntryView.textField.delegate = self
        controller?.passwordTextEntryView.textField.delegate = self
    }
    
    private func trackTextFieldsEditingChangedEvent() {
        addTargetTrackingTextFieldEditingChangedEvent(to: controller?.emailTextEntryView.textField)
        addTargetTrackingTextFieldEditingChangedEvent(to: controller?.passwordTextEntryView.textField)
    }
    
    private func shouldEnableActionButton() -> Bool {
        let isFormEmailRowTextFieldEmpty: Bool = (controller?.emailTextEntryView.textField.text ?? "").isEmpty
        let isFormPasswordRowTextFieldEmpty: Bool = (controller?.passwordTextEntryView.textField.text ?? "").isEmpty
        
        return !(isFormEmailRowTextFieldEmpty || isFormPasswordRowTextFieldEmpty)
    }
    
    private func addTargetTrackingTextFieldEditingChangedEvent(to textField: UITextField?) {
        textField?.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    private func updateActionButtonState() {
        let shouldEnable = shouldEnableActionButton()
        controller?.actionButton.isEnabled = shouldEnable ? true : false
    }
    
    @objc private func textFieldDidChange() {
        updateActionButtonState()
    }
    
    private func removeErrorAlertViewIfNeeded() {
        guard
            let view = controller?.errorAlertView,
            let topConstraint = controller?.errorAlertViewTopConstraint,
            let bottomConstraint = controller?.errorAlertViewBottomConstraint
            else { return }
        
        UIView.animate(withDuration: ErrorAlertView.animationDuration, animations: {
            NSLayoutConstraint.deactivate([topConstraint])
            NSLayoutConstraint.activate([bottomConstraint])
            self.controller?.view.layoutIfNeeded()
        }) { _ in
            view.removeFromSuperview()
            self.controller?.errorAlertView = nil
            self.controller?.errorAlertViewTopConstraint = nil
            self.controller?.errorAlertViewBottomConstraint = nil
        }
    }
    
}

extension LoginViewControllerStateMachine: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        removeErrorAlertViewIfNeeded()
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
}
