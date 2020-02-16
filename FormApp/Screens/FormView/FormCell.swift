import UIKit

final class FormCell: UITableViewCell {
    lazy var recordView: InsuranceInfoView = {
        let view = InsuranceInfoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewHierarchy()
        setupLayoutConstraints()
        setupProperties()
    }
    
    @available(*,unavailable)
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupViewHierarchy() {
        contentView.addSubview(recordView)
    }
    
    func setupProperties() {
        backgroundColor = .white
        contentView.backgroundColor = .clear
    }
    
    func setupLayoutConstraints() {
        NSLayoutConstraint.activate([
            recordView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            recordView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            recordView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            recordView.heightAnchor.constraint(equalToConstant: 50)
            ])
    }

}
