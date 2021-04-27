import UIKit

struct GasPumpItem {
    var price: Double
    var count: Double
    var fuelType: FuelType
    
}

struct FuelType {
    let type: String
}

enum GasPumpErrors: Error {
    
    case fuelOutOfStock
    case notEnoughMoney
    case wrongFuelType

    var localizedDescription: String {
        switch self {
        case .fuelOutOfStock:
            return "Sorry, fuel out of stock"
        case .notEnoughMoney:
            return "Not enough money to buy a fuel"
        case .wrongFuelType:
            return "Sorry, we don't have this type of fuel"
        }
    }

}

extension GasPumpErrors: CustomStringConvertible {
    var description: String { self.localizedDescription }
}


class GasPump {
    var storage = [
        "BioDiesel": GasPumpItem(price: 3.15, count: 1000.0, fuelType: FuelType(type: "BioDiesel")),
        "Diesel": GasPumpItem(price: 4.15, count: 2300.0, fuelType: FuelType(type: "Diesel")),
        "Regular": GasPumpItem(price: 2.19, count: 5000.0, fuelType: FuelType(type: "Regular")),
        "Premium": GasPumpItem(price: 3.19, count: 5500.0, fuelType: FuelType(type: "Premium")),
        "Super": GasPumpItem(price: 0.0, count: 2000.0, fuelType: FuelType(type: "Super"))
    ]
    
    var moneyDeposited = 0.0
    
// Ниже обрабатываем ошибки при помощи guard let
    
    func refuel(fuelType type: String, count: Double) -> (typeOfFuel: FuelType?, error: GasPumpErrors?) {
        guard let gasPumpItem = storage[type] else {
            return (typeOfFuel:  nil, error: GasPumpErrors.wrongFuelType)
        }
        guard gasPumpItem.count > 0 else {
            return (typeOfFuel:  nil, error: GasPumpErrors.fuelOutOfStock)
        }
        guard gasPumpItem.price <= moneyDeposited else {
            return (typeOfFuel:  nil, error: GasPumpErrors.notEnoughMoney)
        }
        
        moneyDeposited -= gasPumpItem.price * count
        var newItem = gasPumpItem
        newItem.count -= count
        storage[type] = newItem
        print("Refueled \(count) gallons of \(type)")
        //return newItem.fuelType
        return (typeOfFuel: newItem.fuelType, error: nil)
    }


}


let gasPump = GasPump()

gasPump.refuel(fuelType: "Supe", count: 20.0)

gasPump.refuel(fuelType: "Super", count: 20.0)
print(gasPump.storage)

// Ниже обрабатываем ошибки при помощи try/catch

extension GasPump {
    
    func newRefuel(fuelType type: String, count: Double) throws -> FuelType {
        guard let gasPumpItem = storage[type] else {
            throw GasPumpErrors.wrongFuelType
        }
        guard gasPumpItem.count > 0 else {
            throw GasPumpErrors.fuelOutOfStock
    }
        guard gasPumpItem.price <= moneyDeposited else {
            throw GasPumpErrors.notEnoughMoney
        }
        
        moneyDeposited -= gasPumpItem.price * count
        var newItem = gasPumpItem
        newItem.count -= count
        storage[type] = newItem
        print("Refueled \(count) gallons of \(type)")
        return newItem.fuelType
        
        
}
}

do {
    let _ = try gasPump.newRefuel(fuelType: "Super", count: 20.0)
    print("Congrats, you've got refueled")
} catch let error {
    print(error)
}

do {
    let _ = try gasPump.newRefuel(fuelType: "Supe", count: 20.0)
    print("Congrats, you've got refueled")
} catch let error {
    print(error)
}
