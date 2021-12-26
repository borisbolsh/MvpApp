//
//  ModuleBuilder.swift
//  MvpApp
//
//  Created by Boris Bolshakov on 26.12.21.
//

import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
}

final class ModuleBuilder: Builder {
    
    static func createMainModule() -> UIViewController {
        let model = Person(firstName: "John", lastName: "Doe")
        let view = MainViewController()
        let presenter = MainPresenter(view: view, person: model)
        view.presenter = presenter
        return view
    }
    
}
