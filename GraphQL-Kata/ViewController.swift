//
//  ViewController.swift
//  GraphQL-Kata
//
//  Created by Ahmed Atef Ali Ahmed on 06.06.21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        RemoteLunchListClient.default.loadLunchList { result in
            switch result {
            case .success(let launchList):
                print(launchList.cursor)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

