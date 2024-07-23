import SwiftUI

struct OrderListView: View {
@State private var cartItems: [String] = ["Pizza", "Burger"]
    var body: some View {
        NavigationView {
            List {
                ForEach(cartItems, id: \.self) { item in
                    OrderRow(product: item)
                }
            }
            .navigationTitle("Orders")
            .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color.pink.opacity(0.2)]), startPoint: .top, endPoint: .bottom))
        }
    }
}

struct OrderRow: View {
let product: String
    var body: some View {
        HStack {
            Image(product.lowercased())
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(5)
            Text(product)
                .font(.headline)
        }
    }
}

// Preview
struct OrderListView_Previews: PreviewProvider {
static var previews: some View {
OrderListView()
}
}
