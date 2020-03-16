import Combine

@available(iOS 13.0.0, *)
class UserLoginEntry: ObservableObject {
    @Published var value: String = ""
}
