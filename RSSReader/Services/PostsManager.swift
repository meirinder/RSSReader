//
//  ItemsManager.swift
//  RSSReader
//
//  Created by Savely on 30/08/2019.
//  Copyright © 2019 Test App. All rights reserved.
//

import Foundation

class PostsManager: NSObject {
    static let `default` = PostsManager()
    private var parser = XMLParser()
    
    private var tempElement: String?
    private var tempPost: Post? = nil
    private var posts: [Post] = []
    private var title = ""
    private var channel = false

    func postsFrom(url: URL) -> (posts: [Post], title: String) {
        if let parser = XMLParser(contentsOf: url) {
            parser.delegate = self
            parser.parse()
        }
        let result = (posts, title)
        title = ""
        posts = []
        return result
    }
    
    func checkRSS(url: URL) -> Bool {
        var result = false
        if let parser = XMLParser(contentsOf: url) {
            parser.delegate = self
            result = parser.parse()
        }
        return result
    }
    
}

extension PostsManager: XMLParserDelegate {
    
    func parser(_ parser: XMLParser, validationErrorOccurred validationError: Error) {
        print("parse error: \(validationError.localizedDescription)")
    }
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print("parse error: \(parseError.localizedDescription)")
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        tempElement = elementName
        if elementName == ParseElements.enclosure.rawValue {
            if let url = attributeDict[ParseElements.url.rawValue] {
                tempPost?.enclosure = url
            }
        }
        if elementName == ParseElements.channel.rawValue {
            channel = true
        }
        if elementName == ParseElements.item.rawValue {
            tempPost = Post()
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == ParseElements.title.rawValue {
            channel = false
        }
        if elementName == ParseElements.item.rawValue {
            if let post = tempPost {
                posts.append(post)
            }
            tempPost = nil
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if channel {
            if tempElement == ParseElements.title.rawValue {
                title = title+string
            }
        }
        if let post = tempPost {
            if tempElement == ParseElements.title.rawValue {
                tempPost?.title = post.title+string
            } else if tempElement == ParseElements.link.rawValue {
                if !string.contains("\n") {
                    tempPost?.link = post.link+string
                } 
            } else if tempElement == ParseElements.pubDate.rawValue {
                tempPost?.date = post.date+string
            } else if tempElement == ParseElements.description.rawValue {
                tempPost?.description = post.description+string
            }
        }
    }
}
