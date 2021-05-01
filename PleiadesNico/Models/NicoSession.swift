//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import Foundation
import Combine

class NicoSession {

    private var session          : URLSession            = URLSession(configuration: .default)
    private var statusCode       : Int                   = -1
    private var cancellables     : Set<AnyCancellable>  = []
    
    open    var errLog           : String                = ""
    
    struct HeaderAttr {
        let key   : String
        let value : String

        init(_ key: String,_ value: String){
            self.key   = key
            self.value = value
        }
    }

    enum ContentType: String, CaseIterable {
        case textPlain
        case none
    }


    init() {
    }


    func get(urlText:String, onReceived : @escaping (_ text : String) -> Void) {
        guard let url = URL(string: urlText) else {
            errLog = "Invalid URL( \(urlText) )"
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        sendRequest(request: request, onReceived: onReceived)
    }


    func post(urlText:String, data:Data, contentType : ContentType, onReceived : @escaping (_ text : String) -> Void) {
        guard let url = URL(string: urlText) else {
            errLog = "Invalid URL( \(urlText) )"
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data

        request.addValue("https://www.nicovideo.jp/", forHTTPHeaderField: "Referer")
        if contentType == .textPlain {
            request.addValue("text/plain;charset=UTF-8",  forHTTPHeaderField: "Content-Type")
        }
        request.addValue("https://www.nicovideo.jp/", forHTTPHeaderField: "Origin")

        sendRequest(request: request, onReceived: onReceived)
    }

    
    func option(urlText:String, onReceived : @escaping (_ text : String) -> Void) {
        guard let url = URL(string: urlText) else {
            errLog = "Invalid URL( \(urlText) )"
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "OPTIONS"

        sendRequest(request: request, onReceived: onReceived)
    }
    
    
    private func sendRequest(request : URLRequest, onReceived : @escaping (_ text : String) -> Void){
        session.dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { (completion) in
                    self.didReceiveCompletion(completion: completion)
                },
                receiveValue: { (data: Data, response: URLResponse) in
                    self.didReceiveValue(data: data, response: response, onReceived: onReceived)
                }
            )
            .store(in: &cancellables)
    }


    private func didReceiveCompletion(completion : Subscribers.Completion<URLError>){
        switch completion {
            case .finished:
                self.errLog = ""
                
            case .failure(let error):
                self.errLog = "Failure: \(error.localizedDescription)\n"
        }
    }


    private func didReceiveValue(data: Data, response: URLResponse, onReceived : @escaping (_ text : String) -> Void){
        if let httpURLResponse = response as? HTTPURLResponse {
            self.statusCode = httpURLResponse.statusCode
        }

        if let text = String(data: data, encoding: .utf8) {
            onReceived(text)
        }
    }

}
