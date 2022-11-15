//
//  NetworkClient.swift
//  YelpApp
//
//  Created by Leonid Hurtovyi on 14.11.2022.
//

import Alamofire

public final class NetworkClient: RequestInterceptor {
    public static var shared = NetworkClient()

    public init() {}

    public func getApiRequest<T: Decodable>(url: String,
                                            params: [URLQueryItem]?,
                                            headers: [String: String]?,
                                            completion:
                                                    @escaping NetworkClosure<T>) {
        var finalUrl = URLComponents(string: Constants.baseHost + url)
        finalUrl?.queryItems = params

        AF.request(finalUrl?.string ?? "",
                   method: .get,
                   parameters: [:],
                   headers: [:],
                   interceptor: self).responseString(completionHandler: { afDataResponse in
                    switch afDataResponse.result {
                    case .success(let response):
                        print(response)
                    case .failure(let error):
                        completion(.failure(error))
                    }
                   }).responseDecodable(of: T.self) { afDataResponse in
                    switch afDataResponse.result {
                    case .success(let response):
                        completion(.success(response))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                   }
    }
}
