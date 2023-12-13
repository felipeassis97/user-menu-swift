//
//  SectionView.swift
//  User-Menu
//
//  Created by Felipe Assis on 12/12/23.
//

import UIKit

class SectionView: UIView {
    
    //MARK: Components
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    lazy var referenceButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        return button
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    lazy var arrowImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .purple
        return image
    }()
    
    //MARK: Setup view
    private func setupView() {
        addSubview(referenceButton)
        addSubview(descriptionLabel)
        addSubview(arrowImageView)
        addSubview(lineView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            referenceButton.topAnchor.constraint(equalTo: topAnchor),
            referenceButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            referenceButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            referenceButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            arrowImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            arrowImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            
            descriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor),
            lineView.bottomAnchor.constraint(equalTo: bottomAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    public func setupSection(description: String) {
        descriptionLabel.text = description
    }
    
    public func expandButton(value: Bool) {
        if value {
            self.arrowImageView.image = UIImage(systemName: "chevron.compact.up")
        } else {
            self.arrowImageView.image = UIImage(systemName: "chevron.compact.down")
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
