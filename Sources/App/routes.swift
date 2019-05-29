import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    
    // Login page
    router.get { (req) in
        return try req.view().render("login")
    }
    
    router.get("portal") { (req) in
        return try req.view().render("dashboard")
    }
    
    // "It works" page
    router.get("welcome") { req in
        return try req.view().render("welcome")
    }
    
    // Says hello
    router.get("hello", String.parameter) { req -> Future<View> in
        return try req.view().render("hello", [
            "name": req.parameters.next(String.self)
        ])
    }
}
