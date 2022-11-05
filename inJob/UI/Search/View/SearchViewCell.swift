//
//  SearchViewCell.swift
//  inJob
//
//  Created by Михаил Мерешков on 05.11.2022.
//

import UIKit

final class SearchViewCell: UITableViewCell, TableCellConfigurable {

    // MARK: - Views
    
    private lazy var imageLog: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 10
        image.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var valueLabel: UILabel = {
        let label: UILabel = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var locationLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var sumLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var buttonContacts: UIButton = {
        let button: UIButton = UIButton()
        button.setBackgroundColor(.white, for: .normal)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 16
        button.setTitle("КОНТАКТЫ", for: .normal)
        button.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        button.setTitleColor(.black, for: .normal)

        button.addConstraints([
            //button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 42),
        ])

        return button
    }()
    
    private lazy var buttonResponses: UIButton = {
        let button: UIButton = UIButton()
        button.setBackgroundColor(.black, for: .normal)
        button.layer.cornerRadius = 16
        button.layer.masksToBounds = true
        button.setTitle("ОТКЛИКНУТЬСЯ", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        button.setTitleColor(.white, for: .normal)

        button.addConstraints([
            //button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 42),
        ])

        return button
    }()

    // MARK: - Private properties

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
        imageLog.image = nil
        titleLabel.font = .systemFont(ofSize: 24, weight: .regular)
        valueLabel.font = .systemFont(ofSize: 16, weight: .regular)
        locationLabel.font = .systemFont(ofSize: 16, weight: .regular)
        sumLabel.font = .systemFont(ofSize: 16, weight: .regular)
        
    }

    // MARK: - Functions

    func setup(viewModel: TableCellViewModelProtocol) {
        guard let viewModel = viewModel as? SearchItemsViewModelProtocol else { return }

        imageLog.image = viewModel.image
        titleLabel.text = viewModel.title
        valueLabel.text = viewModel.value
        locationLabel.text = "Локация: \(viewModel.location)"
        
        if let price = currencyFormatter.string(from: viewModel.sum as NSNumber) {
            sumLabel.text = "Оплата: \(String(format: price))"
        }
    }

    // MARK: - Private functions

    private func setupAppearance() {
        backgroundColor = UIColor(red: 0.965, green: 0.965, blue: 0.965, alpha: 1)
        selectionStyle = .none
        layer.cornerRadius = 10

        contentView.addSubview(imageLog)
        contentView.addSubview(titleLabel)
        contentView.addSubview(valueLabel)
        contentView.addSubview(locationLabel)
        contentView.addSubview(sumLabel)
        contentView.addSubview(buttonContacts)
        contentView.addSubview(buttonResponses)

        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageLog.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            imageLog.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            imageLog.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageLog.heightAnchor.constraint(equalToConstant: 150),
            
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: imageLog.bottomAnchor, constant: 16),

            valueLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            valueLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor),
            valueLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            
            locationLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            locationLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor),
            locationLabel.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 5),
            
            sumLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            sumLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor),
            sumLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor),
            
            buttonContacts.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            buttonContacts.rightAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -8),
            buttonContacts.topAnchor.constraint(equalTo: sumLabel.bottomAnchor, constant: 10),
            buttonContacts.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            buttonResponses.leftAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 8),
            buttonResponses.rightAnchor.constraint(equalTo: titleLabel.rightAnchor),
            buttonResponses.topAnchor.constraint(equalTo: sumLabel.bottomAnchor, constant: 10),
        ])
    }
}