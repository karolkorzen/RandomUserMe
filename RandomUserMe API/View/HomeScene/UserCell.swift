//
//  UserCell.swift
//  RandomUserMe API
//
//  Created by Karol Korzeń on 19/01/2022.
//

import UIKit
import SDWebImage

class UserCell: UITableViewCell {
    //MARK: - Properties
    
    private var nameLabel = ViewFactory.standardLabel(withSize: 17, withWeight: .bold, withColor: .black)
    private var profileImageView = ViewFactory.profileImage()
    
    var viewModel: UserViewModel? {
        didSet{
            putData()
        }
    }
    
    //MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    override var frame: CGRect {
            get {
                return super.frame
            }
            set (newFrame) {
                let frame = newFrame
                let f = CGRect(x: frame.origin.x+18, y: frame.origin.y, width: frame.width-36, height: frame.height-10)
                super.frame = f
            }
        }
    
    func putData(){
        guard let viewModel = self.viewModel else {return}
        nameLabel.text = viewModel.nameLabelText
        if let url = viewModel.imageURL {
            profileImageView.sd_setImage(with: url)
            profileImageView.isHidden = false
        } else {
            profileImageView.isHidden = true
        }
    } 
    
    func configureCell(){
        if #available(iOS 13.0, *) {
            backgroundColor = UIColor.label
            nameLabel.textColor = UIColor.systemBackground
        } else {
            backgroundColor = .black
            nameLabel.textColor = .white
        }
        
        self.layer.cornerRadius = 5
        
        nameLabel.setContentCompressionResistancePriority(UILayoutPriority.init(rawValue: 750), for: .horizontal)
        profileImageView.setContentCompressionResistancePriority(UILayoutPriority.init(rawValue: 1000), for: .horizontal)
        nameLabel.setContentHuggingPriority(UILayoutPriority.init(rawValue: 500), for: .horizontal)
        profileImageView.setContentHuggingPriority(UILayoutPriority.init(rawValue: 750), for: .horizontal)

        addSubview(nameLabel)
        addSubview(profileImageView)
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
            
            profileImageView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            profileImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
            profileImageView.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 5)
        ])
    }
}
