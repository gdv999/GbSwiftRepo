import UIKit

// Lesson 3/ 1, 2, 3, 4, 5, 6 tasks


enum engineStatus: String {
    case Started = "Engine started"
    case Off = "Engine off"
}

enum windowStatus {
    case Opened, Closed
}

enum Transmission {
    case Auto, Manual
}

enum carActions: String {
    case startEngine = "Start engine"
    case stopEngine = "Stop engine"
    case openWindows = "Open windows"
    case closeWindows = "Close windows"
    case getCargo = "Get 100kg of cargo to trunk"
    case outCargo = "Out 50kg of cargo from trunk"
}

struct sportCar {
    let model: String
    let color: String
    let year: Int
    let trunkCapacity: Double
    var trunkCapacityUsed: Double
    let mileage: Double
    var engineStatus: engineStatus
    var windowStatus: windowStatus
    var transmission: Transmission
    
    
    mutating func carActionList(_ actions: carActions) {
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
        }
    }
    init(model: String, color: String, year: Int, trunkCapacity: Double, trunkCapacityUsed: Double, mileage: Double, engineStatus: engineStatus, windowStatus: windowStatus, transmission: Transmission) {
        self.model = model
        self.color = color
        self.year = year
        self.trunkCapacity = trunkCapacity
        self.trunkCapacityUsed = trunkCapacityUsed
        self.mileage = mileage
        self.engineStatus = engineStatus
        self.windowStatus = windowStatus
        self.transmission = transmission
    }
    
    func printCarSpecs () {
        print("Manufacturer: \(self.model)")
        print("Color: \(self.color)")
        print("Year of manufacture: \(self.year)")
        print("Trunk capacity (liters): \(self.trunkCapacity)")
        print("Trunk space in use (liters): \(self.trunkCapacityUsed)")
        print("Mileage(km): \(self.mileage)")
        print("Status of engine: \(self.engineStatus.rawValue)")
        print("Status of windows: \(self.windowStatus == .Opened ? "Windows open" : "Windows close")")
        print("Transmission: \(self.transmission)")
    }
}


struct truckCar {
    let model: String
    let color: String
    let year: Int
    let trunkCapacity: Double
    var trunkCapacityUsed: Double
    let mileage: Double
    var engineStatus: engineStatus
    var windowStatus: windowStatus
    var transmission: Transmission
    
    mutating func carActionList(_ actions: carActions) {
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
        }
    }
    init(model: String, color: String, year: Int, trunkCapacity: Double, trunkCapacityUsed: Double, mileage: Double, engineStatus: engineStatus, windowStatus: windowStatus, transmission: Transmission) {
        self.model = model
        self.color = color
        self.year = year
        self.trunkCapacity = trunkCapacity
        self.trunkCapacityUsed = trunkCapacityUsed
        self.mileage = mileage
        self.engineStatus = engineStatus
        self.windowStatus = windowStatus
        self.transmission = transmission
    }
    
    func printCarSpecs () {
        print("Manufacturer: \(self.model)")
        print("Color: \(self.color)")
        print("Year of manufacture: \(self.year)")
        print("Trunk capacity (liters): \(self.trunkCapacity)")
        print("Trunk space in use (liters): \(self.trunkCapacityUsed)")
        print("Mileage(km): \(self.mileage)")
        print("Status of engine: \(self.engineStatus.rawValue)")
        print("Status of windows: \(self.windowStatus == .Opened ? "Windows open" : "Windows close")")
        print("Transmission: \(self.transmission)")
    }
    
}


var someCar = sportCar(model: "Mercedes", color: "White", year: 2019, trunkCapacity: 300.0, trunkCapacityUsed: 200.0, mileage: 300, engineStatus: .Started, windowStatus: .Opened, transmission: .Auto)

var someCar1 = sportCar(model: "BMW", color: "Black", year: 2021, trunkCapacity: 600.0, trunkCapacityUsed: 0, mileage: 0, engineStatus: .Off, windowStatus: .Closed, transmission: .Auto)

someCar.printCarSpecs()
someCar.carActionList(.stopEngine)
someCar.carActionList(.getCargo)
someCar.carActionList(.outCargo)
someCar.printCarSpecs()

someCar1.printCarSpecs()
someCar1.carActionList(.startEngine)
someCar1.carActionList(.openWindows)
someCar1.printCarSpecs()


var someTruck = truckCar(model: "Volvo", color: "Silver", year: 2020, trunkCapacity: 5000.0, trunkCapacityUsed: 0, mileage: 7431, engineStatus: .Off, windowStatus: .Opened, transmission: .Manual)

var someTruck1 = truckCar(model: "MAN", color: "Red", year: 2019, trunkCapacity: 9746, trunkCapacityUsed: 8723, mileage: 87627, engineStatus: .Started, windowStatus: .Opened, transmission: .Auto)

someTruck.printCarSpecs()
someTruck.carActionList(.stopEngine)
someTruck.carActionList(.getCargo)
someTruck.carActionList(.outCargo)
someTruck.printCarSpecs()

someTruck1.printCarSpecs()
someTruck1.carActionList(.startEngine)
someTruck1.carActionList(.openWindows)
someTruck1.printCarSpecs()
