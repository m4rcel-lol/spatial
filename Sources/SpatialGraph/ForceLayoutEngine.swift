import Foundation

public actor ForceLayoutEngine {
    public enum Algorithm: String, CaseIterable {
        case barnesHutGPU
    }

    public private(set) var algorithm: Algorithm = .barnesHutGPU

    public init() {}

    public func setAlgorithm(_ algorithm: Algorithm) {
        self.algorithm = algorithm
    }

    public func tick() async {
        // Placeholder: real implementation runs Barnes-Hut in SpatialMetal compute shaders.
    }
}
