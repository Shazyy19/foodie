import SwiftUI

struct DashboardView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text("Dashboard")
                        .font(.largeTitle)
                        .padding()

                    Text("Featured Events")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.leading, 15)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    // Example events
                    EventCard(event: "Food Festival", description: "Join the annual food festival for a variety of delicious treats.")

                    Text("Featured Products")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.leading, 15)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(1...5, id: \.self) { index in
                                VStack {
                                    Image("food\(index)")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 150, height: 150)
                                        .cornerRadius(15)
                                    Text("Product \(index)")
                                        .foregroundColor(.primary)
                                        .font(.headline)
                                }
                                .frame(width: 150)
                                .background(Color.white)
                                .cornerRadius(15)
                                .shadow(radius: 5)
                            }
                        }
                        .padding(.horizontal, 15)
                    }
                }
                .padding(.top)
            }
            .navigationTitle("Dashboard")
            .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color.yellow.opacity(0.2)]), startPoint: .top, endPoint: .bottom))
        }
    }
}

struct EventCard: View {
    let event: String
    let description: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(event)
                .font(.headline)
            Text(description)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.horizontal, 15)
    }
}

// Preview
struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
