import Foundation

protocol InsuranceProviderProtocol {
    func getInsurances() -> [Insurance]
    func newInsurances() -> [NewInsurance]
}

final class InsuranceProvider: InsuranceProviderProtocol {
    func newInsurances() -> [NewInsurance] {
        var insurances = [NewInsurance]()
        insurances.append(NewInsurance(
            name: "Aviva Towarzystwo Ubezpieczeń Ogólnych SA",
            type: "",
            amount: "",
            date: ""
        ))
        return insurances
        
    }
    
    func getInsurances() -> [Insurance] {
        var insurances = [Insurance]()
        
        insurances.append(Insurance(
            reason: "Cel ubezpieczenia 1",
            amount: "279000",
            credit: "Cel kredytu/pożyczki 1",
            insurances: [NewInsurance]()
        ))
        
        insurances.append(Insurance(
            reason: "Cel ubezpieczenia 2",
            amount: "280000",
            credit: "Cel kredytu/pożyczki 2",
            insurances: [NewInsurance]()
        ))
        
        insurances.append(Insurance(
            reason: "Cel ubezpieczenia 3",
            amount: "281000",
            credit: "Cel kredytu/pożyczki 3",
            insurances: [NewInsurance]()
        ))
        
        insurances.append(Insurance(
            reason: "Cel ubezpieczenia 4",
            amount: "282000",
            credit: "Cel kredytu/pożyczki 4",
            insurances: [NewInsurance]()
        ))
        
        return insurances
    }
    
    
}
