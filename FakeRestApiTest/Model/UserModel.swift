//
//  UserModel.swift
//  FakeRestApiTest
//
//  Created by Omid Heydarzadeh on 2/15/24.
//

import Foundation

struct UserModel: Decodable {
    
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
}
