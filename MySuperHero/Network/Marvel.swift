//
//  Marvel.swift
//  MySuperHero
//
//  Created by Fikri Adriansa Yudha on 26/05/20.
//  Copyright © 2020 Fikri Adriansa Yudha. All rights reserved.
//

import Moya

public enum Marvel{
    static private let publicKey = "b7c144497e89b3a9dc1e765661899e6d"
    static private let privateKey = "f62922858d91f0473d7b74940a571ed5d062325a"
    
    case comics
}

extension Marvel: TargetType{
    public var baseURL: URL {
        return  URL(string: "https://gateway.marvel.com/v1/public")!
    }
    
    public var path: String {
        switch self {
        case .comics:
            return "/comics"
        }
    }
    
    public var method: Method {
        switch self {
        case .comics:
            return .get
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
      let ts = "\(Date().timeIntervalSince1970)"
      let hash = (ts + Marvel.privateKey + Marvel.publicKey).md5

      let authParams = ["apikey": Marvel.publicKey, "ts": ts, "hash": hash]

      switch self {
      case .comics:
        return .requestParameters(parameters: ["format": "comic",
                                               "formatType": "comic",
                                               "orderBy": "-onsaleDate",
                                               "dateDescriptor": "lastWeek",
                                               "limit": 50] + authParams,
                                  encoding: URLEncoding.default)
      }
    }
    
    public var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    public var validationType: ValidationType{
        return .successCodes
    }
}
