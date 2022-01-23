//
//  DetailsViewController.swift
//  RandomUserMe API
//
//  Created by Karol Korzeń on 19/01/2022.
//

import UIKit
import SDWebImage

class DetailsViewController: UIViewController {
    //MARK: - Properties
    
    var viewModel: UserViewModel
    
    private let headerView: UIView = {
        let v = UIView()
        if #available(iOS 13.0, *) {
            v.backgroundColor = .label
        } else {
            v.backgroundColor = .black
        }
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 5
        v.layer.zPosition = -1
        return v
    }()
    
    private let infoView: UIView = {
        let v = UIView()
        if #available(iOS 13.0, *) {
            v.backgroundColor = .label
        } else {
            v.backgroundColor = .black
        }
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 5
        v.layer.zPosition = -1
        return v
    }()
    
    private var nameLabel = ViewFactory.standardLabel(withSize: 17, withWeight: .bold, withColor: .black)
    private var profileImageView = ViewFactory.profileImage()
    
    private var phoneTitleLabel = ViewFactory.standardLabel(withSize: 13, withWeight: .regular, withColor: .black)
    private var genderTitleLabel = ViewFactory.standardLabel(withSize: 13, withWeight: .regular, withColor: .black)
    private var emailTitleLabel = ViewFactory.standardLabel(withSize: 13, withWeight: .regular, withColor: .black)
    private var nationalityTitleLabel = ViewFactory.standardLabel(withSize: 13, withWeight: .regular, withColor: .black)
    
    private var phoneLabel = ViewFactory.standardLabel(withSize: 15, withWeight: .bold, withColor: .black)
    private var genderLabel = ViewFactory.standardLabel(withSize: 15, withWeight: .bold, withColor: .black)
    private var emailLabel = ViewFactory.standardLabel(withSize: 15, withWeight: .bold, withColor: .black)
    private var nationalityLabel = ViewFactory.standardLabel(withSize: 15, withWeight: .bold, withColor: .black)
    
    //MARK: - Lifecycle
    
    init(withViewModel viewModel: UserViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        configureUI()
        putData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Selectors
    
    @objc func mapButtonClicked(){
        if let coordinates = viewModel.getCoordinates {
            let viewModel = MapSceneViewModel(withCoordinates: (coordinates.0, coordinates.1))
            let controller = MapViewController(withViewModel: viewModel)
            self.navigationController?.pushViewController(controller, animated: true)
        } else {
            let alert = UIAlertController(title: "User has no location", message: "", preferredStyle: UIAlertController.Style.alert)
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    //MARK: - Helpers
    
    func putData(){
        nameLabel.text = viewModel.nameLabelText
        if let url = viewModel.imageURL {
            profileImageView.sd_setImage(with: url)
            profileImageView.isHidden = false
        } else {
            profileImageView.isHidden = true
        }
        phoneTitleLabel.text = viewModel.phoneTitleLabelText
        genderTitleLabel.text = viewModel.genderTitleLabelText
        emailTitleLabel.text = viewModel.emailTitleLabelText
        nationalityTitleLabel.text = viewModel.nationalityTitleLabelText
        
        phoneLabel.text = viewModel.phoneLabelText
        genderLabel.text = viewModel.genderLabelText
        emailLabel.text = viewModel.emailLabelText
        nationalityLabel.text = viewModel.nationalityLabelText
    }
    
    func configureUI(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "map"), style: .plain, target: self, action: #selector(mapButtonClicked))
        
        if #available(iOS 13.0, *) {
            navigationItem.rightBarButtonItem?.tintColor = .label
            view.backgroundColor = UIColor.systemBackground
            nameLabel.textColor = .systemBackground
            phoneTitleLabel.textColor = .systemBackground
            genderTitleLabel.textColor = .systemBackground
            emailTitleLabel.textColor = .systemBackground
            nationalityTitleLabel.textColor = .systemBackground
            phoneLabel.textColor = .systemBackground
            genderLabel.textColor = .systemBackground
            emailLabel.textColor = .systemBackground
            nationalityLabel.textColor = .systemBackground
        } else {
            navigationItem.rightBarButtonItem?.tintColor = .black
            view.backgroundColor = .white
            nameLabel.textColor = .white
            phoneTitleLabel.textColor = .white
            genderTitleLabel.textColor = .white
            emailTitleLabel.textColor = .white
            nationalityTitleLabel.textColor = .white
            phoneLabel.textColor = .white
            genderLabel.textColor = .white
            emailLabel.textColor = .white
            nationalityLabel.textColor = .white
        }
        
        nameLabel.setContentCompressionResistancePriority(UILayoutPriority.init(rawValue: 750), for: .horizontal)
        profileImageView.setContentCompressionResistancePriority(UILayoutPriority.init(rawValue: 1000), for: .horizontal)
        nameLabel.setContentHuggingPriority(UILayoutPriority.init(rawValue: 500), for: .horizontal)
        profileImageView.setContentHuggingPriority(UILayoutPriority.init(rawValue: 750), for: .horizontal)
        
        phoneTitleLabel.setContentCompressionResistancePriority(UILayoutPriority.init(rawValue: 750), for: .horizontal)
        phoneLabel.setContentCompressionResistancePriority(UILayoutPriority.init(rawValue: 1000), for: .horizontal)
        phoneTitleLabel.setContentHuggingPriority(UILayoutPriority.init(rawValue: 500), for: .horizontal)
        phoneLabel.setContentHuggingPriority(UILayoutPriority.init(rawValue: 750), for: .horizontal)

        genderTitleLabel.setContentCompressionResistancePriority(UILayoutPriority.init(rawValue: 750), for: .horizontal)
        genderLabel.setContentCompressionResistancePriority(UILayoutPriority.init(rawValue: 1000), for: .horizontal)
        genderTitleLabel.setContentHuggingPriority(UILayoutPriority.init(rawValue: 500), for: .horizontal)
        genderLabel.setContentHuggingPriority(UILayoutPriority.init(rawValue: 750), for: .horizontal)

        emailTitleLabel.setContentCompressionResistancePriority(UILayoutPriority.init(rawValue: 750), for: .horizontal)
        emailLabel.setContentCompressionResistancePriority(UILayoutPriority.init(rawValue: 1000), for: .horizontal)
        emailTitleLabel.setContentHuggingPriority(UILayoutPriority.init(rawValue: 500), for: .horizontal)
        emailLabel.setContentHuggingPriority(UILayoutPriority.init(rawValue: 750), for: .horizontal)

        nationalityTitleLabel.setContentCompressionResistancePriority(UILayoutPriority.init(rawValue: 750), for: .horizontal)
        nationalityLabel.setContentCompressionResistancePriority(UILayoutPriority.init(rawValue: 1000), for: .horizontal)
        nationalityTitleLabel.setContentHuggingPriority(UILayoutPriority.init(rawValue: 500), for: .horizontal)
        nationalityLabel.setContentHuggingPriority(UILayoutPriority.init(rawValue: 750), for: .horizontal)

        view.addSubview(headerView)
        view.addSubview(infoView)
        view.addSubview(profileImageView)
        view.addSubview(nameLabel)
        view.addSubview(phoneTitleLabel)
        view.addSubview(genderTitleLabel)
        view.addSubview(emailTitleLabel)
        view.addSubview(nationalityTitleLabel)
        view.addSubview(phoneLabel)
        view.addSubview(genderLabel)
        view.addSubview(emailLabel)
        view.addSubview(nationalityLabel)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            headerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -18),
            headerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 18),
            headerView.heightAnchor.constraint(equalToConstant: 90),
            
            nameLabel.leadingAnchor.constraint(equalTo: headerView.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            nameLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor, constant: 0),
            
            profileImageView.trailingAnchor.constraint(equalTo: headerView.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            profileImageView.centerYAnchor.constraint(equalTo: headerView.centerYAnchor, constant: 0),
            profileImageView.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 5),
            
            phoneLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -10),
            phoneLabel.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20),
            phoneTitleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 10),
            phoneTitleLabel.firstBaselineAnchor.constraint(equalTo: phoneLabel.firstBaselineAnchor),
            phoneLabel.leadingAnchor.constraint(equalTo: phoneTitleLabel.trailingAnchor, constant: 5),
            
            genderLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -10),
            genderLabel.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 10),
            genderTitleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 10),
            genderTitleLabel.firstBaselineAnchor.constraint(equalTo: genderLabel.firstBaselineAnchor),
            genderLabel.leadingAnchor.constraint(equalTo: genderTitleLabel.trailingAnchor, constant: 5),
            
            emailLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -10),
            emailLabel.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 10),
            emailTitleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 10),
            emailTitleLabel.firstBaselineAnchor.constraint(equalTo: emailLabel.firstBaselineAnchor),
            emailLabel.leadingAnchor.constraint(equalTo: emailTitleLabel.trailingAnchor, constant: 5),
            
            nationalityLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -10),
            nationalityLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            nationalityTitleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 10),
            nationalityTitleLabel.firstBaselineAnchor.constraint(equalTo: nationalityLabel.firstBaselineAnchor),
            nationalityLabel.leadingAnchor.constraint(equalTo: nationalityTitleLabel.trailingAnchor, constant: 5),
            
            infoView.topAnchor.constraint(equalTo: phoneLabel.topAnchor, constant: -10),
            infoView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -18),
            infoView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 18),
            infoView.bottomAnchor.constraint(equalTo: nationalityLabel.bottomAnchor, constant: 10)
        ])
    }
}
