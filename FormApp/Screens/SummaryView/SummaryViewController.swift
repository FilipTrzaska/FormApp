import UIKit

final class SummaryViewController: UIViewController {
    var newInsurance: Insurance?
    
    private(set) lazy var summaryView: SummaryView = {
        let view = SummaryView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        summaryView.navigationView.backButton.addTarget(self, action: #selector(backClicked), for: .touchUpInside)
        setupProperties()
        view.addSubview(summaryView)
        setupLayoutConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    func setupProperties() {
        summaryView.tableView.register(FormCell.self, forCellReuseIdentifier: "formCell")
        summaryView.tableView.delegate = self
        summaryView.tableView.dataSource = self
        
        summaryView.reason.titleLabel.text = NSLocalizedString("Cel ubezpieczenia", comment: "")
        summaryView.reason.inputTextField.text = newInsurance?.reason
        
        summaryView.amount.titleLabel.text = NSLocalizedString("Wartość udzielanego kredytu/pożyczki", comment: "")
        summaryView.amount.inputTextField.text = newInsurance?.amount
        
        summaryView.credit.titleLabel.text = NSLocalizedString("Cel kredytu/pożyczki", comment: "")
        summaryView.credit.inputTextField.text = newInsurance?.credit
    }
    
    func setupLayoutConstraints() {
        summaryView.constrainEdges(to: view)
    }
    
    @objc func backClicked(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }

}

extension SummaryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newInsurance?.insurances.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "formCell", for: indexPath) as! FormCell
        
        cell.recordView.name.inputTextField.text = newInsurance?.insurances[indexPath.row].name
        cell.recordView.type.inputTextField.text = newInsurance?.insurances[indexPath.row].type
        cell.recordView.sum.inputTextField.text = newInsurance?.insurances[indexPath.row].amount
        cell.recordView.date.inputTextField.text = newInsurance?.insurances[indexPath.row].date
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    
}
