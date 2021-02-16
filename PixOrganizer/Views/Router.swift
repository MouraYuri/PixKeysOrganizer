//
//  Router.swift
//  PixOrganizer
//
//  Created by Trilogo Tecnologia on 16/02/21.
//

import Foundation
import UIKit

class Router {
    
    private init() {}
    
    static let shared = Router()
    
    func routeToAddContact(from viewController: UIViewController) {
        let destiny = AddContactViewController()
        viewController.navigationController?.pushViewController(destiny, animated: true)
    }
    
}
