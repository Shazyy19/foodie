import Foundation

struct User {
    let id: UUID
    let username: String
    let email: String
    // Add more user-related properties as needed

    init(id: UUID = UUID(), username: String, email: String) {
        self.id = id
        self.username = username
        self.email = email
    }
}

struct Product {
    let id: UUID
    let name: String
    let price: Double
    // Add more product-related properties as needed

    init(id: UUID = UUID(), name: String, price: Double) {
        self.id = id
        self.name = name
        self.price = price
    }
}

struct Order {
    let id: UUID
    let product: Product
    let quantity: Int
    // Add more order-related properties as needed

    init(id: UUID = UUID(), product: Product, quantity: Int) {
        self.id = id
        self.product = product
        self.quantity = quantity
    }
}
