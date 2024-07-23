struct FavoritesView: View {
    let favoriteItems: [String]

    var body: some View {
        VStack {
            Text("Favorites")
                .font(.largeTitle)
                .padding()

            List(favoriteItems, id: \.self) { item in
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
        .navigationTitle("Favorites")
    }
}
