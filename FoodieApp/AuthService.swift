class AuthService {
    static let shared = AuthService()
    
    // Mock user data
    let mockUser = User(username: "user", email: "user@example.com")
    

    func login(email: String, password: String, completion: @escaping (User?) -> Void) {
        // Simulate login process
        if email == mockUser.email && password == "password" {
            completion(mockUser)
        } else {
            completion(nil)
        }
    }
}
