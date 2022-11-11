//
//  SearchViewCell.swift
//  inJob
//
//  Created by Михаил Мерешков on 05.11.2022.
//

import UIKit

final class SearchViewCell: UITableViewCell, TableCellConfigurable {

    // MARK: - Views
    
    private lazy var viewScreen: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.965, green: 0.965, blue: 0.965, alpha: 1)
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(systemName: "heart.fill")
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        return iconImageView
    }()
    
    private lazy var iconImage: UIButton = {
        let iconImage = UIButton()
        iconImage.setImage(iconImageView.image, for: .normal)
        iconImage.tintColor = .white
        iconImage.addTarget(self, action: #selector(touchConfirmButton), for: .touchUpInside)
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        
        return iconImage
    }()
    
    private lazy var imageLog: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
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
        button.layer.cornerRadius = 21
        button.setTitle("Контакты", for: .normal)
        button.layer.borderColor = UIColor(ciColor: CIColor(red: 0.77, green: 0.1, blue: 0.1, alpha: 1)).cgColor
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
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
        button.setBackgroundColor(UIColor(red: 0.77, green: 0.1, blue: 0.1, alpha: 1), for: .normal)
        button.layer.cornerRadius = 21
        button.layer.masksToBounds = true
        button.setTitle("Откликнуться", for: .normal)
        button.addTarget(self, action: #selector(didTapButtonRes), for: .touchUpInside)
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

    private var viewModel: SearchItemsViewModelProtocol?
    
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
        viewScreen.layer.mask = nil
        imageLog.image = nil
        titleLabel.font = .systemFont(ofSize: 24, weight: .regular)
        valueLabel.font = .systemFont(ofSize: 16, weight: .regular)
        locationLabel.font = .systemFont(ofSize: 16, weight: .regular)
        sumLabel.font = .systemFont(ofSize: 16, weight: .regular)
        
    }

    // MARK: - Functions

    func setup(viewModel: TableCellViewModelProtocol) {
        guard let viewModel = viewModel as? SearchItemsViewModelProtocol else { return }
        self.viewModel = viewModel

        imageLog.image = viewModel.image
        titleLabel.text = viewModel.title
        valueLabel.text = viewModel.value
        locationLabel.text = "Локация:  \(viewModel.location)"
        
        if let price = currencyFormatter.string(from: viewModel.sum as NSNumber) {
            sumLabel.text = "Оплата:  \(String(format: price))"
        }
    }

    // MARK: - Private functions

    private func setupAppearance() {
        backgroundColor = .clear
        selectionStyle = .none
        layer.cornerRadius = 10

        contentView.addSubview(viewScreen)
        contentView.addSubview(imageLog)
        contentView.addSubview(iconImage)
        iconImage.addSubview(iconImageView)
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
            viewScreen.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            viewScreen.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            viewScreen.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 32),
            viewScreen.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            imageLog.leftAnchor.constraint(equalTo: viewScreen.leftAnchor),
            imageLog.rightAnchor.constraint(equalTo: viewScreen.rightAnchor),
            imageLog.topAnchor.constraint(equalTo: viewScreen.topAnchor),
            imageLog.heightAnchor.constraint(equalToConstant: 200),
            
            iconImage.rightAnchor.constraint(equalTo: imageLog.rightAnchor, constant: -10),
            iconImage.topAnchor.constraint(equalTo: imageLog.topAnchor, constant: 10),
            iconImage.heightAnchor.constraint(equalToConstant: 30),
            iconImage.widthAnchor.constraint(equalTo: iconImage.heightAnchor),
            
            iconImageView.widthAnchor.constraint(equalTo: iconImage.widthAnchor),
            iconImageView.heightAnchor.constraint(equalTo: iconImage.heightAnchor),
            
            titleLabel.leftAnchor.constraint(equalTo: viewScreen.leftAnchor, constant: 16),
            titleLabel.rightAnchor.constraint(equalTo: viewScreen.rightAnchor, constant: -16),
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
            buttonContacts.rightAnchor.constraint(equalTo: viewScreen.centerXAnchor, constant: -8),
            buttonContacts.topAnchor.constraint(equalTo: sumLabel.bottomAnchor, constant: 10),
            buttonContacts.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            buttonResponses.leftAnchor.constraint(equalTo: viewScreen.centerXAnchor, constant: 8),
            buttonResponses.rightAnchor.constraint(equalTo: titleLabel.rightAnchor),
            buttonResponses.topAnchor.constraint(equalTo: sumLabel.bottomAnchor, constant: 10),
        ])
    }
    
    // MARK: - Actions

    @objc
    func touchConfirmButton() {
        if iconImage.tintColor == .white {
            iconImage.tintColor = UIColor(red: 0.77, green: 0.1, blue: 0.1, alpha: 1)
        } else if iconImage.tintColor == UIColor(red: 0.77, green: 0.1, blue: 0.1, alpha: 1) {
            iconImage.tintColor = .white
        }
    }
    
    @objc
    func didTapButton() {
        viewModel?.router?.openContacts(textName: viewModel?.textName ?? "", textPhone: viewModel?.textPhone ?? "", textMail: viewModel?.textMail ?? "")
    }
    
    @objc
    func didTapButtonRes() {
        //buttonResponses.setBackgroundColor(.black, for: .normal)
        buttonResponses.setTitle("Вы откликнулись", for: .normal)
    }
}
