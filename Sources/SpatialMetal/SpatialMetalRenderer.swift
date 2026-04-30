import MetalKit
import SpatialGraph

public final class SpatialMetalRenderer: NSObject, MTKViewDelegate {
    public private(set) var transformMatrix = matrix_identity_float4x4

    public func updateTransform(_ matrix: simd_float4x4) {
        transformMatrix = matrix
    }

    public func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {}

    public func draw(in view: MTKView) {
        // Placeholder: instanced node quads, edge buffer draw, stencil outline pass, bloom pass.
    }
}
