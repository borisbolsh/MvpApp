//
//  MainViewController.swift
//  MvpApp
//
//  Created by Boris Bolshakov on 26.12.21.
//

import UIKit

class MainViewController: UIViewController {

    var presenter: MainViewPresenterProtocol?
       
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .systemBlue
    }


}

