//
//  ProfileController.swift
//  inJob
//
//  Created by Михаил Мерешков on 05.11.2022.
//

import UIKit

final class ProfileController: UIViewController {

    // MARK: - Views

    private lazy var viewProfile: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.965, green: 0.965, blue: 0.965, alpha: 1)
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var imageLog: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 50
        image.layer.masksToBounds = true
        image.image = #imageLiteral(resourceName: "ava")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .regular)
        label.text = "Киборг Убийца"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var valueLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.text = "+7(928)***-**-54"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var viewCell1: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.965, green: 0.965, blue: 0.965, alpha: 1)
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var viewCell2: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.965, green: 0.965, blue: 0.965, alpha: 1)
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleCell1Label: UILabel = {
        let label: UILabel = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.text = "Настройки"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var titleCell2Label: UILabel = {
        let label: UILabel = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.text = "Мои объявления"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var imageLog1: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "gearshape.fill")
        image.tintColor = .darkGray
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var imageLog2: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "plus")
        image.tintColor = .darkGray
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var imageMark1: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "chevron.right")
        image.tintColor = .gray
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var imageMark2: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "chevron.right")
        image.tintColor = .gray
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    // MARK: - Private properties

    private let viewModel: ProfileViewModelProtocol

    // MARK: - Initialization

    init(viewModel: ProfileViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person.crop.circle"), tag: 4)
        self.tabBarItem = tabBarItem
    }

    required init?(coder: NSCoder) {
        fatalError("ProfileController ::: init(coder:) has not been implemented")
    }

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
    }

    // MARK: - Private functions

    private func setupAppearance() {
        view.backgroundColor = .white
        navigationItem.title = "Профиль"

        view.addSubview(viewProfile)
        view.addSubview(imageLog)
        view.addSubview(titleLabel)
        view.addSubview(valueLabel)
        view.addSubview(viewCell1)
        view.addSubview(viewCell2)
        view.addSubview(imageLog1)
        view.addSubview(imageLog2)
        view.addSubview(titleCell1Label)
        view.addSubview(titleCell2Label)
        view.addSubview(imageMark1)
        view.addSubview(imageMark2)
        
        let gesture1 = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction1))
        self.viewCell1.addGestureRecognizer(gesture1)
        let gesture2 = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction2))
        self.viewCell2.addGestureRecognizer(gesture2)
        
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            viewProfile.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            viewProfile.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            viewProfile.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            
            imageLog.leftAnchor.constraint(equalTo: viewProfile.leftAnchor, constant: 8),
            imageLog.topAnchor.constraint(equalTo: viewProfile.topAnchor, constant: 8),
            imageLog.bottomAnchor.constraint(equalTo: viewProfile.bottomAnchor, constant: -8),
            imageLog.widthAnchor.constraint(equalToConstant: 100),
            imageLog.heightAnchor.constraint(equalTo: imageLog.widthAnchor),
            
            titleLabel.leftAnchor.constraint(equalTo: imageLog.rightAnchor, constant: 12),
            titleLabel.rightAnchor.constraint(equalTo: viewProfile.rightAnchor, constant: -12),
            titleLabel.topAnchor.constraint(equalTo: imageLog.topAnchor),
            
            valueLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            valueLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor),
            valueLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            
            viewCell1.leftAnchor.constraint(equalTo: viewProfile.leftAnchor),
            viewCell1.rightAnchor.constraint(equalTo: viewProfile.rightAnchor),
            viewCell1.topAnchor.constraint(equalTo: viewProfile.bottomAnchor, constant: 16),
            
            viewCell2.leftAnchor.constraint(equalTo: viewProfile.leftAnchor),
            viewCell2.rightAnchor.constraint(equalTo: viewProfile.rightAnchor),
            viewCell2.topAnchor.constraint(equalTo: viewCell1.bottomAnchor, constant: 8),
            
            imageLog1.leftAnchor.constraint(equalTo: viewCell1.leftAnchor, constant: 10),
            imageLog1.topAnchor.constraint(equalTo: viewCell1.topAnchor, constant: 10),
            imageLog1.bottomAnchor.constraint(equalTo: viewCell1.bottomAnchor, constant: -10),
            imageLog1.heightAnchor.constraint(equalToConstant: 24),
            imageLog1.widthAnchor.constraint(equalTo: imageLog1.heightAnchor),
            
            imageLog2.leftAnchor.constraint(equalTo: viewCell2.leftAnchor, constant: 10),
            imageLog2.topAnchor.constraint(equalTo: viewCell2.topAnchor, constant: 10),
            imageLog2.bottomAnchor.constraint(equalTo: viewCell2.bottomAnchor, constant: -10),
            imageLog2.heightAnchor.constraint(equalToConstant: 24),
            imageLog2.widthAnchor.constraint(equalTo: imageLog2.heightAnchor),
            
            titleCell1Label.leftAnchor.constraint(equalTo: imageLog1.rightAnchor, constant: 8),
            titleCell1Label.rightAnchor.constraint(equalTo: imageMark1.leftAnchor, constant: -4),
            titleCell1Label.centerYAnchor.constraint(equalTo: imageLog1.centerYAnchor),
            
            titleCell2Label.leftAnchor.constraint(equalTo: imageLog2.rightAnchor, constant: 8),
            titleCell2Label.rightAnchor.constraint(equalTo: imageMark2.leftAnchor, constant: -4),
            titleCell2Label.centerYAnchor.constraint(equalTo: imageLog2.centerYAnchor),
            
            imageMark1.rightAnchor.constraint(equalTo: viewCell1.rightAnchor, constant: -8),
            imageMark1.centerYAnchor.constraint(equalTo: viewCell1.centerYAnchor),
            imageMark1.heightAnchor.constraint(equalToConstant: 16),
            imageMark1.widthAnchor.constraint(equalToConstant: 7),
            
            imageMark2.rightAnchor.constraint(equalTo: viewCell2.rightAnchor, constant: -8),
            imageMark2.centerYAnchor.constraint(equalTo: viewCell2.centerYAnchor),
            imageMark2.heightAnchor.constraint(equalToConstant: 16),
            imageMark2.widthAnchor.constraint(equalToConstant: 7),
        ])
    }

    // MARK: - Actions

    @objc
    private func backBarButtonDidTap() {
        //viewModel.dismiss()
    }

    @objc func didTapButton() {
        //viewModel.didTapAddButton()
    }
    
    @objc func checkAction1(sender : UITapGestureRecognizer) {
        print("r")
    }
    
    @objc func checkAction2(sender : UITapGestureRecognizer) {
        print("d")
    }
}
