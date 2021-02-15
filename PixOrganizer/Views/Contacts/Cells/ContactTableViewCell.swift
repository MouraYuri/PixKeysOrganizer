//
//  ContactTableViewCell.swift
//  PixOrganizer
//
//  Created by Trilogo Tecnologia on 14/02/21.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    
    // MARK: Control variables
    static let identifier = "ContactTableViewCellIdentifier"
    
    // MARK: UI elements
    lazy var contactInfosStackView: UIStackView = {
        let obj = UIStackView()
        obj.axis = .horizontal
        obj.distribution = .fill
        obj.alignment = .center
        obj.spacing = 8
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()
    
    lazy var contactImageView: UIImageView = {
        let obj = UIImageView()
        obj.image = UIImage(named: "userI")
        obj.contentMode = .scaleAspectFit
        obj.layer.masksToBounds = false
        obj.clipsToBounds = true
        obj.layer.cornerRadius = 21
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()
    
    lazy var contactNameLabel: UILabel = {
        let obj = UILabel()
        obj.text = "Rafaela Bezerra"
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()
    
    lazy var isFavoriteIndicatorImageView: UIButton = {
        let obj = UIButton()
        obj.setImage(UIImage(named: "favoritedIcon"), for: .normal)
        obj.contentMode = .scaleAspectFit
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()
    
    // MARK: Object lifecycle
    
    override func willMove(toSuperview newSuperview: UIView?) {
        self.setupConstraints()
    }
    
    override func didMoveToSuperview() {}
    
    // MARK: UI setup
    
    private func setupConstraints() {
        self.contentView.addSubview(self.contactInfosStackView)
        self.contactInfosStackView.addArrangedSubview(self.contactImageView)
        self.contactInfosStackView.addArrangedSubview(self.contactNameLabel)
        self.contactInfosStackView.addArrangedSubview(self.isFavoriteIndicatorImageView)
        
        NSLayoutConstraint.activate([
            self.contactInfosStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.contactInfosStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8),
            self.contactInfosStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.contactInfosStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            self.contactImageView.heightAnchor.constraint(equalToConstant: 42),
            self.contactImageView.widthAnchor.constraint(equalToConstant: 42)
        ])
        
        NSLayoutConstraint.activate([
            self.isFavoriteIndicatorImageView.heightAnchor.constraint(equalToConstant: 32),
            self.isFavoriteIndicatorImageView.widthAnchor.constraint(equalToConstant: 32),
            self.isFavoriteIndicatorImageView.trailingAnchor.constraint(equalTo: self.contactInfosStackView.trailingAnchor)
        ])
    }
    
    // MARK: Auxiliars functions

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
