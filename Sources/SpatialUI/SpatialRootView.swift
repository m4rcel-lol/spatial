import SwiftUI

public struct SpatialRootView: View {
    public init() {}

    public var body: some View {
        HSplitView {
            VStack(alignment: .leading) {
                Text("Spatial")
                    .font(.headline)
                Text("Graph / Recent / Tags")
                    .font(.caption)
            }
            .frame(minWidth: 130, maxWidth: 130)

            Text("MTKView canvas host")
                .frame(maxWidth: .infinity, maxHeight: .infinity)

            Text("Inspector")
                .frame(minWidth: 220, maxWidth: 220)
        }
        .preferredColorScheme(.dark)
    }
}
