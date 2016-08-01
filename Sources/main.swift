import Zewo
import HTTPServer
import Router
import Sideburns

let app = Router { route in
    route.get("/") { request in
        //

        let templateData: TemplateData = [
            "content": "bar"
        ]

        let response: Response

        do {
            return try Response(templatePath: "webroot/index.mustache", templateData: templateData)
        } catch {
            return Response(body: "Mustache Failed")
        }
    }

    //serves static files
    route.get("/*", responder: FileResponder(path: "webroot/"))
}

try Server(app).start()
