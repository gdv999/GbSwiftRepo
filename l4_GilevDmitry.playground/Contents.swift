import UIKit

// Lesson 4/ 1, 2, 3, 4, 5, 6 tasks


enum EngineStatus: String {
    case Started = "Engine started"
    case Off = "Engine off"
}

enum WindowStatus {
    case Opened, Closed
}

enum Transmission {
    case Auto, Manual
}

enum PanoramicRoofActions {
    case Open, Close
}

enum CarActions: String {
    case startEngine = "Start engine"
    case stopEngine = "Stop engine"
    case openWindows = "Open windows"
    case closeWindows = "Close windows"
    case getCargo = "Get 100kg of cargo to trunk"
    case outCargo = "Out 50kg of cargo from trunk"
    case openRoof = "Open panoramic roof"
    case closeRoof = "Close panoramic roof"
}

class Car {
    let model: String
    let color: String
    let year: Int
    let trunkCapacity: Double
    var trunkCapacityUsed: Double
    let mileage: Double
    var engineStatus: EngineStatus
    var windowStatus: WindowStatus
    var transmission: Transmission
    var roofActions: PanoramicRoofActions
    
    init(model: String, color: String, year: Int, trunkCapacity: Double, trunkCapacityUsed: Double, mileage: Double, engineStatus: EngineStatus, windowStatus: WindowStatus, transmission: Transmission, roofStatus: PanoramicRoofActions) {
        self.model = model
        self.color = color
        self.year = year
        self.trunkCapacity = trunkCapacity
        self.trunkCapacityUsed = trunkCapacityUsed
        self.mileage = mileage
        self.engineStatus = engineStatus
        self.windowStatus = windowStatus
        self.transmission = transmission
        self.roofActions = roofStatus
    }
    
    func carActionList(_ actions: CarActions) {
        switch actions {
        case .startEngine:
            engineStatus = .Started
        case .stopEngine:
            engineStatus = .Off
        case .openWindows:
            windowStatus = .Opened
        case .closeWindows:
            windowStatus = .Closed
        case .getCargo:
            trunkCapacityUsed += 100
        case .outCargo:
            trunkCapacityUsed -= 50
        case .openRoof:
            roofActions = .Open
        case .closeRoof:
            roofActions = .Close
        }
    }
    func printCarSpecs() {
        print("Manufacturer: \(self.model)")
        print("Color: \(self.color)")
        print("Year of manufacture: \(self.year)")
        print("Trunk capacity (liters): \(self.trunkCapacity)")
        print("Trunk space in use (liters): \(self.trunkCapacityUsed)")
        print("Mileage(km): \(self.mileage)")
        print("Status of engine: \(self.engineStatus.rawValue)")
        print("Status of windows: \(self.windowStatus == .Opened ? "Windows open" : "Windows close")")
        print("Transmission: \(self.transmission)")
        print("Roof status: \(self.roofActions)")
    }
}

enum SportCarType {
    case Convertible, Coupe
}
enum SportCarPanoramicRoof {
    case True, False
}

class SportCar: Car {
    var carType: SportCarType
    var carPanoramicRoof: SportCarPanoramicRoof
    
    init(model: String, color: String, year: Int, trunkCapacity: Double, trunkCapacityUsed: Double, mileage: Double, engineStatus: EngineStatus, windowStatus: WindowStatus, transmission: Transmission, type: SportCarType, panoramicRoof: SportCarPanoramicRoof, roofStatus: PanoramicRoofActions) {
        self.carType = type
        self.carPanoramicRoof = panoramicRoof
        
        super.init(model: model, color: color, year: year, trunkCapacity: trunkCapacity, trunkCapacityUsed: trunkCapacityUsed, mileage: mileage, engineStatus: engineStatus, windowStatus: windowStatus, transmission: transmission, roofStatus: roofStatus)
    }
    override func carActionList(_ actions: CarActions) {
        switch actions {
        case .startEngine:
        super.carActionList(.startEngine)
        case .stopEngine:
        super.carActionList(.stopEngine)
        case .openWindows:
        super.carActionList(.openWindows)
        case .closeWindows:
        super.carActionList(.closeWindows)
        case .openRoof:
        super.carActionList(.openRoof)
        case .closeRoof:
        super.carActionList(.closeRoof)
        default: break
    }
    }
    override func printCarSpecs() {
        super.printCarSpecs()
        print("Type of car: \(self.carType)")
        print("Panoramic roof: \(self.carPanoramicRoof)")
    }
}

enum TruckCarCabType {
    case Daycab, Sleepercab
}
enum TruckCarReefer {
    case True, False
}

class TruckCar: Car {
    var cabType: TruckCarCabType
    var reefer: TruckCarReefer
    
    init(model: String, color: String, year: Int, trunkCapacity: Double, trunkCapacityUsed: Double, mileage: Double, engineStatus: EngineStatus, windowStatus: WindowStatus, transmission: Transmission, roofStatus: PanoramicRoofActions, cabType: TruckCarCabType, reefer: TruckCarReefer) {
        self.cabType = cabType
        self.reefer = reefer
        super.init(model: model, color: color, year: year, trunkCapacity: trunkCapacity, trunkCapacityUsed: trunkCapacityUsed, mileage: mileage, engineStatus: engineStatus, windowStatus: windowStatus, transmission: transmission, roofStatus: roofStatus)
    }
    override func carActionList(_ actions: CarActions) {
        switch actions {
        case .startEngine:
        super.carActionList(.startEngine)
        case .stopEngine:
        super.carActionList(.stopEngine)
        case .openWindows:
        super.carActionList(.openWindows)
        case .closeWindows:
        super.carActionList(.closeWindows)
        case .getCargo:
        super.carActionList(.getCargo)
        case .outCargo:
        super.carActionList(.outCargo)
        default: break
    }
    }
    override func printCarSpecs() {
        super.printCarSpecs()
        print("Type of cabine: \(self.cabType)")
        print("Car is reefer: \(self.reefer)")
    }
}

var sportCar1 = SportCar(model: "BMW", color: "Red", year: 2021, trunkCapacity: 600.0, trunkCapacityUsed: 0, mileage: 0, engineStatus: .Off, windowStatus: .Closed, transmission: .Auto, type: .Coupe, panoramicRoof: .True, roofStatus: .Close)

var sportCar2 = SportCar(model: "Porsche", color: "White", year: 2021, trunkCapacity: 400.0, trunkCapacityUsed: 0, mileage: 0, engineStatus: .Off, windowStatus: .Opened, transmission: .Auto, type: .Convertible, panoramicRoof: .False, roofStatus: .Close)

sportCar1.printCarSpecs()
print("________________________________")
sportCar1.carActionList(.openRoof)
sportCar1.printCarSpecs()
print("________________________________")
sportCar2.printCarSpecs()
sportCar2.carActionList(.startEngine)
print("________________________________")
sportCar2.printCarSpecs()
print("________________________________")

var truckCar1 = TruckCar(model: "Volvo", color: "Silver", year: 2020, trunkCapacity: 5784, trunkCapacityUsed: 3789, mileage: 34758, engineStatus: .Started, windowStatus: .Opened, transmission: .Auto, roofStatus: .Close, cabType: .Daycab, reefer: .False)

var truckCar2 = TruckCar(model: "Freightliner", color: "Black", year: 2021, trunkCapacity: 46579, trunkCapacityUsed: 3553, mileage: 3789, engineStatus: .Off, windowStatus: .Closed, transmission: .Auto, roofStatus: .Close, cabType: .Sleepercab, reefer: .True)

truckCar1.printCarSpecs()
print("________________________________")
truckCar1.carActionList(.getCargo)
truckCar1.printCarSpecs()
print("________________________________")
truckCar2.printCarSpecs()
truckCar2.carActionList(.outCargo)
print("________________________________")
truckCar2.printCarSpecs()
