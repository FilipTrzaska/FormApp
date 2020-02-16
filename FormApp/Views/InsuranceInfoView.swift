import UIKit

final class InsuranceInfoView: View {
    private(set) lazy var name: InsuranceInfoInputView = {
        let view = InsuranceInfoInputView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.titleLabel.text = NSLocalizedString("Nazwa towarzystwa ubezpieczeniowego", comment: "")
        
        return view
    }()
    
    private(set) lazy var type: InsuranceInfoInputView = {
        let view = InsuranceInfoInputView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.titleLabel.text = NSLocalizedString("Rodzaj/typ ubezpieczenia", comment: "")

        return view
    }()
    
    private(set) lazy var sum: InsuranceInfoInputView = {
        let view = InsuranceInfoInputView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.titleLabel.text = NSLocalizedString("Suma ubezpieczenia", comment: "")

        return view
    }()
    
    private(set) lazy var date: InsuranceInfoInputView = {
        let view = InsuranceInfoInputView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.titleLabel.text = NSLocalizedString("Data wejścia w życie", comment: "")

        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
    }
    
    override func setupViewHierarchy() {
        super.setupViewHierarchy()
        [name, type, sum, date].forEach(addSubview)
    }
    
    override func setupLayoutConstraints() {
        super.setupLayoutConstraints()
        NSLayoutConstraint.activate([
            
            name.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            name.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -8),
            name.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            name.heightAnchor.constraint(equalToConstant: 50),

            type.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            type.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 8),
            type.trailingAnchor.constraint(equalTo: sum.layoutMarginsGuide.leadingAnchor, constant: -16),
            type.heightAnchor.constraint(equalToConstant: 50),
            type.widthAnchor.constraint(equalToConstant: 140),

            sum.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            sum.trailingAnchor.constraint(equalTo: date.leadingAnchor, constant: -16),
            sum.heightAnchor.constraint(equalToConstant: 50),
            sum.widthAnchor.constraint(equalTo: type.widthAnchor, multiplier: 1.0),

            date.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            date.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -16),
            date.heightAnchor.constraint(equalToConstant: 50),
            ])
    }
}
