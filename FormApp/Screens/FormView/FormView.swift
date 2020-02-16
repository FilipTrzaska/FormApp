import UIKit

final class FormView: View {
    private(set) lazy var topView: InsuranceView = {
        let view = InsuranceView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private(set) lazy var bottomView: CurrentInsuranceView = {
        let view = CurrentInsuranceView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    private(set) lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.keyboardDismissMode = .onDrag
        tableView.tableFooterView = UIView(frame: .zero)
        
        return tableView
    }()
    
    private(set) lazy var navigationView: NavigationButtonsView = {
        let view = NavigationButtonsView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    private(set) lazy var addInsuranceView: AddInsuranceView = {
        let view = AddInsuranceView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 25
        
        return view
    }()
    
    override func setupViewHierarchy() {
        super.setupViewHierarchy()
        [topView, bottomView, tableView, navigationView, addInsuranceView].forEach(addSubview)
    }
    
    override func setupLayoutConstraints() {
        super.setupLayoutConstraints()
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 32),
            topView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 32),
            topView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -32),
            topView.heightAnchor.constraint(equalToConstant: 300),
            
            bottomView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 32),
            bottomView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -32),
            bottomView.heightAnchor.constraint(equalToConstant: 70),
            
            tableView.topAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: 24),
            tableView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 32),
            tableView.bottomAnchor.constraint(equalTo: navigationView.topAnchor),
            
            navigationView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            navigationView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            navigationView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            navigationView.heightAnchor.constraint(equalToConstant: 98),
            
            addInsuranceView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -32),
            addInsuranceView.heightAnchor.constraint(equalToConstant: 50),
            addInsuranceView.widthAnchor.constraint(equalToConstant: 50),
            addInsuranceView.bottomAnchor.constraint(equalTo: navigationView.topAnchor, constant: -60)
            ])
    }
    
}
