import Foundation

struct IndexCalculate {
    
    func calculation(mass: Float, heig: Float) -> Float {
        let userDef = UserDefaults.standard
        let isKG = userDef.bool(forKey: "isKG")
        if isKG == false {
            let funt = mass * 703
            let result = funt / (heig * heig)
            return result
        } else {
            let heigm = heig * 0.01
            let result = mass / (heigm * heigm)
            return result
        }
    }
}
