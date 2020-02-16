import UIKit

class InsuranceInputView: View {
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 9)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var inputTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.insuranceGray()
        clipsToBounds = true
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 8
    }
    
    override func setupViewHierarchy() {
        super.setupViewHierarchy()
        [titleLabel, inputTextField].forEach(addSubview)
    }
    
    override func setupLayoutConstraints() {
        super.setupLayoutConstraints()
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 12),
            
            inputTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            inputTextField.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 24),
            inputTextField.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -24),
            inputTextField.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor)
            ])
    }
}
