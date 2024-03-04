//
//  AddController.swift
//  inJob
//
//  Created by Михаил Мерешков on 05.11.2022.
//

import UIKit
import CoreData

final class AddController: UIViewController {
    
    // MARK: - Views
    
    private lazy var scrollView: UIScrollView = {
        let image = UIScrollView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var addView: UIView = {
        let image = UIView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var imageLog: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 10
//        image.layer.borderWidth = 1
        image.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        image.image = #imageLiteral(resourceName: "default_icon")
        //image.tintColor = .gray
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var buttonPhoto: UIButton = {
        let button: UIButton = UIButton()
        button.backgroundColor = UIColor(red: 0.77, green: 0.1, blue: 0.1, alpha: 1)
        button.layer.cornerRadius = 10
        button.setTitle("  Добавить фото", for: .normal)
        button.layer.masksToBounds = true
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        //button.layer.borderWidth = 1
        //button.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .regular)
        button.setTitleColor(.white, for: .normal)

        return button
    }()

    // MARK: - Views 1
    
    private lazy var viewCategory: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.77, green: 0.1, blue: 0.1, alpha: 1).cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(red: 0.77, green: 0.1, blue: 0.1, alpha: 1)
        label.text = "Название / категория"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите название"
        textField.font = .systemFont(ofSize: 18, weight: .regular)
        textField.addTarget(self, action: #selector(textFieldAllEvents), for: .allEvents)
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
        view.layer.borderColor = UIColor(red: 0.77, green: 0.1, blue: 0.1, alpha: 1).cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var descriptionLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(red: 0.77, green: 0.1, blue: 0.1, alpha: 1)
        label.text = "Описание"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 18, weight: .regular)
        textView.textAlignment = .left
        textView.backgroundColor = .white
        textView.layer.cornerRadius = 8
        textView.keyboardType = .default
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    // MARK: - Views 3
    
    private lazy var viewLocation: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.77, green: 0.1, blue: 0.1, alpha: 1).cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var locationLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(red: 0.77, green: 0.1, blue: 0.1, alpha: 1)
        label.text = "Локация"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var locationField: UITextField = {
        let textField = UITextField()
        textField.inputView = pickerView
        textField.font = .systemFont(ofSize: 18, weight: .regular)
        textField.addTarget(self, action: #selector(locationFieldAllEvents), for: .allEvents)
        textField.textAlignment = .left
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 10
        textField.placeholder = "Выберите локацию"
        textField.keyboardType = .default
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var pickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        return picker
    }()
    
    // MARK: - Views 4
    
    private lazy var viewSum: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.77, green: 0.1, blue: 0.1, alpha: 1).cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var sumLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.text = "Оплата"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var sumField: UITextField = {
        let textField = UITextField()
        //textField.delegate = self
        textField.font = .systemFont(ofSize: 18, weight: .regular)
        textField.addTarget(self, action: #selector(sumFieldAllEvents), for: .allEvents)
        textField.placeholder = "Введите сумму оплыты"
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
        button.isEnabled = false
        button.addTarget(self, action: #selector(backBarButtonDidTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .regular)
        button.setTitleColor(.white, for: .normal)

        return button
    }()

    // MARK: - Private properties

    private var kbFrameSize = CGRect()
    private var router: SearchRouterProtocol?
    private let viewModel: AddViewModelProtocol

    // MARK: - Initialization

    init(viewModel: AddViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.title = "Добавить"
        //self.tabBarItem.image = UIImage(systemName: "plus")
    }

    required init?(coder: NSCoder) {
        fatalError("AddController ::: init(coder:) has not been implemented")
    }
    
    deinit {
        removeKeyboardNotifications()
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
        
        view.addSubview(scrollView)
        scrollView.addSubview(addView)
        
        addView.addSubview(imageLog)
        addView.addSubview(buttonPhoto)

        addView.addSubview(viewCategory)
        addView.addSubview(titleLabel)
        addView.addSubview(textField)
        
        addView.addSubview(viewDescription)
        addView.addSubview(descriptionLabel)
        addView.addSubview(textView)
        
        addView.addSubview(viewLocation)
        addView.addSubview(locationLabel)
        addView.addSubview(locationField)
        
        addView.addSubview(viewSum)
        addView.addSubview(sumLabel)
        addView.addSubview(sumField)
        
        view.addSubview(button)
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        setupConstraints()
        registerForKeyboardNotifications()
    }
    
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillShow), name: AddController.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillHide), name: AddController.keyboardWillHideNotification, object: nil)
    }
    
    func removeKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: AddController.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: AddController.keyboardWillHideNotification, object: nil)
    }
    
    @objc func kbWillShow(_ notification: Notification) {
        let userInfo = notification.userInfo
        kbFrameSize = (userInfo?[AddController.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        scrollView.contentOffset = CGPoint(x: 0, y: kbFrameSize.height - view.safeAreaInsets.bottom - 25)
    }
    
    @objc func kbWillHide() {
        scrollView.contentOffset = CGPoint.zero
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            addView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            addView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            addView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            addView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            addView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            addView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            // MARK: - Constraints
            imageLog.leftAnchor.constraint(equalTo: addView.leftAnchor, constant: 16),
            imageLog.rightAnchor.constraint(equalTo: addView.rightAnchor, constant: -16),
            imageLog.topAnchor.constraint(equalTo: addView.safeAreaLayoutGuide.topAnchor, constant: 4),
            imageLog.bottomAnchor.constraint(equalTo: addView.centerYAnchor, constant: -100),
            
            buttonPhoto.leftAnchor.constraint(equalTo: addView.leftAnchor, constant: 16),
            buttonPhoto.rightAnchor.constraint(equalTo: addView.rightAnchor, constant: -16),
            buttonPhoto.topAnchor.constraint(equalTo: imageLog.bottomAnchor, constant: 8),
            buttonPhoto.heightAnchor.constraint(equalToConstant: 40),
            
            // MARK: - Constraints 1
            titleLabel.leftAnchor.constraint(equalTo: addView.leftAnchor, constant: 16),
            titleLabel.rightAnchor.constraint(equalTo: addView.rightAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: buttonPhoto.bottomAnchor, constant: 32),
            
            viewCategory.leftAnchor.constraint(equalTo: addView.leftAnchor, constant: 16),
            viewCategory.rightAnchor.constraint(equalTo: addView.rightAnchor, constant: -16),
            viewCategory.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 1),
            
            textField.leftAnchor.constraint(equalTo: viewCategory.leftAnchor, constant: 4),
            textField.rightAnchor.constraint(equalTo: viewCategory.rightAnchor, constant: -4),
            textField.topAnchor.constraint(equalTo: viewCategory.topAnchor, constant: 4),
            textField.bottomAnchor.constraint(equalTo: viewCategory.bottomAnchor, constant: -4),
            
            // MARK: - Constraints 2
            descriptionLabel.leftAnchor.constraint(equalTo: addView.leftAnchor, constant: 16),
            descriptionLabel.rightAnchor.constraint(equalTo: addView.rightAnchor, constant: -16),
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
            locationLabel.leftAnchor.constraint(equalTo: addView.leftAnchor, constant: 16),
            locationLabel.rightAnchor.constraint(equalTo: addView.rightAnchor, constant: -16),
            locationLabel.topAnchor.constraint(equalTo: viewDescription.bottomAnchor, constant: 8),
            
            viewLocation.leftAnchor.constraint(equalTo: viewCategory.leftAnchor),
            viewLocation.rightAnchor.constraint(equalTo: viewCategory.rightAnchor),
            viewLocation.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 1),
            
            locationField.leftAnchor.constraint(equalTo: viewLocation.leftAnchor, constant: 4),
            locationField.rightAnchor.constraint(equalTo: viewLocation.rightAnchor, constant: -4),
            locationField.topAnchor.constraint(equalTo: viewLocation.topAnchor, constant: 4),
            locationField.bottomAnchor.constraint(equalTo: viewLocation.bottomAnchor, constant: -4),
            
            // MARK: - Constraints 4
            sumLabel.leftAnchor.constraint(equalTo: addView.leftAnchor, constant: 16),
            sumLabel.rightAnchor.constraint(equalTo: addView.rightAnchor, constant: -16),
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
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            button.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    private func setupButton() {
        if textField.text != "", textView.text != "", locationField.text != "", sumField.text != "" {
            button.backgroundColor = UIColor(red: 0.77, green: 0.1, blue: 0.1, alpha: 1)
            button.isEnabled = true
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
        
        if let t: String = textField.text {
            textField.text = String(t.prefix(40))
        }
            
    }
    
    @objc func textViewAllEvents(textView: UITextView) {
        let completeString = textView.text
        
        if completeString != "" {
            setupButton()
        }
        
        if let t: String = textView.text {
            textView.text = String(t.prefix(110))
        }
    }
    
    @objc func locationFieldAllEvents(textField: UITextField) {
        let completeString = textField.text
        
        if completeString != "" {
            setupButton()
        }
        
        if let t: String = textField.text {
            textField.text = String(t.prefix(40))
        }
    }
    
    @objc func sumFieldAllEvents(textField: UITextField) {
        let completeString = textField.text
        
        if completeString != "" {
            setupButton()
        }
        
        if let t: String = textField.text {
            textField.text = String(t.prefix(6))
        }
    }

    @objc
    private func backBarButtonDidTap() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: "Items", in: context) else { return }
        
        let taskObject = Items(entity: entity, insertInto: context)
        let jpegImageData = imageLog.image?.jpegData(compressionQuality: 1.0)
        taskObject.image = jpegImageData
        taskObject.title = textField.text
        taskObject.value = textView.text
        taskObject.location = locationField.text
        taskObject.sum = Int64(sumField.text ?? "") ?? 0
        taskObject.textName = textName
        taskObject.textPhone = textPhone
        taskObject.textMail = textMail
        
        do {
            try context.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        imageLog.image = #imageLiteral(resourceName: "default_icon")
        textField.text = ""
        textView.text = ""
        locationField.text = ""
        sumField.text = ""
        
        button.backgroundColor = .gray
        button.isEnabled = false
        
        viewModel.didTapAddButton()
    }

    @objc
    func didTapButton() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
}

extension AddController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image  = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            imageLog.image = image
        }
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}

// MARK: - UIPickerViewDelegate & UIPickerViewDataSource

extension AddController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        viewModel.location.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        viewModel.location[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        locationField.text = viewModel.location[row]
        locationField.resignFirstResponder()
    }

}
