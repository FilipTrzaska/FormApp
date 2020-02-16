import UIKit

final class FormViewController: UIViewController {
    private let insurances = InsuranceProvider().getInsurances()
    private var currentInsurances = InsuranceProvider().newInsurances()
    
    private(set) lazy var formView: FormView = {
        let view = FormView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        formView.topView.reason.inputTextField.text = insurances[0].reason
        formView.topView.credit.inputTextField.text = insurances[0].credit
        formView.topView.amount.inputTextField.text = "\(279000)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProperties()
        view.addSubview(formView)

        setupLayoutConstraints()
    }
    
    func setupProperties() {
        formView.navigationView.nextButton.addTarget(self, action: #selector(nextClicked), for: .touchUpInside)
        formView.addInsuranceView.add.addTarget(self, action: #selector(addRecord), for: .touchUpInside)
        
        formView.topView.reason.pickerView.delegate = self
        formView.topView.reason.pickerView.dataSource = self
        formView.topView.reason.pickerView.tag = 1
        formView.topView.reason.inputTextField.inputAccessoryView = setupPickerToolbar()
        
        formView.topView.credit.pickerView.delegate = self
        formView.topView.credit.pickerView.dataSource = self
        formView.topView.credit.pickerView.tag = 2
        formView.topView.credit.inputTextField.inputAccessoryView = setupPickerToolbar()
        
        formView.topView.amount.inputTextField.inputAccessoryView = setupPickerToolbar()
        
        formView.tableView.register(FormCell.self, forCellReuseIdentifier: "formCell")
        formView.tableView.delegate = self
        formView.tableView.dataSource = self
    }
    
    func setupLayoutConstraints() {
        formView.constrainEdges(to: view)
    }
    
    @objc func nextClicked(_ sender: AnyObject?) {
        performSegue(withIdentifier: "summarySegue", sender: nil)
    }
    
    @objc func addRecord(_ sender: AnyObject) {
        currentInsurances.append(NewInsurance(name: "", type: "", amount: "", date: ""))
        formView.tableView.beginUpdates()
        formView.tableView.insertRows(at: [IndexPath(row: currentInsurances.count - 1, section: 0)], with: .automatic)
        formView.tableView.endUpdates()
        currentInsurances.count > 1 ? ( formView.tableView.isEditing = true ) : ( formView.tableView.isEditing = false )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "summarySegue" {
            let viewController = segue.destination as! SummaryViewController
            viewController.newInsurance = Insurance(reason: formView.topView.reason.inputTextField.text, amount: formView.topView.amount.inputTextField.text, credit: formView.topView.credit.inputTextField.text, insurances: currentInsurances)
        }
    }
}

extension FormViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            formView.topView.reason.inputTextField.text = insurances[row].reason
        default:
            formView.topView.credit.inputTextField.text = insurances[row].credit
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return insurances.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return insurances[row].reason
        default:
            return insurances[row].credit
        }
    }
    
}

extension FormViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return indexPath.row == 0 ? false : true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            currentInsurances.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return tableView.isEditing ? .delete : .none
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentInsurances.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "formCell", for: indexPath) as! FormCell
        cell.recordView.name.inputTextField.text = currentInsurances[0].name
        
        cell.recordView.name.inputTextField.delegate = self
        cell.recordView.name.inputTextField.tag = 1

        cell.recordView.type.inputTextField.delegate = self
        cell.recordView.type.inputTextField.tag = 2

        cell.recordView.sum.inputTextField.delegate = self
        cell.recordView.sum.inputTextField.tag = 3

        cell.recordView.date.inputTextField.delegate = self
        cell.recordView.date.inputTextField.tag = 4

        cell.selectedBackgroundView?.backgroundColor = .clear
        
        return cell
    }
    
    func saveInsurance(textField: UITextField) {
        let pointInTable = textField.convert(textField.bounds.origin, to: formView.tableView)
        guard
            let textFieldIndexPath = formView.tableView.indexPathForRow(at: pointInTable),
            let text = textField.text
            else { return }
        
        let row = textFieldIndexPath.row
        
        if (currentInsurances.count - 1) < (row) {
            currentInsurances.append(NewInsurance(name: nil, type: nil, amount: nil, date: nil))
        }

        switch textField.tag {
        case 1:
            currentInsurances[row].name = text
        case 2:
            currentInsurances[row].name = text
        case 3:
            currentInsurances[row].name = text
        default:
            currentInsurances[row].name = text
        }
    }
}

extension FormViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        handleKeyboard()
        textField.inputAccessoryView = setupPickerToolbar()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        handleKeyboard()
        saveInsurance(textField: textField)
    }
    
    func handleKeyboard() {
        if !formView.topView.amount.inputTextField.isEditing {
            if self.formView.frame.origin.y != 0 {
                self.formView.frame.origin.y = 0
            } else {
                self.formView.frame.origin.y -= 320
            }
        }
    }
    
    func setupPickerToolbar() -> UIToolbar {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 44))
        let flexibleSeparator = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonPressed(_:)))
        toolbar.items = [flexibleSeparator, doneButton]
        return toolbar
    }
    
    @objc func doneButtonPressed(_ sender: AnyObject?) {
        self.view.endEditing(true)
    }
}
