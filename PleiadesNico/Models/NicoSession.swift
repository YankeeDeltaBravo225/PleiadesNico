//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import Foundation
import Combine

class NicoSession {

    typealias OnReceived     = (_ text : String) -> Void
    typealias OnError        = (_ text : String) -> Void
    
    enum ContentType: String, CaseIterable {
        case textPlain
        case none
    }
    
    private var session      : URLSession
    private var statusCode   : Int
    private var cancellables : Set<AnyCancellable>
    open    var errLog       : String

    init() {
        self.session = URLSession(configuration: .default)
        self.statusCode = -1
        self.cancellables = []
        self.errLog = ""
    }


    func get(urlText:String, onReceived : @escaping OnReceived, onError : @escaping OnError) {
        guard let url = URL(string: urlText) else {
            errLog = "Invalid URL( \(urlText) )"
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        request.addValue(NicoURL.userAgent, forHTTPHeaderField: "User-Agent")
        if let stringCookie = ConfigStorage.shared.stringCookie {
            request.setValue(stringCookie, forHTTPHeaderField: "Cookie")
        }
        
        sendRequest(request: request, onReceived: onReceived, onError: onError)
    }


    func post(urlText:String, data:Data, contentType : ContentType, onReceived : @escaping OnReceived, onError : @escaping OnError) {
        guard let url = URL(string: urlText) else {
            errLog = "Invalid URL( \(urlText) )"
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data

        request.addValue(NicoURL.userAgent, forHTTPHeaderField: "User-Agent")
        request.addValue(NicoURL.refer, forHTTPHeaderField: "Referer")
        if contentType == .textPlain {
            request.addValue("text/plain;charset=UTF-8",  forHTTPHeaderField: "Content-Type")
        }
        request.addValue(NicoURL.origin, forHTTPHeaderField: "Origin")

        if let stringCookie = ConfigStorage.shared.stringCookie {
            request.setValue(stringCookie, forHTTPHeaderField: "Cookie")
        }
        
        sendRequest(request: request, onReceived: onReceived, onError: onError)
    }

    
    func option(urlText:String, onReceived : @escaping OnReceived, onError : @escaping OnError) {
        guard let url = URL(string: urlText) else {
            errLog = "Invalid URL( \(urlText) )"
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "OPTIONS"

        request.addValue(NicoURL.userAgent, forHTTPHeaderField: "User-Agent")
        if let stringCookie = ConfigStorage.shared.stringCookie {
            request.setValue(stringCookie, forHTTPHeaderField: "Cookie")
        }
        
        sendRequest(request: request, onReceived: onReceived, onError: onError)
    }
    
    
    private func sendRequest(request : URLRequest, onReceived : @escaping OnReceived, onError : @escaping OnError){
        session.dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { (completion) in
                    self.didReceiveCompletion(completion: completion, onError: onError)
                },
                receiveValue: { (data: Data, response: URLResponse) in
                    self.didReceiveValue(data: data, response: response, onReceived: onReceived)
                }
            )
            .store(in: &cancellables)
    }


    private func didReceiveCompletion(completion : Subscribers.Completion<URLError>, onError : @escaping OnError){
        switch completion {
            case .finished:
                self.errLog = ""
                
            case .failure(let error):
                let description = "Failure: \(error.localizedDescription)\n"
                onError(description)
                self.errLog = description
        }
    }


    private func didReceiveValue(data: Data, response: URLResponse, onReceived : @escaping OnReceived){
        if let httpURLResponse = response as? HTTPURLResponse {
            self.statusCode = httpURLResponse.statusCode
        }

        if let text = String(data: data, encoding: .utf8) {
            onReceived(text)
        }
    }

}
