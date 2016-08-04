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

        var content = [[String: Any]]()

        for _ in 1...5 {
            let index: Int = Int(arc4random_uniform(UInt32(randomContent.count)))
            let value = Array(randomContent.values)[index]
            let imageNumber = Int(arc4random_uniform(25) + 1)
            content.append(["postTitle": "Test Post \(index)", "content": value, "featuredImageURI": "/img/random/random-\(imageNumber).jpg", "featuredImageAltText": "Demo Image \(imageNumber)"])
        }

        return [
            "content": content,
        ]
    }

}
