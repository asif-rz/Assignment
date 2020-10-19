//
//  Connection.swift
//  reachability-playground
//
//  Created by Neo Ighodaro on 07/06/20.
//  Copyright © 2020 CreativityKills Co. All rights reserved.
//

import Foundation

class NetworkManager: NSObject {

    var reachability: Reachability!

    static let sharedInstance: NetworkManager = { return NetworkManager() }()

//    static var isInternetAvailable = false

    override init() {
        super.init()

        reachability = Reachability()!

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(networkStatusChanged(_:)),
            name: .reachabilityChanged,
            object: reachability
        )

        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }

    @objc func networkStatusChanged(_ notification: Notification) {
        // Do something globally here!

//        let reachability = notification.object as! Reachability
//
//        if reachability.connection.description == .none {
//
//        } else {
//
//        }
//        print(reachability.connection.description)
    }

    static func stopNotifier() {
        do {
            try (NetworkManager.sharedInstance.reachability).startNotifier()
        } catch {
            print("Error stopping notifier")
        }
    }

    static func isReachable(completed: @escaping (NetworkManager) -> Void) {
        if (NetworkManager.sharedInstance.reachability).connection != .none {
            completed(NetworkManager.sharedInstance)
        }
    }

    static func isUnreachable(completed: @escaping (NetworkManager) -> Void) {
        if (NetworkManager.sharedInstance.reachability).connection == .none {
            completed(NetworkManager.sharedInstance)
        }
    }

    static func isReachableViaWWAN(completed: @escaping (NetworkManager) -> Void) {
        if (NetworkManager.sharedInstance.reachability).connection == .cellular {
            completed(NetworkManager.sharedInstance)
        }
    }

    static func isReachableViaWiFi(completed: @escaping (NetworkManager) -> Void) {
        if (NetworkManager.sharedInstance.reachability).connection == .wifi {
            completed(NetworkManager.sharedInstance)
        }
    }
}
