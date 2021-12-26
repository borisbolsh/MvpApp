//
//  DetailPresenter.swift
//  MvpApp
//
//  Created by Boris Bolshakov on 26.12.21.
//

import Foundation

protocol DetailViewProtocol: AnyObject {
    func setComments(comment: Comment?)
}

protocol DetailPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, comment: Comment?)
    func setComment()

}


class DetailPresenter: DetailPresenterProtocol {

    weak var view: DetailViewProtocol?
    let networkService: NetworkServiceProtocol!
    var comment: Comment?
    
    
    required init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, comment: Comment?) {
        self.view = view
        self.networkService = networkService
        self.comment = comment
    }
    
    func setComment() {
        self.view?.setComments(comment: comment)
    }
    
    
}
