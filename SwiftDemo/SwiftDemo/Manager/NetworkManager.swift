//
//  NetworkManager.swift
//  SwiftDemo
//
//  Created by xxcao on 2016/12/13.
//  Copyright © 2016年 xxcao. All rights reserved.
//

import UIKit
import Alamofire

enum NetworkUnit : URLRequestConvertible {
    static let baseUrlString = "https://api.500px.com/v1"
    
    case login(parameters : Parameters)
    case getList(user_id : String)
    case updateInfo(user_id : String)
    case logout(user_id : String)
    case test(urlParameter : String)

    var method : HTTPMethod {
        switch self {
        case .login:
            return .post
        case .getList:
            return .get
        case .updateInfo:
            return .put
        case .logout:
            return .post
        case .test:
            return .get
        }
    }

    var path : String {
        switch self {
        case .login:
            return "/login"
        case .getList:
            return "/getList/"
        case .updateInfo:
            return "/updateInfo/"
        case .logout:
            return "/logout/"
        case .test:
            return "/photos/"
        }
    }


    func asURLRequest() throws -> URLRequest {
        
        let result: (path: String, parameters: Parameters) = {
            switch self {
            case .login(let parameters):
                return (path, parameters)
            case .getList(let user_id):
                return (path + user_id, [:])
            case .updateInfo(let user_id):
                return (path + user_id, [:])
            case .logout(let user_id):
                return (path + user_id, [:])
            case .test(let urlParameter):
                return (path + urlParameter, [:])
            }
        }()
        
        let url = try NetworkUnit.baseUrlString.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(result.path))
        urlRequest.httpMethod = method.rawValue
        return try URLEncoding.default.encode(urlRequest, with: result.parameters)
    }
}
