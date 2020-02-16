import UIKit

final class CurrentInsuranceView: View {
    private(set) lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15)
        label.text = NSLocalizedString("Posiadane umowy ubezpieczenia na życie:", comment: "")
        
        return label
    }()
    
    private(set) lazy var topSeparator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func setupViewHierarchy() {
        super.setupViewHierarchy()
        [title, topSeparator].forEach(addSubview)
    }
    
    override func setupLayoutConstraints() {
        super.setupLayoutConstraints()
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            title.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 16),
            title.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            title.heightAnchor.constraint(equalToConstant: 20),
            
            topSeparator.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 24),
            topSeparator.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            topSeparator.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            topSeparator.heightAnchor.constraint(equalToConstant: 1)
            ])
    }
}
