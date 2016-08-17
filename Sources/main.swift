import Zewo
import HTTPServer
import Router

let app = Router { route in
    route.get("/") { request in

        let header = CommonHandler().getHeader()
        let footer = CommonHandler().getFooter()
        let body = IndexHandler().loadPageContent()
        let indexPage = header + body + footer

        do {
            return Response(body: indexPage)
        } catch {
            return Response(body: "Page Load Failed")
        }
    }

    route.get("blog") { request in

        let header = CommonHandler().getHeader()
        let footer = CommonHandler().getFooter()
        let body = BlogHandler().loadPageContent()
        let blogPage = header + body + footer

        do {
            return Response(body: blogPage)
        } catch {
            return Response(body: "Page Load Failed")
        }
    }

    //serves static files
    route.get("/*", responder: FileResponder(path: "webroot/"))
}

try HTTPServer.Server(host: "0.0.0.0", port: 8282, responder: app).start()
