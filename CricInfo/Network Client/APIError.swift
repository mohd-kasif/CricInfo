//
//  APIError.swift
//  CricInfo
//
//  Created by Mohd Kashif on 16/07/24.
//

import Foundation
enum APIError:Error{
    case invalidUrl
    case invalidResponse(String)
    case invalidData
    case failedSerailization(String)
}


