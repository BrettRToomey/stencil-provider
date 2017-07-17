import XCTest
import Vapor
@testable import StencilProvider

class ProviderTests: XCTestCase {
    static let allTests = [
        ("testProvider", testProvider),
    ]

    func testProvider() throws {
        var config = Config([:])
        try config.set("droplet.view", "stencil")
        try config.addProvider(Provider.self)
        let drop = try Droplet(config: config)
        XCTAssert(drop.view is StencilRenderer)
        let env = drop.stencilEnvironment
        XCTAssertNotNil(env)
    }
}
