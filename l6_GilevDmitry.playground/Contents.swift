import UIKit

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

struct queue<T> {
    private var elements: [T] = []
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    mutating func filter(prediction: (T) -> Bool) -> [T] {
        return elements.filter(prediction)
        
    }
        
    mutating func popFirst() -> T? {
        return elements.removeFirst()
    
    }
}
let closureForQueue: (CarProtocol) -> Bool = { $0.model != "3" }

var queueOfCars = queue<SportCar>()
queueOfCars.push(SportCar(Model: "1", Color: "1", Year: 2000, TrunkCapacity: 1, TrunkCapacityUsed: 1, Mileage: 1, EngineStatus: "Started", WindowStatus: "Closed", Transmission: "Manual", RoofStatus: "Closed"))
queueOfCars.push(SportCar(Model: "2", Color: "2", Year: 2000, TrunkCapacity: 1, TrunkCapacityUsed: 1, Mileage: 1, EngineStatus: "Started", WindowStatus: "Closed", Transmission: "Manual", RoofStatus: "Closed"))
queueOfCars.push(SportCar(Model: "3", Color: "3", Year: 2000, TrunkCapacity: 1, TrunkCapacityUsed: 1, Mileage: 1, EngineStatus: "Started", WindowStatus: "Closed", Transmission: "Manual", RoofStatus: "Closed"))
queueOfCars.push(SportCar(Model: "4", Color: "4", Year: 2000, TrunkCapacity: 1, TrunkCapacityUsed: 1, Mileage: 1, EngineStatus: "Started", WindowStatus: "Closed", Transmission: "Manual", RoofStatus: "Closed"))



var filteredCars = queueOfCars.filter(prediction: (closureForQueue))
filteredCars.popLast()
filteredCars.popLast()
filteredCars.popLast()
filteredCars.popLast()

queueOfCars.popFirst()
queueOfCars.popFirst()
queueOfCars.popFirst()
queueOfCars.popFirst()


// Вопросы
// Не до конца освоил дженерики и сабскрипты.
// В дженериках путаюсь как их создавать, особенно с учетом клоужеров
// Что делают сабскрипты и для чего нужны тоже было бы здорово повторить (поэтому опциональное задание 3 не выполнил)
