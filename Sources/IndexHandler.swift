import HTTPServer
import Router
import Mustache

#if os(Linux)
import Glibc
#else
import Darwin
#endif

struct IndexHandler {

    func gatherContent() -> [String: Any] {

        let randomContent = ContentGenerator().generate()
        let randomVal = Array(randomContent.values)[1]
        let imageNumber = Int(arc4random_uniform(25) + 1)

        return [
            "content": "\(randomVal)",
            "postTitle": "Test Post 1",
            "featuredImageURI": "/img/random/random-\(imageNumber).jpg",
            "featuredImageAltText": "Demo Image \(imageNumber)",
            "title": "ZewoPress | Home",
        ]
    }

}
