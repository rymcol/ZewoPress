import HTTPServer
import Router
import Mustache

struct IndexHandler {

    func gatherContent() -> [String: Any] {
        return ["body": "Hello, World"]
    }

}
