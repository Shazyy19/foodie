import SwiftUI

struct SettingsView: View {
    @State private var notificationsOn = false
    @AppStorage("isDarkMode") private var isDarkMode = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: SectionHeader(title: "Account")) {
                    NavigationLink(destination: ProfileSettingsView()) {
                        SettingsRow(title: "Profile")
                    }
                    NavigationLink(destination: PaymentSettingsView()) {
                        SettingsRow(title: "Payment")
                    }
                }

                Section(header: SectionHeader(title: "Preferences")) {
                    Toggle("Notifications", isOn: $notificationsOn)
                    Toggle("Dark Mode", isOn: $isDarkMode)
                }
            }
            .navigationTitle("Settings")
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

struct ProfileSettingsView: View {
    // Sample user details
    let userDetails = [
        "Name": "John Doe",
        "Email": "john.doe@example.com",
        "Phone": "123-456-7890"
    ]

    var body: some View {
        List {
            ForEach(userDetails.sorted(by: <), id: \.key) { key, value in
                HStack {
                    Text(key)
                        .font(.headline)
                    Spacer()
                    Text(value)
                }
            }
        }
        .navigationTitle("Profile Settings")
    }
}

struct PaymentSettingsView: View {
    // Sample payment methods
    let paymentMethods = ["Credit Card", "PayPal", "Apple Pay"]

    var body: some View {
        List(paymentMethods, id: \.self) { method in
            NavigationLink(destination: PaymentMethodDetailView(method: method)) {
                Text(method)
                    .font(.headline)
            }
        }
        .navigationTitle("Payment Settings")
    }
}

struct PaymentMethodDetailView: View {
    var method: String
    @State private var cardNumber = ""
    @State private var expirationDate = ""
    @State private var cvv = ""

    var body: some View {
        Form {
            Section(header: Text(method)) {
                TextField("Card Number", text: $cardNumber)
                    .keyboardType(.numberPad)
                TextField("Expiration Date", text: $expirationDate)
                    .keyboardType(.numbersAndPunctuation)
                SecureField("CVV", text: $cvv)
                    .keyboardType(.numberPad)
            }
        }
        .navigationTitle(method)
    }
}

struct SectionHeader: View {
    var title: String

    var body: some View {
        Text(title)
            .foregroundColor(.gray)
            .font(.headline)
    }
}

struct SettingsRow: View {
    var title: String

    var body: some View {
        Text(title)
    }
}

// Preview
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
