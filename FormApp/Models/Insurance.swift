import Foundation

struct NewInsurance {
    var name: String
    var type: String
    var amount: String
    var date: String
    
    init(name: String?, type: String?, amount: String?, date: String?) {
        self.name = name ?? NSLocalizedString("Aviva Towarzystwo Ubezpieczeń Ogólnych SA", comment: "")
        self.type = type ?? NSLocalizedString("Typ 0", comment: "")
        self.amount = amount ?? "279000"
        self.date = date ?? NSLocalizedString("", comment: "")
    }
}
