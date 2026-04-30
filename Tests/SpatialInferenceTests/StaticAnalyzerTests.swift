import Testing
@testable import SpatialInference

struct StaticAnalyzerTests {
    private let analyzer = StaticAnalyzer()

    @Test
    func parsesSwiftImports() {
        let code = """
        import Foundation
        import SpatialCore
        """
        #expect(analyzer.imports(in: code, fileExtension: "swift") == ["Foundation", "SpatialCore"])
    }

    @Test
    func parsesPythonImports() {
        let code = """
        import os
        from pathlib import Path
        """
        #expect(analyzer.imports(in: code, fileExtension: "py") == ["os", "pathlib"])
    }

    @Test
    func parsesJavaScriptImportsAndRequire() {
        let code = """
        import React from 'react'
        const fs = require("fs")
        """
        #expect(analyzer.imports(in: code, fileExtension: "js") == ["react", "fs"])
    }
}
