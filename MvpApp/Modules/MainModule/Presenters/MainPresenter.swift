//
//  MainPresenter.swift
//  MvpApp
//
//  Created by Boris Bolshakov on 26.12.21.
//

import Foundation


protocol MainViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
}

protocol MainViewPresenterProtocol: AnyObject {
    var comments: [Comment]? {get set}
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)
    func getComments()
    func tapOnTheComment(comment: Comment?)
}


final class MainPresenter: MainViewPresenterProtocol {
    var comments: [Comment]?
    
    weak var view: MainViewProtocol?
    weak var networkService: NetworkServiceProtocol!
    var router: RouterProtocol!
    
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
        getComments()
    }
    
    func getComments() {
        networkService.getComments  {[weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let comments):
                    self.comments = comments
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                    
                }
            }
            
        }
    }
    
    func tapOnTheComment(comment: Comment?) {
        router.showDetail(comment: comment)
    }
    
}
