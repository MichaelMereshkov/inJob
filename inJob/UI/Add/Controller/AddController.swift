//
//  AddController.swift
//  inJob
//
//  Created by Михаил Мерешков on 05.11.2022.
//

import UIKit

final class AddController: UIViewController {
    
    // MARK: - Views
    
    private lazy var imageLog: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 10
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var buttonPhoto: UIButton = {
        let button: UIButton = UIButton()
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.setTitle("Добавить фото", for: .normal)
        button.layer.masksToBounds = true
        button.imageView?.image = UIImage(systemName: "photo")
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .regular)
        button.setTitleColor(.darkGray, for: .normal)

        return button
    }()

    // MARK: - Views 1
    
    private lazy var viewCategory: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        label.text = "Название / категория"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.delegate = self
        textField.font = .systemFont(ofSize: 18, weight: .regular)
        textField.addTarget(self, action: #selector(textFieldAllEvents), for: .allEvents)
        //textField.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        textField.textAlignment = .left
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 10
        textField.keyboardType = .default
        //textField.becomeFirstResponder()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    // MARK: - Views 2
    
    private lazy var viewDescription: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var descriptionLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        label.text = "Описание"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textView: UITextView = {
        let textView = UITextView()
        textView.delegate = self
        textView.font = .systemFont(ofSize: 18, weight: .regular)
        textField.addTarget(self, action: #selector(textViewAllEvents), for: .allEvents)
        //textField.addTarget(self, action: #selector(textViewEditingChanged), for: .editingChanged)
        textView.textAlignment = .left
        textView.backgroundColor = .white
        textView.layer.cornerRadius = 10
        textView.keyboardType = .default
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    // MARK: - Views 3
    
    private lazy var viewLocation: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var locationLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        label.text = "Локация"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var locationField: UITextField = {
        let textField = UITextField()
        textField.delegate = self
        textField.font = .systemFont(ofSize: 18, weight: .regular)
        textField.addTarget(self, action: #selector(locationFieldAllEvents), for: .allEvents)
        //textField.addTarget(self, action: #selector(locationFieldEditingChanged), for: .editingChanged)
        textField.textAlignment = .left
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 10
        textField.keyboardType = .default
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    // MARK: - Views 3
    
    private lazy var viewSum: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var sumLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        label.text = "Оплата"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var sumField: UITextField = {
        let textField = UITextField()
        textField.delegate = self
        textField.font = .systemFont(ofSize: 18, weight: .regular)
        textField.addTarget(self, action: #selector(sumFieldAllEvents), for: .allEvents)
        //textField.addTarget(self, action: #selector(sumFieldEditingChanged), for: .editingChanged)
        textField.textAlignment = .left
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 10
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var button: UIButton = {
        let button: UIButton = UIButton()
        button.backgroundColor = .gray
        button.layer.cornerRadius = 10
        button.setTitle("Добавить объявление", for: .normal)
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .regular)
        button.setTitleColor(.white, for: .normal)

        return button
    }()
//    private lazy var tableView: UITableView = {
//        let tableView = UITableView()
//        tableView.backgroundColor = .clear
//        tableView.dataSource = self
//        tableView.delegate = self
//        tableView.separatorStyle = .none
//        tableView.showsVerticalScrollIndicator = false
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//
//        tableView.separatorInset = .init(top: 0, left: 16, bottom: 0, right: 16)
//
//        tableView.register(AddViewCell.self)
////        tableView.register(DepositClinicsView.self)
////        tableView.register(DepositInfoStoryView.self)
////        tableView.register(DepositInfoPaymentView.self)
////        tableView.register(DepositNotReplenishView.self)
//
//        return tableView
//    }()

    // MARK: - Private properties

    private let viewModel: AddViewModelProtocol

    // MARK: - Initialization

    init(viewModel: AddViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.title = "Добавить"
        self.tabBarItem.image = UIImage(systemName: "plus")
    }

    required init?(coder: NSCoder) {
        fatalError("AddController ::: init(coder:) has not been implemented")
    }

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
        setupButton()
    }

    // MARK: - Private functions

    private func setupAppearance() {
        view.backgroundColor = .white
        navigationItem.title = "Добавить объявление"
        
        view.addSubview(imageLog)
        view.addSubview(buttonPhoto)

        view.addSubview(viewCategory)
        view.addSubview(titleLabel)
        view.addSubview(textField)
        
        view.addSubview(viewDescription)
        view.addSubview(descriptionLabel)
        view.addSubview(textView)
        
        view.addSubview(viewLocation)
        view.addSubview(locationLabel)
        view.addSubview(locationField)
        
        view.addSubview(viewSum)
        view.addSubview(sumLabel)
        view.addSubview(sumField)
        
        view.addSubview(button)
        //view.addSubview(tableView)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // MARK: - Constraints
            imageLog.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            imageLog.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            imageLog.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            imageLog.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: 40),
            
            buttonPhoto.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            buttonPhoto.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            buttonPhoto.topAnchor.constraint(equalTo: imageLog.bottomAnchor, constant: 8),
            buttonPhoto.heightAnchor.constraint(equalToConstant: 40),
            
            // MARK: - Constraints 1
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: buttonPhoto.bottomAnchor, constant: 8),
            
            viewCategory.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            viewCategory.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            viewCategory.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 1),
            
            textField.leftAnchor.constraint(equalTo: viewCategory.leftAnchor, constant: 4),
            textField.rightAnchor.constraint(equalTo: viewCategory.rightAnchor, constant: -4),
            textField.topAnchor.constraint(equalTo: viewCategory.topAnchor, constant: 4),
            textField.bottomAnchor.constraint(equalTo: viewCategory.bottomAnchor, constant: -4),
            
            // MARK: - Constraints 2
            descriptionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            descriptionLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            descriptionLabel.topAnchor.constraint(equalTo: viewCategory.bottomAnchor, constant: 8),
            
            viewDescription.leftAnchor.constraint(equalTo: viewCategory.leftAnchor),
            viewDescription.rightAnchor.constraint(equalTo: viewCategory.rightAnchor),
            viewDescription.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 1),
            
            textView.leftAnchor.constraint(equalTo: viewDescription.leftAnchor, constant: 4),
            textView.rightAnchor.constraint(equalTo: viewDescription.rightAnchor, constant: -4),
            textView.topAnchor.constraint(equalTo: viewDescription.topAnchor, constant: 4),
            textView.bottomAnchor.constraint(equalTo: viewDescription.bottomAnchor, constant: -4),
            textView.heightAnchor.constraint(equalToConstant: 100),
            
            // MARK: - Constraints 3
            locationLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            locationLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            locationLabel.topAnchor.constraint(equalTo: viewDescription.bottomAnchor, constant: 8),
            
            viewLocation.leftAnchor.constraint(equalTo: viewCategory.leftAnchor),
            viewLocation.rightAnchor.constraint(equalTo: viewCategory.rightAnchor),
            viewLocation.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 1),
            
            locationField.leftAnchor.constraint(equalTo: viewLocation.leftAnchor, constant: 4),
            locationField.rightAnchor.constraint(equalTo: viewLocation.rightAnchor, constant: -4),
            locationField.topAnchor.constraint(equalTo: viewLocation.topAnchor, constant: 4),
            locationField.bottomAnchor.constraint(equalTo: viewLocation.bottomAnchor, constant: -4),
            
            // MARK: - Constraints 4
            sumLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            sumLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            sumLabel.topAnchor.constraint(equalTo: viewLocation.bottomAnchor, constant: 8),
            
            viewSum.leftAnchor.constraint(equalTo: viewCategory.leftAnchor),
            viewSum.rightAnchor.constraint(equalTo: viewCategory.rightAnchor),
            viewSum.topAnchor.constraint(equalTo: sumLabel.bottomAnchor, constant: 1),
            
            sumField.leftAnchor.constraint(equalTo: viewSum.leftAnchor, constant: 4),
            sumField.rightAnchor.constraint(equalTo: viewSum.rightAnchor, constant: -4),
            sumField.topAnchor.constraint(equalTo: viewSum.topAnchor, constant: 4),
            sumField.bottomAnchor.constraint(equalTo: viewSum.bottomAnchor, constant: -4),
            
            button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32),
            button.heightAnchor.constraint(equalToConstant: 40),
            
//            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
//            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
//            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func setupButton() {
        if textField.text != "", textView.text != "", locationField.text != "", sumField.text != "" {
            button.backgroundColor = .black
        } else {
            button.backgroundColor = .gray
        }
    }

    // MARK: - Actions
    
    @objc
    func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
        textView.resignFirstResponder()
        locationField.resignFirstResponder()
        sumField.resignFirstResponder()
        }
    
    @objc func textFieldAllEvents(textField: UITextField) {
        let completeString = textField.text
        
        if completeString != "" {
            setupButton()
        }
            
    }
    
    @objc func textViewAllEvents(textView: UITextView) {
        let completeString = textView.text
        
        if completeString != "" {
            setupButton()
        }
            
    }
    
    @objc func locationFieldAllEvents(textField: UITextField) {
        let completeString = textField.text
        
        if completeString != "" {
            setupButton()
        }
            
    }
    
    @objc func sumFieldAllEvents(textField: UITextField) {
        let completeString = textField.text
        
        if completeString != "" {
            setupButton()
        }
            
    }

    @objc
    private func backBarButtonDidTap() {
        //viewModel.dismiss()
    }

    @objc func didTapButton() {
        //viewModel.didTapAddButton()
    }
}

// MARK: - UITextFieldDelegate

extension AddController: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentCharacterCount = textField.text?.count ?? 0

        if range.length + range.location > currentCharacterCount {
            return false
        }

        let newLength = currentCharacterCount + string.count - range.length

        return newLength <= 9
    }
}


// MARK: - UITextFieldDelegate

extension AddController: UITextViewDelegate {

}

// MARK: - UITableViewDataSource

//extension AddController: UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let item = viewModel.sections[indexPath.section].items[indexPath.row]
//        let cell = tableView.dequeueReusableCell(withIdentifier: item.cellId, for: indexPath)
//        if let cell = cell as? TableCellConfigurable {
//            cell.setup(viewModel: item)
//        }
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return viewModel.sections.element(at: section)?.items.count ?? 0
//    }
//}
//
//// MARK: - UITableViewDelegate
//
//extension AddController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        //viewModel.didSelectItem(at: indexPath)
//    }
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 12
//    }
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return UIView()
//    }
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return viewModel.sections.count
//    }
//}
