//
//  Network.swift
//  GraphQL-Kata
//
//  Created by Ahmed Atef Ali Ahmed on 06.06.21.
//

import Foundation
import Apollo

class Network {
    static let shared = Network()

    private(set) lazy var apollo: ApolloClient = {
        let store = ApolloStore(cache: InMemoryNormalizedCache())
        let provider = LegacyInterceptorProvider(store: store)
        let url = URL(string: "https://apollo-fullstack-tutorial.herokuapp.com/")!
        let transport = RequestChainNetworkTransport(
            interceptorProvider: provider,
            endpointURL: url
        )
        return ApolloClient(
            networkTransport: transport,
            store: store
        )
    }()
}
