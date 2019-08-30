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
       
    func postsFrom(url: URL) -> [Post] {
        parser = XMLParser(contentsOf: url)!
        parser.delegate = self
        parser.parse()
        return posts
    }
    
}

extension PostsManager: XMLParserDelegate {
    
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
        if elementName == ParseElements.item.rawValue {
            tempPost = Post()
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == ParseElements.item.rawValue {
            if let post = tempPost {
                posts.append(post)
            }
            tempPost = nil
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if let post = tempPost {
            if tempElement == ParseElements.title.rawValue {
                tempPost?.title = post.title+string
            } else if tempElement == ParseElements.link.rawValue {
                tempPost?.link = post.link+string
            } else if tempElement == ParseElements.pubDate.rawValue {
                tempPost?.date = post.date+string
            } else if tempElement == ParseElements.description.rawValue {
                tempPost?.description = post.description+string
            }
        }
    }
}
