//
//  AddContactViewController.swift
//  PixOrganizer
//
//  Created by Trilogo Tecnologia on 16/02/21.
//

import UIKit

class AddContactViewController: UIViewController {

    // MARK: Object lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        self.setupNavBar()
    }
    
    // MARK: Setup UI
    
    private func setupNavBar() {
        self.title = "Add new contact"
    }

}
