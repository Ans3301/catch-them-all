//
//  Pokemon.swift
//  catch-them-all
//
//  Created by Мария Анисович on 04.03.2025.
//

import Kingfisher
import SwifterSwift
import UIKit

final class PokemonViewController: UIViewController {
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont(name: "Lato-Bold", size: 24)
        label.textColor = UIColor(hexString: "#FFCB05")
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var detailsView: DetailsView = {
        let detailsView = DetailsView()
        detailsView.translatesAutoresizingMaskIntoConstraints = false
        return detailsView
    }()
    
    private lazy var detailsValueView: DetailsView = {
        let detailsView = DetailsView()
        detailsView.translatesAutoresizingMaskIntoConstraints = false
        return detailsView
    }()
        
    var pokemon: PokemonModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        setupBackButton()
        setupNameLabel()
        setupImageView()
        setupDetailsView()
        setupDetailsValueView()
    }
    
    private func setupBackButton() {
        view.addSubview(backButton)
        
        backButton.accessibilityIdentifier = "backButton"

        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 65),
            backButton.widthAnchor.constraint(equalToConstant: 22),
            backButton.heightAnchor.constraint(equalToConstant: 22),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24)
        ])
        
        backButton.addTarget(self, action: #selector(backButtonTapped(_:)), for: .touchUpInside)
    }
    
    @objc private func backButtonTapped(_ button: UIButton) {
        dismiss(animated: true)
    }
    
    private func setupNameLabel() {
        nameLabel.text = pokemon.name.capitalized
        
        view.addSubview(nameLabel)
        
        nameLabel.accessibilityIdentifier = "nameLabel"
        
        NSLayoutConstraint.activate([
            nameLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 135),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24)
        ])
    }
    
    private func setupImageView() {
        let url = URL(string: pokemon.imageUrl)
        imageView.kf.setImage(with: url)
        
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 204),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25)
        ])
    }

    private func setupDetailsView() {
        detailsView.addText(firstLabelText: "Height", secondLabelText: "Weight", thirdLabelText: "Ability")
        
        view.addSubview(detailsView)
        
        detailsView.accessibilityIdentifier = "detailsView"
        
        NSLayoutConstraint.activate([
            detailsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            detailsView.topAnchor.constraint(equalTo: view.topAnchor, constant: 478),
            detailsView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.16),
            detailsView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.13)
        ])
    }
    
    private func setupDetailsValueView() {
        detailsValueView.addText(firstLabelText: String(pokemon.height) + " dm",
                                 secondLabelText: String(pokemon.weight) + " hg",
                                 thirdLabelText: pokemon.abilities.first?.ability.name)

        view.addSubview(detailsValueView)
        
        detailsValueView.accessibilityIdentifier = "detailsValueView"
        
        NSLayoutConstraint.activate([
            detailsValueView.leadingAnchor.constraint(equalTo: detailsView.trailingAnchor, constant: 68),
            detailsValueView.topAnchor.constraint(equalTo: view.topAnchor, constant: 478),
            detailsValueView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            detailsValueView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.13)
        ])
    }
}
