import UIKit

final class InsurancePickerView: InsuranceInputView {
    private(set) lazy var pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        
        return pickerView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        inputTextField.inputView = pickerView
    }
}
