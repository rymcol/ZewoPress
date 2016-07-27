import HTTPServer
import Router
import Mustache

let app = Router { route in
    route.get("/") { request in
        return Response(body: "Hello, world!")
        // return try app.view("index.mustache", context: IndexHandler().gatherContent())
    }
}

try Server(app).start()
