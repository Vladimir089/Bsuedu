
import Foundation

var mainInfoArray: [String] = []

protocol Corpus {
    //откуда
    var number: Int? {get set}
    var etaz: Int? {get set}
    var mesto: String? {get set} //корпус
    
    //куда
    var numberGo: Int {get set}
    var etazGo: Int {get set}
    var mestoGo: String {get set}
    
    
    static func onlyVhod(etaz: Int, number: Int, mesto: String) -> [String]
}

