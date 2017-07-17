import Vapor

extension StructuredData {
    func toSwift() -> Any {
        switch self {
        case .bool(let val):
            return val
        case .string(let val):
            return val
        case .number(let num):
            switch num {
            case .int(let val):
                return val
            case .uint(let val):
                return val
            case .double(let val):
                return val
            }
        case .date(let val):
            return val
        case .array(let array):
            return array.map({ $0.toSwift() })
        case .object(let obj):
            var dict: [String: Any] = [:]
            for (key, value) in obj {
                dict[key] = value.toSwift()
            }
            return dict
        default:
            fatalError("Unsupported type")
        }
    }
}

extension StructuredDataWrapper {
    func toSwiftDict() -> [String: Any] {
        guard let obj = wrapped.object else {
            return [:]
        }
        
        var dict: [String: Any] = [:]
        for (key, value) in obj {
            dict[key] = value.toSwift()
        }
        
        return dict
    }
}
