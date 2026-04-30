#if canImport(SwiftUI)
import SwiftUI
import SpatialUI

@main
struct SpatialAppMain: App {
    var body: some Scene {
        WindowGroup {
            SpatialRootView()
        }
    }
}
#else
@main
struct SpatialAppMain {
    static func main() {
        print("SpatialApp (SwiftUI) is only available on Apple platforms.")
    }
}
#endif
