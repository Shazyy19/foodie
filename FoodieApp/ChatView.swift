import SwiftUI

struct ChatView: View {
    @State private var message: String = ""
    @State private var messages: [String] = ["Hi there! How can I help you today?"]
    @State private var scrollProxy: ScrollViewProxy?

    var body: some View {
        VStack {
            ScrollView {
                ScrollViewReader { proxy in
                    LazyVStack {
                        ForEach(messages, id: \.self) { msg in
                            MessageView(message: msg)
                        }
                        .onChange(of: messages) { _ in
                            scrollProxy = proxy
                            scrollToBottom()
                        }
                    }
                }
            }

            HStack {
                TextField("Type a message...", text: $message)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                Button(action: sendMessage) {
                    Image(systemName: "paperplane.fill")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                        .padding(.trailing)
                }
                .disabled(message.isEmpty)
            }
            .padding(.vertical)
        }
        .navigationTitle("Chat")
    }

    private func sendMessage() {
        if !message.isEmpty {
            messages.append(message)
            message = ""
        }
    }

    private func scrollToBottom() {
        scrollProxy?.scrollTo(messages.count - 1)
    }
}

struct MessageView: View {
    var message: String

    var body: some View {
        HStack {
            Text(message)
                .padding()
                .background(Color.blue.opacity(0.1))
                .cornerRadius(10)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
        }
    }
}

// Preview
struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
