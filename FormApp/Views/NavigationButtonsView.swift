import UIKit

final class NavigationButtonsView: View {
    private(set) lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .lightGray
        button.setTitle(NSLocalizedString("Wstecz", comment: ""), for: .normal)
        button.tintColor = .white
        button.clipsToBounds = true
        button.layer.cornerRadius = 25
        
        return button
    }()
    
    private(set) lazy var nextButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.insuranceBlue()
        button.setTitle(NSLocalizedString("Dalej", comment: ""), for: .normal)
        button.tintColor = .white
        button.clipsToBounds = true
        button.layer.cornerRadius = 25
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func setupViewHierarchy() {
        super.setupViewHierarchy()
        [backButton, nextButton].forEach(addSubview)
    }
    
    override func setupLayoutConstraints() {
        super.setupLayoutConstraints()
        NSLayoutConstraint.activate([
            backButton.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor, constant: -24),
            backButton.trailingAnchor.constraint(equalTo: nextButton.leadingAnchor, constant: -16),
            backButton.widthAnchor.constraint(equalToConstant: 200),
            backButton.heightAnchor.constraint(equalToConstant: 50),
            
            nextButton.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor, constant: -24),
            nextButton.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -24),
            nextButton.widthAnchor.constraint(equalToConstant: 200),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
}
