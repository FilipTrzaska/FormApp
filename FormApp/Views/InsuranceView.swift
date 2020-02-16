import UIKit

final class InsuranceView: View {
    private(set) lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.insuranceBlue()
        label.textColor = UIColor.white
        label.textAlignment = .left
        label.text = NSLocalizedString("INFORMACJE DODATKOWE", comment: "")
        
        return label
    }()
    
    private(set) lazy var reason: InsurancePickerView = {
        let view = InsurancePickerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.titleLabel.text = NSLocalizedString("Cel ubezpieczenia", comment: "")
//        view.inputTextField.text = NSLocalizedString("Zabezpieczenie zdrowia", comment: "")
        view.clipsToBounds = true
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 8
        
        return view
    }()
    
    private(set) lazy var subtitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = NSLocalizedString("W przypadku zabezpieczenia zielonego kredytu/pożyczki prosimy o poadnie bardziej szczegółowych informacji", comment: "")
        
        return label
    }()
    
    private(set) lazy var amount: InsuranceInputView = {
        let view = InsuranceInputView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.titleLabel.text = NSLocalizedString("Wartość udzielanego kredytu/pożyczki", comment: "")
//        view.inputTextField.text = "\(279000)"
        view.clipsToBounds = true
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 8
        
        return view
    }()
    private(set) lazy var credit: InsurancePickerView = {
        let view = InsurancePickerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.titleLabel.text = NSLocalizedString("Cel kredytu/pożyczki", comment: "")
//        view.inputTextField.text = NSLocalizedString("budowa/zakup domu/mieszkania", comment: "")
        view.clipsToBounds = true
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 8
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
    }
    
    override func setupViewHierarchy() {
        super.setupViewHierarchy()
        [title, reason, subtitle, amount, credit].forEach(addSubview)
    }
    
    override func setupLayoutConstraints() {
        super.setupLayoutConstraints()
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            title.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            title.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            title.heightAnchor.constraint(equalToConstant: 23),
            
            reason.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 48),
            reason.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            reason.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -8),
            reason.heightAnchor.constraint(equalToConstant: 50),
            
            subtitle.topAnchor.constraint(equalTo: reason.bottomAnchor, constant: 24),
            subtitle.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 16),
            subtitle.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            subtitle.heightAnchor.constraint(equalToConstant: 24),
            
            amount.topAnchor.constraint(equalTo: subtitle.bottomAnchor, constant: 24),
            amount.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            amount.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -8),
            amount.heightAnchor.constraint(equalToConstant: 50),
            
            credit.topAnchor.constraint(equalTo: subtitle.bottomAnchor, constant: 24),
            credit.leadingAnchor.constraint(equalTo: amount.trailingAnchor, constant: 16),
            credit.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            credit.heightAnchor.constraint(equalToConstant: 50),
            
            ])
    }
}
