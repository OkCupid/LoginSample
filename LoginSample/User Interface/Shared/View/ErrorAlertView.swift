import UIKit

final class ErrorAlertView: UIView {
    
    // MARK: - Properties
    
    private static let font: UIFont = .systemFont(ofSize: 12, weight: .regular)
    private static let lineBreakMode: NSLineBreakMode = .byWordWrapping
    private static let numberOfLines: Int = 0
    private static let padding: UIEdgeInsets = .init(top: 20, left: 20, bottom: 20, right: 20)
    private static let safeAreaTopInset: CGFloat = DeviceInfo.safeAreaTopInset
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = Self.font
        label.lineBreakMode = Self.lineBreakMode
        label.numberOfLines = Self.numberOfLines
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var message: String? {
        didSet {
            label.text = message
        }
    }
    
    // MARK: - Lifecycle

    init(message: String, width: CGFloat) {
        super.init(frame: .zero)
        
        configureView()
        configureLabelConstraints(width: width)
        self.message = message
        label.text = message
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    static func getHeight(text: String, width: CGFloat) -> CGFloat {
        var height: CGFloat = safeAreaTopInset + padding.top + padding.bottom
        let adjustedWidth: CGFloat = width - (padding.left + padding.right)
        let frame: CGRect = .init(x: 0, y: 0, width: adjustedWidth, height: height)
        
        let label:UILabel = UILabel(frame: frame)
        label.numberOfLines = numberOfLines
        label.lineBreakMode = lineBreakMode
        label.font = font
        label.text = text
        label.sizeToFit()
        
        height += label.frame.height
        
        return height
    }
    
    private func configureView() {
        backgroundColor = .red
        addSubview(label)
    }
    
    private func configureLabelConstraints(width: CGFloat) {
        let labelCenterXConstraint: NSLayoutConstraint = label.centerXAnchor.constraint(equalTo: centerXAnchor)
        let labelCenterYConstraint: NSLayoutConstraint = label.centerYAnchor.constraint(equalTo: centerYAnchor, constant: Self.safeAreaTopInset/2)
        let labelWidthConstraint: NSLayoutConstraint = label.widthAnchor.constraint(equalToConstant: width - (Self.padding.left + Self.padding.right))
        
        NSLayoutConstraint.activate([
            labelCenterXConstraint,
            labelCenterYConstraint,
            labelWidthConstraint
        ])
    }

}
