//
//  ApiService.swift
//  Data
//
//  Created by 김동준 on 9/15/24
//

import Foundation
import Domain

public struct ApiService {
    public init() {}
    
    func callApiService(
        httpMethod: HttpMethod,
        endPoint: String,
        queryParameter: Encodable? = nil,
        body: Encodable? = nil
    ) async -> Result<Data, NetworkError> {
        do {
            guard var url = URL(string: "\(BaseUrl.environment.rawValue)\(endPoint)") else {
                return .failure(NetworkError.requestURLNotExistError)
            }
            
            if let queryParameter = queryParameter {
                guard let queryDictionary = try? queryParameter.toDictionary() else {
                    return .failure(NetworkError.queryParameterError)
                }
                
                let queryItems = getQueryParameter(queryDictionary: queryDictionary)
                url.append(queryItems: queryItems)
            }
            
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = httpMethod.rawValue
            urlRequest.timeoutInterval = 60
            urlRequest.allHTTPHeaderFields = getHeaders()
            
            if let body = body {
                guard let httpBody = try? JSONEncoder().encode(body) else {
                    throw NetworkError.bodyEncodingError
                }
                urlRequest.httpBody = httpBody
                print("🤩😅🤣😂🙄🫠🥰😏😐🤥🤮🤓🤩😅🤣😂🙄🫠🥰😏😐🤥🤮🤓\n🥰[HTTP BODY] = \(body)\n🤩😅🤣😂🙄🫠🥰😏😐🤥🤮🤓🤩😅🤣😂🙄🫠🥰😏😐🤥🤮🤓\n")
                print("🐵🐯🐭😾🐶🐷🐴🐟🐠🐡🦈🐬🦦🦐🦍🐧🐙🐊🐸🐔🐼🦄🦉🐿️\n🥰[HTTP HEADER] = \(urlRequest.allHTTPHeaderFields)\n🐵🐯🐭😾🐶🐷🐴🐟🐠🐡🦈🐬🦦🦐🦍🐧🐙🐊🐸🐔🐼🦄🦉🐿️\n")
            }
            
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
                return .failure(NetworkError.responseError)
            }

            print("🎵🎼🎸🥁🎹🎻🎷🎤📯🪘📻🪗🎵🎼🎸🥁🎹🎻🎷🎤📯🪘📻🪗\n🎸[RequestURL] = \(url)\n🎸[StatusCode] = \(statusCode) / [HTTPMethod] = \(httpMethod.rawValue)\n🎵🎼🎸🥁🎹🎻🎷🎤📯🪘📻🪗🎵🎼🎸🥁🎹🎻🎷🎤📯🪘📻🪗\n")

            if let str = String(data: data, encoding: .utf8) {
                print("🧡❤️💚💙🖤🤎💛💝💖💕💗💓🧡❤️💚💙🖤🤎💛💝💖💕💗💓\n❤️[Sucessfully Decoded String Data]\n\(str)\n🧡❤️💚💙🖤🤎💛💝💖💕💗💓🧡❤️💚💙🖤🤎💛💝💖💕💗💓\n")
            }
            
            let range = 200..<300
            if (range.contains(statusCode)) {
                return .success(data)
            } else {
                let error = networkErrorHandling(statusCode)
                return .failure(error)
            }
        } catch URLError.Code.notConnectedToInternet, URLError.notConnectedToInternet {
            return .failure(NetworkError.internetConnectionError)
        } catch URLError.timedOut {
            return .failure(NetworkError.timeout)
        } catch {
            return .failure(NetworkError.unKnownError)
        }
    }
}

extension ApiService {
    private func getHeaders() -> [String: String] {
        let accessToken: String = ""
        let tokenString: String = accessToken.isEmpty ? "" : "Bearer \(accessToken)"
        return  [
            "Authorization": tokenString,
            "Content-Type": "application/json; charset=utf-8",
            "Accept-Charset": "UTF-8"
        ]
    }
    
    private func getQueryParameter(queryDictionary: [String: Any]) -> [URLQueryItem] {
        var queryList: [URLQueryItem] = []
        
        queryDictionary.forEach { key, value in
            queryList.append(URLQueryItem(name: key, value: "\(value)"))
        }
        
        return queryList
    }
    
    private func networkErrorHandling(_ status: Int) -> NetworkError {
        switch (status) {
        case 400:
            return .badRequest
        case 401:
            return .unAuthorizationError
        case 403:
            return .forbidden
        case 404:
            return .notFound
        case 500..<600:
            return .internalServerError
        default:
            return .unKnownError
        }
    }
}
