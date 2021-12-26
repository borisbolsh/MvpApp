//
//  MainViewController.swift
//  MvpApp
//
//  Created by Boris Bolshakov on 26.12.21.
//

import UIKit

final class MainViewController: UIViewController {
    
    var presenter: MainViewPresenterProtocol?
    
    private let greetingLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Greeting label"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private let actionButton: UIButton = {
        let button = UIButton()
        button.setTitle("Button", for: .normal)
        button.backgroundColor = .link
        button.layer.cornerRadius = 8.0
        button.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(greetingLabel)
        view.addSubview(actionButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        greetingLabel.frame = CGRect(
            x: 16,
            y: (navigationController?.navigationBar.frame.height ?? 0) + 32,
            width: view.width - 32,
            height: 50
        )
        
        let btnWidth = view.width / 2
        actionButton.frame = CGRect(
            x: (view.width - btnWidth) / 2,
            y: greetingLabel.bottom + 16,
            width:  btnWidth,
            height: 44
        )
    }
    
    @objc private func actionButtonTapped() {
        self.presenter?.showGreeting()
    }
    
}

extension MainViewController: MainViewProtocol {
    
    func setGreeting(greeting: String) {
        self.greetingLabel.text = greeting
    }
    
}
