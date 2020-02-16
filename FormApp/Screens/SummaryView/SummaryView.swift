import UIKit

final class SummaryView: View {
    private(set) lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.keyboardDismissMode = .onDrag
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.isUserInteractionEnabled = false
        
        return tableView
    }()
    
    private(set) lazy var navigationView: NavigationButtonsView = {
        let view = NavigationButtonsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backButton.backgroundColor = UIColor.insuranceBlue()
        view.nextButton.backgroundColor = .lightGray
        
        return view
    }()
    
    private(set) lazy var reason: InsuranceInputView = {
        let view = InsuranceInputView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = false
        
        return view
    }()
    
    private(set) lazy var amount: InsuranceInputView = {
        let view = InsuranceInputView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = false
        
        return view
    }()
    
    private(set) lazy var credit: InsuranceInputView = {
        let view = InsuranceInputView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = false
        
        return view
    }()
    
    override func setupViewHierarchy() {
        super.setupViewHierarchy()
        [navigationView, reason, amount, credit, tableView].forEach(addSubview)
    }
    
    override func setupLayoutConstraints() {
        super.setupLayoutConstraints()
        NSLayoutConstraint.activate([
            reason.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 24),
            reason.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 32),
            reason.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -48),
            reason.heightAnchor.constraint(equalToConstant: 50),
            
            amount.topAnchor.constraint(equalTo: reason.bottomAnchor, constant: 24),
            amount.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 32),
            amount.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -48),
            amount.heightAnchor.constraint(equalToConstant: 50),
            
            credit.topAnchor.constraint(equalTo: amount.bottomAnchor, constant: 24),
            credit.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 32),
            credit.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -48),
            credit.heightAnchor.constraint(equalToConstant: 50),
            
            tableView.topAnchor.constraint(equalTo: credit.bottomAnchor, constant: 32),
            tableView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 24),
            tableView.bottomAnchor.constraint(equalTo: navigationView.topAnchor),
            
            navigationView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            navigationView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            navigationView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            navigationView.heightAnchor.constraint(equalToConstant: 98)
            ])
    }
}
