import Foundation

public actor FileWatcher {
    public typealias ChangeHandler = @Sendable ([String]) -> Void

    private let rootPath: String
    private let debounceInterval: Duration

    public init(rootPath: String, debounceMilliseconds: Int = 500) {
        self.rootPath = rootPath
        self.debounceInterval = .milliseconds(debounceMilliseconds)
    }

    public func start(onChange: ChangeHandler) async {
        _ = rootPath
        _ = debounceInterval
        _ = onChange
        // Placeholder for FSEvents stream wiring.
    }
}
