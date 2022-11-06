//
//  AddViewCell.swift
//  inJob
//
//  Created by Михаил Мерешков on 06.11.2022.
//

import UIKit

final class AddViewCell: UITableViewCell, TableCellConfigurable {

    // MARK: - Views

    private lazy var titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.delegate = self
        textField.font = .systemFont(ofSize: 18, weight: .regular)
//        textField.addTarget(self, action: #selector(textFieldAllEvents), for: .allEvents)
//        textField.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        textField.textAlignment = .left
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.keyboardType = .numberPad
        //textField.becomeFirstResponder()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    // MARK: - Private properties
    
    private var result = 20

    private var currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.currencyCode = "RUB"
        formatter.currencyDecimalSeparator = ","
        formatter.currencyGroupingSeparator = " "
        formatter.currencySymbol = "₽"
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 0
        formatter.numberStyle = .currency
        return formatter
    }()

    // MARK: - Constructor

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupAppearance()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupAppearance()
    }

    // MARK: - Lifecycle


    override func prepareForReuse() {
        super.prepareForReuse()
        layer.mask = nil
        titleLabel.font = .systemFont(ofSize: 24, weight: .regular)
    }

    // MARK: - Functions

    func setup(viewModel: TableCellViewModelProtocol) {
        guard let viewModel = viewModel as? AddItemsViewModelProtocol else { return }
        
        titleLabel.text = viewModel.title
        result = viewModel.result
        textField.keyboardType = viewModel.keyboardType
        
//        if let price = currencyFormatter.string(from: viewModel.sum as NSNumber) {
//            sumLabel.text = "Оплата: \(String(format: price))"
//        }
    }

    // MARK: - Private functions

    private func setupAppearance() {
        backgroundColor = .white
        selectionStyle = .none
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor

        contentView.addSubview(titleLabel)
        contentView.addSubview(textField)

        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -12),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            
            textField.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            textField.rightAnchor.constraint(equalTo: titleLabel.rightAnchor),
            textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            textField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6)
        ])
    }
}

// MARK: - UITextFieldDelegate

extension AddViewCell: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentCharacterCount = textField.text?.count ?? 0

        if range.length + range.location > currentCharacterCount {
            return false
        }

        let newLength = currentCharacterCount + string.count - range.length

        return newLength <= result
    }
}
