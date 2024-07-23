import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false
    @State private var isLoggedIn: Bool = false
    @State private var isEmailLogin: Bool = true
    @State private var showAlert:
        Bool = false

    var body:  some View {
        if isLoggedIn {
            ContentView()  // Navigate to ContentView after login
        } else {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    Spacer()
                    
                    Image(systemName: "cart.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.white)
                        .padding(.bottom, 40)
                    
                    Text("Welcome to Foodie!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    if isEmailLogin {
                        VStack(spacing: 20) {
                            TextField("Username", text: $username)
                                .padding()
                                .background(Color.white.opacity(0.8))
                                .cornerRadius(10)
                                .padding(.horizontal, 40)
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                            
                            HStack {
                                if showPassword {
                                    TextField("Password", text: $password)
                                } else {
                                    SecureField("Password", text: $password)
                                }
                                Button(action: {
                                    showPassword.toggle()
                                }) {
                                    Image(systemName: showPassword ? "eye.slash" : "eye")
                                        .foregroundColor(.white)
                                }
                            }
                            .padding()
                            .background(Color.white.opacity(0.8))
                            .cornerRadius(10)
                            .padding(.horizontal, 40)
                            
                            Button(action: {
                                if !username.isEmpty && !password.isEmpty {
                                    // Simulate login process
                                    if username == "user" && password == "password" {
                                        isLoggedIn = true
                                    } else {
                                        showAlert = true
                                    }
                                }
                            }) {
                                Text("Login")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(width: 220, height: 50)
                                    .background(Color.green)
                                    .cornerRadius(25)
                            }
                            
                            Button(action: {
                                isEmailLogin.toggle()
                            }) {
                                Text("Use Social Login")
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                            }
                        }
                    } else {
                        VStack(spacing: 20) {
                            Button(action: {
                                // Handle Google login action
                            }) {
                                HStack {
                                    Image("google-icon")
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                    Text("Continue with Google")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.red)
                                .cornerRadius(25)
                                .padding(.horizontal, 40)
                            }
                            
                            Button(action: {
                                // Handle Facebook login action
                            }) {
                                HStack {
                                    Image("facebook-icon")
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                    Text("Continue with Facebook")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .cornerRadius(25)
                                .padding(.horizontal, 40)
                            }
                            
                            Button(action: {
                                isEmailLogin.toggle()
                            }) {
                                Text("Use Email Login")
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    
                    Spacer()
                    
                    HStack {
                        Button(action: {
                            // Handle Forgot Password action
                        }) {
                            Text("Forgot Password?")
                                .font(.subheadline)
                                .foregroundColor(.white)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            // Handle Sign Up action
                        }) {
                            Text("Sign Up")
                                .font(.subheadline)
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.horizontal, 40)
                    .padding(.bottom, 30)
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Login Failed"), message: Text("Invalid username or password. Please try again."), dismissButton: .default(Text("OK")))
            }
        }
    }
}

// Preview
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
