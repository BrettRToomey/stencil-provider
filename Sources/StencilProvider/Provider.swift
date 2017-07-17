import Vapor
import Stencil

public final class Provider: Vapor.Provider {
    public static let repositoryName = "BrettRToomey/stencil-provider"

    public init() {}

    public convenience init(config: Config) throws {
        self.init()
    }

    public func boot(_ config: Config) throws {
        config.addConfigurable(view: StencilRenderer.init, name: "stencil")
    }

    public func boot(_ droplet: Droplet) throws {
        if let stencil = droplet.view as? StencilRenderer {
            droplet.stencilEnvironment = stencil.environment
        }
    }

    public func beforeRun(_ droplet: Droplet) throws {}
}

extension Droplet {
    public internal(set) var stencilEnvironment: Stencil.Environment? {
        get { return storage["stencil"] as? Stencil.Environment }
        set { storage["stencil"] = newValue }
    }
}
