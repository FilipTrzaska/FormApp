import Foundation

struct Insurance {
    let reason: String
    let amount: String
    let credit: String
    let insurances: [NewInsurance]
    
    init(reason: String?, amount: String?, credit: String?, insurances: [NewInsurance]?) {
        self.reason = reason ?? NSLocalizedString("Cel ubezpieczenia 0", comment: "")
        self.amount = amount ?? "279000"
        self.credit = credit ?? NSLocalizedString("Cel kredytu/pożyczki 0", comment: "")
        self.insurances = insurances ?? [NewInsurance]()
    }
}
