//
//  Tag.swift
//  Yawp
//
//  Created by Paul Schifferer on 21/5/17.
//  Copyright © 2017 Pilgrimage Software. All rights reserved.
//

import Foundation


public struct Tag {

}


extension Tag : Serializable {
    public init?(from json : JSONDictionary) {

    }

    public func toDictionary() -> JSONDictionary {
        let dict : JSONDictionary = [
            :
        ]

        return dict
    }
}
