import UIKit

// Lesson 5 – Homework

protocol CarProtocol: class {
    var model: String { get }
    var color: String { get }
    var year: Int { get }
    var trunkCapacity: Double { get }
    var trunkCapacityUsed: Double { get set }
    var mileage: Double { get }
    var engineStatus: String { get set }
    var windowStatus: String { get set }
    var transmission: String { get set }
    
    func carActionList()
}
extension CarProtocol {
    func startEngine() {
        engineStatus = "Start"
    }
    func stoptEngine() {
        engineStatus = "Stop"
    }
    func openWindow() {
        windowStatus = "Open"
    }
    func closeWindow() {
        windowStatus = "Close"
    }
    func setTransmissionToAuto() {
        transmission = "Auto"
    }
    func setTransmissionToManual() {
        engineStatus = "Manual"
    }
}
class SportCar: CarProtocol {
    let model: String
    let color: String
    let year: Int
    let trunkCapacity: Double
    var trunkCapacityUsed: Double
    let mileage: Double
    var engineStatus: String
    var windowStatus: String
    var transmission: String
    var panoramicRoofStatus: String
    
    init(Model: String, Color: String, Year: Int, TrunkCapacity: Double, TrunkCapacityUsed: Double, Mileage: Double, EngineStatus: String, WindowStatus: String, Transmission: String, RoofStatus: String) {
        self.model = Model
        self.color = Color
        self.year = Year
        self.trunkCapacity = TrunkCapacity
        self.trunkCapacityUsed = TrunkCapacityUsed
        self.mileage = Mileage
        self.engineStatus = EngineStatus
        self.windowStatus = WindowStatus
        self.transmission = Transmission
        self.panoramicRoofStatus = RoofStatus
    }
    func carActionList() {
        startEngine()
        stoptEngine()
        openWindow()
        closeWindow()
        setTransmissionToAuto()
        setTransmissionToManual()
    }
    func openRoof() {
        panoramicRoofStatus = "Open"
    }
    func closeRoof() {
        panoramicRoofStatus = "Close"
    }
}
class TruckCar: CarProtocol {
    let model: String
    let color: String
    let year: Int
    let trunkCapacity: Double
    var trunkCapacityUsed: Double
    let mileage: Double
    var engineStatus: String
    var windowStatus: String
    var transmission: String
    var truckIsTanker: String
    
    init(Model: String, Color: String, Year: Int, TrunkCapacity: Double, TrunkCapacityUsed: Double, Mileage: Double, EngineStatus: String, WindowStatus: String, Transmission: String, Tunkertruck: String) {
        self.model = Model
        self.color = Color
        self.year = Year
        self.trunkCapacity = TrunkCapacity
        self.trunkCapacityUsed = TrunkCapacityUsed
        self.mileage = Mileage
        self.engineStatus = EngineStatus
        self.windowStatus = WindowStatus
        self.transmission = Transmission
        self.truckIsTanker = Tunkertruck
    }
    func carActionList() {
        startEngine()
        stoptEngine()
        openWindow()
        closeWindow()
        setTransmissionToAuto()
        setTransmissionToManual()
    }
    func setTruckAsTanker() {
        truckIsTanker = "True"
    }
    func setTruckAsNonTanker() {
        truckIsTanker = "False"
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "Model: \(model),\nColor: \(color),\nYear: \(year),\nTrunk capacity: \(trunkCapacity),\nUsed trunk space: \(trunkCapacityUsed),\nMileage: \(mileage),\nEngine status: \(engineStatus),\nWindow status: \(windowStatus),\nTransmission: \(transmission),\nRoof status: \(panoramicRoofStatus)"
    }
}
extension TruckCar: CustomStringConvertible {
    var description: String {
        return "Model: \(model),\nColor: \(color),\nYear: \(year),\nTrunk capacity: \(trunkCapacity),\nUsed trunk space: \(trunkCapacityUsed),\nMileage: \(mileage),\nEngine status: \(engineStatus),\nWindow status: \(windowStatus),\nTransmission: \(transmission),\nTruck is a tanker: \(truckIsTanker)"
    }
}

var car1 = SportCar(Model: "BMW", Color: "White", Year: 2021, TrunkCapacity: 6665, TrunkCapacityUsed: 76, Mileage: 765, EngineStatus: "Start", WindowStatus: "Close", Transmission: "Auto", RoofStatus: "Close")

var car2 = SportCar(Model: "Porsche", Color: "Red", Year: 2021, TrunkCapacity: 500, TrunkCapacityUsed: 0, Mileage: 0, EngineStatus: "Start", WindowStatus: "Open", Transmission: "Manual", RoofStatus: "Open")

print(car1.description)
car1.openRoof()
car1.openWindow()
print("_______________________")
print(car1.description)
print("_______________________")
print(car2.description)
car2.closeRoof()
car2.setTransmissionToAuto()
print("_______________________")
print(car2.description)
print("_______________________")

var truckCar1 = TruckCar(Model: "Frightliner", Color: "Silver", Year: 2020, TrunkCapacity: 20076, TrunkCapacityUsed: 3763, Mileage: 27667, EngineStatus: "Start", WindowStatus: "Open", Transmission: "Auto", Tunkertruck: "False")

var truckCar2 = TruckCar(Model: "Volvo", Color: "Black", Year: 2020, TrunkCapacity: 87687, TrunkCapacityUsed: 6558, Mileage: 76556, EngineStatus: "Off", WindowStatus: "Close", Transmission: "Manual", Tunkertruck: "True")

print(truckCar1.description)
truckCar1.setTruckAsTanker()
truckCar1.closeWindow()
print("_______________________")
print(truckCar1.description)
print("_______________________")
print(truckCar2.description)
truckCar2.setTruckAsNonTanker()
truckCar2.setTransmissionToAuto()
print("_______________________")
print(truckCar2.description)
