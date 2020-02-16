import UIKit

class View: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewHierarchy()
        setupLayoutConstraints()
    }
    
    func setupViewHierarchy() {}
    
    func setupLayoutConstraints() {}
    
    @available(*,unavailable) required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIView {
    func constrainEdges(to view: UIView, insets: UIEdgeInsets = .zero) {
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -insets.bottom),
            leftAnchor.constraint(equalTo: view.leftAnchor, constant: insets.left),
            rightAnchor.constraint(equalTo: view.rightAnchor, constant: -insets.right),
            ])
    }
}
