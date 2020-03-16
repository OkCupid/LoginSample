import UIKit

final class LoginViewControllerStateMachine: NSObject {
    
    // MARK: - Properties
    
    private weak var controller: LoginViewController?
    
    // MARK: - Lifecycle
    
    init(controller: LoginViewController) {
        self.controller = controller
        
        super.init()
    }
    
    // MARK: - Functions
    
    func setup() {
        assignTextFieldDelegates()
        trackTextFieldsEditingChangedEvent()
        updateActionButtonState()
    }
    
    func updateActionButtonState() {
        let shouldEnable = shouldEnableActionButton()
        controller?.actionButton.isEnabled = shouldEnable ? true : false
    }
    
    // MARK: Private
    
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
    
    @objc private func textFieldDidChange() {
        updateActionButtonState()
    }
    
}

extension LoginViewControllerStateMachine: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
}
