//
//  ViewController.swift
//  ApiPractice
//
//  Created by Diana on 29/05/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        ApiManager.shared.getUsers { users in
            for user in users {
                print("\(user.name) \(user.phone)")
            }
        }
        
        ApiManager.shared.getPosts { posts in
            
        }
        
        ApiManager.shared.getAlbums { albums in
            
        }
    }


}

