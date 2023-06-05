
import Foundation

extension URL {
    
    static var development: URL {
        //        URL(string: "https://api.escuelajs.co")!
        URL(string: "https://jsonplaceholder.typicode.com/users")!
    }
    
    static var production: URL {
        //        URL(string: "https://api.escuelajs.co")!
        URL(string: "https://jsonplaceholder.typicode.com/users")!
    }
    
    static var `default`: URL {
        
#if DEBUG
        return development
#else
        return production
#endif
    }
    
    static var allCategories: URL {
        URL(string: "/users", relativeTo: Self.default)!
    }
    static func productsByCategory (_ categoryId: Int) -> URL {
        return URL(string: "\(categoryId) /users", relativeTo: Self.default)!
    }
}
