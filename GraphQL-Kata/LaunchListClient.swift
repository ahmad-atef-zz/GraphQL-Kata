//
//  LaunchListClient.swift
//  GraphQL-Kata
//
//  Created by Ahmed Atef Ali Ahmed on 06.06.21.
//

import Foundation
import Apollo

protocol LaunchListClient {
    func loadLunchList(completion: @escaping (Result<LaunchList, Error>) -> Void)
}


struct LaunchList {
    let cursor: String
    let hasMore: Bool

    init(_ data: LaunchListQuery.Data) {
        self.cursor = data.launches.cursor
        self.hasMore = data.launches.hasMore
    }
}

class RemoteLunchListClient: LaunchListClient {

    static let `default` = RemoteLunchListClient()
    
    func loadLunchList(completion: @escaping (Result<LaunchList, Error>) -> Void) {
        Network.shared.apollo.fetch(query: LaunchListQuery(), queue: .main) { requestResult in
            switch requestResult {
            case .success(let result):
                guard let launchList = result.data.map (LaunchList.init) else { return }
                completion(.success(launchList))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

