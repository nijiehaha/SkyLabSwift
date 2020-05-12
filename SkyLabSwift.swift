import Foundation

final class SkyLabSwift {
    
    static func userDefaultsKeyForTestName(_ name:String) -> String {
        
        return "SkyLabSwift-\(name)"
        
    }
    
    static func randomValueFromArray(_ array:[String]) -> String? {
        
        guard array.count != 0 else {
            return nil
        }
        let index = arc4random_uniform(UInt32(array.count))
        return array[Int(index)]
        
    }
    
    static func abTest(A: () -> Void, B: () -> Void, with name: String) {
        
        splitTest(with: name, conditions: ["A", "B"]) { (choice) in
            
            if choice == "A" {
                
                A()
                
            } else {
                
                B()
                
            }
            
        }
        
    }
    
    static func splitTest(with name: String, conditions:[String], closure: (String) -> Void) {
        
        if let condition = UserDefaults.standard.object(forKey: userDefaultsKeyForTestName(name)) as? String {
            
            closure(condition)
            
        } else {
            
            if let condition = randomValueFromArray(conditions) {
                UserDefaults.standard.set(condition, forKey: userDefaultsKeyForTestName(name))
                closure(condition)
            }
            
        }
        
    }
    
}
