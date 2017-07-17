import Vapor
import Stencil

public final class StencilRenderer: ViewRenderer {
    public var shouldCache: Bool = true
    public let environment: Stencil.Environment

    public init(environment: Stencil.Environment) {
        self.environment = environment
    }
    
    public func make(_ path: String, _ data: ViewData) throws -> View {
        let template = try environment.loadTemplate(name: path)
        let context = data.toSwiftDict()
        let view = try template.render(context)
        return View(bytes: view.makeBytes())
    }
}

extension StencilRenderer: ConfigInitializable {
    public convenience init(config: Config) throws {
        let extensions = Extension()
        let environment = Stencil.Environment(extensions: [extensions])
        self.init(environment: environment)
    }
}
