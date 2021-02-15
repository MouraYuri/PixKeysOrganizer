//
//  ContactsViewController.swift
//  PixOrganizer
//
//  Created by Trilogo Tecnologia on 14/02/21.
//

import UIKit

class ContactsViewController: UIViewController {
    
    // MARK: UI elements
    
    lazy var contactsTableView: UITableView = { [unowned self] in
        let obj = UITableView()
        obj.delegate = self
        obj.dataSource = self
        obj.backgroundColor = .green
        obj.register(ContactTableViewCell.self, forCellReuseIdentifier: ContactTableViewCell.identifier)
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()
    
    // MARK: Object lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        self.setupConstraints()
    }
    
    // MARK: UI setup
    
    private func setupConstraints() {
        self.view.addSubview(self.contactsTableView)
        
        NSLayoutConstraint.activate([
            self.contactsTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.contactsTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.contactsTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.contactsTableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension ContactsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.contactsTableView.dequeueReusableCell(withIdentifier: ContactTableViewCell.identifier, for: indexPath)
        if let customCell = cell as? ContactTableViewCell {
            return customCell
        }
        return cell
    }
    
}
