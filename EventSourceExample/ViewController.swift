//
//  ViewController.swift
//  EventSource
//
//  Created by Andres on 2/13/15.
//  Copyright (c) 2015 Inaka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var eventSource: EventSource?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let server = "http://127.0.0.1:8080/sse"
        let username = "fe8b0af5-1b50-467d-ac0b-b29d2d30136b"
        let password = "ae10ff39ca41dgf0a8"
        
        let basicAuthAuthorization = EventSource.basicAuth(username, password: password)
        

//        eventSource = EventSource(url: server, headers: ["Authorization" : basicAuthAuthorization])
        
        eventSource?.onOpen {
            println("onOpen");
        }
        
        eventSource?.onError { (error) in
            if let currentError = error{
                print(currentError)
            }else{
                print("Error")
            }
        }

        eventSource?.onMessage { (id, event, data) in
            println(id)
            println(event)
            println(data)
            println()
        }
        
//        eventSource.close()
    }
}

