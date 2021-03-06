//
//  ProviderRouter.swift
//
//  Copyright (c) 2018 Salt Edge. https://saltedge.com
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import Foundation

typealias ProviderCode = String
enum ProviderRouter: Routable {

    case list(SEProviderParams?)
    case show(ProviderCode)
    
    var method: HTTPMethod {
        return .get
    }
    
    var url: URL {
        switch self {
        case .list: return APIEndpoints.baseURL.appendingPathComponent("providers")
        case .show(let providerCode): return APIEndpoints.baseURL.appendingPathComponent("providers/\(providerCode)")
        }
    }
    
    var headers: Headers {
        return SEHeaders.cached.sessionHeaders
    }
    
    var parameters: ParametersEncodable? {
        switch self {
        case .list(let params): return params
        case .show: return nil
        }
    }
}
