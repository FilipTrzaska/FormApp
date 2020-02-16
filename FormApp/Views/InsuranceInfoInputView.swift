import UIKit

final class InsuranceInfoInputView: InsuranceInputView {
    private(set) lazy var underline: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.insuranceGreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
     override init(frame: CGRect) {
         super.init(frame: frame)
         layer.maskedCorners = [ .layerMaxXMinYCorner, .layerMinXMinYCorner ]
     }
    
    override func setupViewHierarchy() {
        super.setupViewHierarchy()
        addSubview(underline)
    }
    
    override func setupLayoutConstraints() {
        super.setupLayoutConstraints()
        NSLayoutConstraint.activate([
            underline.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: -8),
            underline.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor, constant: 8),
            underline.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: 8),
            underline.heightAnchor.constraint(equalToConstant: 4)
            ])
    }
}
