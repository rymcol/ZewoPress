import Zewo
import HTTPServer
import Router
import Sideburns

let app = Router { route in
    route.get("/") { request in

        let response: Response

        do {
            return try Response(templatePath: "webroot/index.mustache", templateData: IndexHandler().gatherContent())
        } catch {
            return Response(body: "Mustache Failed")
        }
    }

    route.get("blog") { request in

        let response: Response

        do {
            return try Response(templatePath: "webroot/blog.mustache", templateData: BlogHandler().gatherContent())
        } catch {
            return Response(body: "Mustache Failed")
        }
    }

    //serves static files
    route.get("/*", responder: FileResponder(path: "webroot/"))
}

try Server(app).start()
