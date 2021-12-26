//
//  DetailViewController.swift
//  MvpApp
//
//  Created by Boris Bolshakov on 26.12.21.
//

import UIKit

class DetailViewController: UIViewController {
    
    var presenter: DetailPresenterProtocol!
    
    private let commentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Greeting label"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(commentLabel)
        
        presenter.setComment()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        commentLabel.frame = CGRect(
            x: 16,
            y: (navigationController?.navigationBar.frame.height ?? 0) + 16,
            width: view.width - 32,
            height: view.height - (navigationController?.navigationBar.frame.height ?? 0) - 16
        )
        
    }
    
}

extension DetailViewController: DetailViewProtocol {
    func setComments(comment: Comment?) {
        commentLabel.text = comment?.body
    }
}
