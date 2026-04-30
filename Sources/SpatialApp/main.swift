import Foundation

@main
enum SpatialAppMain {
    static func main() {
        #if canImport(SwiftUI)
        SpatialSwiftUIApp.main()
        #else
        print("SpatialApp (SwiftUI) is only available on Apple platforms.")
        #endif
    }
}

#if canImport(SwiftUI)
import SwiftUI
import SpatialUI

private struct SpatialSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            SpatialRootView()
        }
    }
}
#endif
