import SwiftUI

struct HomeView: View {
    @State private var cartItems: [String: Int] = [:]
    @State private var favoriteItems: [String] = []

    let products = [
        "Pizza", "Burger", "Pasta", "Sushi", "Salad"
    ]

    var body: some View {
        NavigationView {
            VStack {
                // Header with cart and favorites bicon
                StickyHeaderView(cartItems: $cartItems, favoriteItems: favoriteItems)
                
                
                ScrollView {
                    VStack(spacing: 20) { // Use VStack here for vertical layout
                        ForEach(products, id: \.self) { product in
                            ProductCard(
                                 product: product,
                                isInCart: cartItems.keys.contains(product),
                                isFavorite: favoriteItems.contains(product),
                                addToCart: {
                                    toggleCartItem         (product)
                                },
                                addToFavorites: {
                                    toggleFavoriteItem(product)
                                }
                            )
                        }
                    }
                    .padding(.top)
                }
                .background(LinearGradient(
                    gradient: Gradient(colors: [Color.white, Color.green.opacity(0.2)]),
                    startPoint: .top,
                    endPoint: .bottom
                ))
            }
            .navigationBarHidden(true)
        }
    }

    private func toggleCartItem(_ product: String) {
        if let quantity = cartItems[product] {
            if quantity > 1 {
                cartItems[product] = quantity - 1
            } else {
                cartItems.removeValue(forKey: product)
            }
        } else {
            cartItems[product] = 1
        }
    }

    private func toggleFavoriteItem(_ product: String) {
        if let index = favoriteItems.firstIndex(of: product) {
            favoriteItems.remove(at: index)
        } else {
            favoriteItems.append(product)
        }
    }
}

struct StickyHeaderView: View {
    @Binding var cartItems: [String: Int]
    let favoriteItems: [String]
    
    var body: some View {
        HStack {
            Text("Featured Products")
                .font(.system(size: 28, weight: .bold))
                .padding()

            Spacer()

            // Favorites icon with count
            NavigationLink(destination: ItemsView(items: favoriteItems, title: "Favorites")) {
                ZStack {
                    Image(systemName: "heart.fill")
                        .resizable()
                        .frame(width: 28, height: 28)
                        .foregroundColor(.red)
                    
                    if !favoriteItems.isEmpty {
                        BadgeView(count: favoriteItems.count)
                    }
                }
            }
            .padding()

            // Cart icon with count
            NavigationLink(destination: CartView(cartItems: $cartItems)) {
                ZStack {
                    Image(systemName: "cart.fill")
                        .resizable()
                        .frame(width: 28, height: 28)
                        .foregroundColor(.green)
                    
                    if !cartItems.isEmpty {
                        BadgeView(count: cartItems.values.reduce(0, +))
                    }
                }
            }
            .padding()
        }
        .background(Color.white.shadow(radius: 5))
    }
}

struct ProductCard: View {
    let product: String
    let isInCart: Bool
    let isFavorite: Bool
    let addToCart: () -> Void
    let addToFavorites: () -> Void

    var body: some View {
        VStack(alignment: .leading) { // Use VStack for vertical stacking
            HStack {
                Image(product.lowercased())
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .cornerRadius(15)
                    .shadow(radius: 5)
                
                VStack(alignment: .leading) {
                    Text(product)
                        .font(.system(size: 18, weight: .semibold))
                        .padding(.top, 5)
                    
                    HStack {
                        Button(action: addToCart) {
                            HStack {
                                Image(systemName: isInCart ? "cart.fill.badge.minus" : "cart.fill.badge.plus")
                                    .foregroundColor(.green)
                                Text(isInCart ? "Remove" : "Add to Cart")
                                    .foregroundColor(.green)
                                    .font(.system(size: 14, weight: .medium))
                            }
                            .padding(10)
                        }
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 2)

                        Button(action: addToFavorites) {
                            HStack {
                                Image(systemName: isFavorite ? "heart.fill" : "heart")
                                    .foregroundColor(.red)
                                Text(isFavorite ? "Unfavorite" : "Favorite")
                                    .foregroundColor(.red)
                                    .font(.system(size: 14, weight: .medium))
                            }
                            .padding(10)
                        }
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 2)
                    }
                    .padding(.top, 10)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 5)
        .frame(maxWidth: .infinity, alignment: .leading) // Ensure it takes full width
    }
}

struct BadgeView: View {
    let count: Int
    
    var body: some View {
        Text("\(count)")
            .font(.system(size: 14, weight: .bold))
            .foregroundColor(.white)
            .frame(width: 24, height: 24)
            .background(Color.red)
            .clipShape(Circle())
            .offset(x: 12, y: -12)
    }
}

struct ItemsView: View {
    let items: [String]
    let title: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.largeTitle)
                .padding()

            List(items, id: \.self) { item in
                HStack {
                    Image(item.lowercased())
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .cornerRadius(10)
                    
                    Text(item)
                        .font(.headline)
                }
            }
        }
        .navigationTitle(title)
    }
}

struct CartView: View {
    @Binding var cartItems: [String: Int] // Make it Binding to pass changes back

    var body: some View {
        VStack {
            Text("Cart")
                .font(.largeTitle)
                .padding()

            List(cartItems.keys.sorted(), id: \.self) { item in
                HStack {
                    Image(item.lowercased())
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .cornerRadius(10)
                    
                    Text(item)
                        .font(.headline)

                    Spacer()

                    Text("x\(cartItems[item] ?? 0)")
                        .font(.body)
                }
            }
        }
        .navigationTitle("Cart")
    }
}

// Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
