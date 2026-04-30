import Foundation
import simd

public struct GraphNode: Identifiable, Codable, Hashable {
    public enum NodeType: String, Codable, CaseIterable {
        case swiftObjC
        case assetMedia
        case configJSON
        case markdown
        case other
    }

    public let id: UUID
    public let path: String
    public let size: Int64
    public var position: SIMD2<Float>
    public var isPinned: Bool
    public let type: NodeType

    public init(id: UUID = UUID(), path: String, size: Int64, position: SIMD2<Float> = .zero, isPinned: Bool = false, type: NodeType) {
        self.id = id
        self.path = path
        self.size = size
        self.position = position
        self.isPinned = isPinned
        self.type = type
    }
}

public struct GraphEdge: Identifiable, Codable, Hashable {
    public enum Style: String, Codable {
        case solid
        case dashed
    }

    public let id: UUID
    public let sourceID: UUID
    public let targetID: UUID
    public let strength: Float
    public let style: Style

    public init(id: UUID = UUID(), sourceID: UUID, targetID: UUID, strength: Float, style: Style) {
        self.id = id
        self.sourceID = sourceID
        self.targetID = targetID
        self.strength = strength
        self.style = style
    }
}

public struct GraphCluster: Identifiable, Codable, Hashable {
    public let id: UUID
    public let name: String
    public let nodeIDs: [UUID]
    public var isCollapsed: Bool
}
