//
//  PokemonCollectionViewCell.swift
//  catch-them-all
//
//  Created by Мария Анисович on 04.02.2025.
//

import Kingfisher
import SwifterSwift
import UIKit

final class PokemonCollectionViewCell: UICollectionViewCell {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont(name: "Lato-Bold", size: 13)
        label.textColor = UIColor(hexString: "#FFCB05")
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont(name: "Lato-Regular", size: 11)
        label.textColor = UIColor(hexString: "#50555C")
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        self.setupTitleLabel()
        self.setupSubtitleLabel()
        self.setupImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTitleLabel() {
        addSubview(self.titleLabel)
        
        NSLayoutConstraint.activate([
            self.titleLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6),
            self.titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 32),
            self.titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 9)
        ])
    }
    
    private func setupSubtitleLabel() {
        addSubview(self.subtitleLabel)
        
        NSLayoutConstraint.activate([
            self.subtitleLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            self.subtitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 54),
            self.subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 9)
        ])
    }
    
    private func setupImageView() {
        addSubview(self.imageView)

        NSLayoutConstraint.activate([
            self.imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            self.imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            self.imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            self.imageView.heightAnchor.constraint(equalTo: self.imageView.widthAnchor)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        self.addShadow()
    }
    
    private func addShadow() {
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 2
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 2).cgPath
        self.layer.shadowColor = UIColor(hexString: "#000000")?.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.layer.shadowOpacity = 0.15
    }
    
    func configure(name: String, ability: String, imageUrl: String) {
        self.titleLabel.text = name.uppercased()
        self.subtitleLabel.text = ability.capitalized
        let url = URL(string: imageUrl)
        self.imageView.kf.setImage(with: url)
    }
}
