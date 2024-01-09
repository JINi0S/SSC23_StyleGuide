import SwiftUI

@main
struct MyApp: App {
    @StateObject var userData = UserData()
    var body: some Scene {
        WindowGroup {
            CreateView().environmentObject(userData)
        }
    }
}
