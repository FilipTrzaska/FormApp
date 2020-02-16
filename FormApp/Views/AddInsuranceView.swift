import UIKit

final class AddInsuranceView: View {
    private(set) lazy var add: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "add.png"), for: .normal)
        button.backgroundColor = UIColor.insuranceGray()
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func setupViewHierarchy() {
        super.setupViewHierarchy()
        addSubview(add)
    }
    
    override func setupLayoutConstraints() {
        super.setupLayoutConstraints()
        NSLayoutConstraint.activate([
            add.centerXAnchor.constraint(equalTo: centerXAnchor),
            add.widthAnchor.constraint(equalToConstant: 50),
            add.heightAnchor.constraint(equalToConstant: 50),
            add.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
    }

}
