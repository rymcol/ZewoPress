import HTTPServer
import Router
import Mustache

#if os(Linux)
import Glibc
#else
import Darwin
#endif

struct BlogHandler {

    func gatherContent() -> [String: Any] {

        let randomContent = ContentGenerator().generate()

        let index: Int = Int(arc4random_uniform(UInt32(randomContent.count)))
        let randomVal = Array(randomContent.values)[index]

        let imageNumber = Int(arc4random_uniform(25) + 1)

        return [
            "content": "\(randomVal)",
            "postTitle": "Test Post \(index)",
            "featuredImageURI": "/img/random/random-\(imageNumber).jpg",
            "featuredImageAltText": "Demo Image \(imageNumber)",
        ]
    }

}
