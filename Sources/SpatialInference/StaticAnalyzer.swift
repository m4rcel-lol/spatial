import Foundation

public struct StaticAnalyzer {
    public init() {}

    public func imports(in content: String, fileExtension: String) -> [String] {
        switch fileExtension.lowercased() {
        case "swift":
            return capture(content, pattern: #"^\s*import\s+([A-Za-z0-9_\.]+)"#)
        case "py":
            return capture(content, pattern: #"^\s*(?:from\s+([A-Za-z0-9_\.]+)\s+import|import\s+([A-Za-z0-9_\.]+))"#)
        case "js", "ts", "jsx", "tsx":
            return capture(content, pattern: #"(?:import\s+.*?from\s+['\"]([^'\"]+)['\"]|require\(['\"]([^'\"]+)['\"]\))"#)
        default:
            return []
        }
    }

    private func capture(_ content: String, pattern: String) -> [String] {
        guard let regex = try? NSRegularExpression(pattern: pattern, options: [.anchorsMatchLines]) else {
            return []
        }
        let range = NSRange(content.startIndex..., in: content)
        return regex.matches(in: content, range: range).compactMap { match in
            for index in 1..<match.numberOfRanges {
                let nsRange = match.range(at: index)
                if nsRange.location != NSNotFound,
                   let swiftRange = Range(nsRange, in: content) {
                    return String(content[swiftRange])
                }
            }
            return nil
        }
    }
}
