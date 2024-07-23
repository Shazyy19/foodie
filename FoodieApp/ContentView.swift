import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
           
            LoginView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Login")
                }
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }

            DashboardView()
                .tabItem {
                    Image(systemName: "chart.bar.fill")
                    Text("Dashboard")
                }

            OrderListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Orders")
                }

            ChatView()
                .tabItem {
                    Image(systemName: "message.fill")
                    Text("Chat")
                }

            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
        }
    }
}

// Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
