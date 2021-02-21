//
//  ContactsViewController.swift
//  PixOrganizer
//
//  Created by Trilogo Tecnologia on 14/02/21.
//

import UIKit
import ViewModels

class ListContactsViewController: UIViewController {
    
    // MARK: Control variables
    let viewModel = ListContactsViewModel()
    
    // MARK: UI elements
    
    lazy private(set) var searchBar: UISearchBar = {
        let obj = UISearchBar()
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()
    
    lazy private(set) var contactsTableView: UITableView = { [unowned self] in
        let obj = UITableView()
        obj.delegate = self
        obj.dataSource = self
        obj.backgroundColor = .clear
        obj.separatorStyle = .none
        obj.register(ContactTableViewCell.self, forCellReuseIdentifier: ContactTableViewCell.identifier)
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()
    
    // MARK: Object lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .mainBackgroundColor
        self.setupConstraints()
        self.setupNavBar()
    }
    
    // MARK: UI setup
    
    private func setupConstraints() {
        self.view.addSubview(self.searchBar)
        self.view.addSubview(self.contactsTableView)
        
        NSLayoutConstraint.activate([
            self.searchBar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.searchBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.searchBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.contactsTableView.topAnchor.constraint(equalTo: self.searchBar.bottomAnchor),
            self.contactsTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.contactsTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.contactsTableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupNavBar() {
        let barButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewContactAction))
        self.navigationItem.rightBarButtonItem = barButton
        self.title = "Contacts"
    }
    
    // MARK: Actions
    
    @objc
    private func addNewContactAction() {
        Router.shared.routeToAddContact(from: self)
    }
}

extension ListContactsViewController: UITableViewDelegate, UITableViewDataSource {
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let screenHeight = UIScreen.main.bounds.height
        return screenHeight / 12
    }
    
}
