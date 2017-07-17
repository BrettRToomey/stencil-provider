import Vapor
import Stencil

public final class StencilRenderer: ViewRenderer {
    public var shouldCache: Bool = false
    public let cache: SystemCache<Template>
    public let environment: Stencil.Environment

    public init(workDir: String, cacheSize: Int? = nil) {
        let extensions = Extension()
        environment = Stencil.Environment(extensions: [extensions])
        self.cache = SystemCache<Template>(maxSize: cacheSize ?? 10.megabytes)
    }
    
    public func make(_ path: String, _ data: ViewData) throws -> View {
        let template: Template
        if shouldCache, let tmp = cache[path] {
            template = tmp
        } else {
            template = try environment.loadTemplate(name: path)
            cache[path] = template
        }

        return try render(template, data)
    }
}

extension StencilRenderer {
    public func render(_ template: Template, _ context: ViewData) throws -> View {
        let context = context.toSwiftDict()
        let view = try template.render(context)
        return View(bytes: view.makeBytes())
    }
}

extension StencilRenderer: ConfigInitializable {
    public convenience init(config: Config) throws {
        self.init(
            workDir: config.viewsDir,
            cacheSize: config["stencil", "cacheSize"]?.int
        )
    }
}

extension Template: Cacheable {
    public func cacheSize() -> Size {
        // FIXME(Brett): Use real size
        return 2.kilobytes
    }
}
