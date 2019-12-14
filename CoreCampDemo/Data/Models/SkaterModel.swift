//
//  SkaterModel.swift
//  CoreCampDemo
//
//  Created by Maksym Horodivskyi on 12/6/19.
//  Copyright © 2019 CoreValue. All rights reserved.
//

import Foundation

class SkaterModel {
    var firstName: String
    var nickName: String?
    var lastName: String
    var monoImageUrl: URL?
    
    private(set) var nameComponents: PersonNameComponents
    
    var fullName: String {
        var nick: String?
        if let nickName = nickName { nick = "\"\(nickName)\""}
        return [firstName, nick, lastName].compactMap{$0}.joined(separator: " ")
    }
    
    init(firstName: String, nickName: String? = nil, lastName: String, monoImageUrl: URL) {
        self.firstName = firstName
        self.nickName = nickName
        self.lastName = lastName
        self.monoImageUrl = monoImageUrl
        
        nameComponents = PersonNameComponents()
        nameComponents.givenName = firstName
        nameComponents.nickname = nickName
        nameComponents.familyName = lastName
    }
}
