//
//  ViewController.swift
//  catch-them-all
//
//  Created by Мария Анисович on 04.02.2025.
//

import RxCocoa
import RxSwift
import SwifterSwift
import UIKit

final class ViewController: UIViewController {
    private lazy var lightningView: LightningView = {
        let view = LightningView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.layer.opacity = 0.5
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Know Them All"
        label.font = UIFont(name: "Lato-Bold", size: 24)
        label.textColor = UIColor(hexString: "#231F20")
        return label
    }()
    
    private var collectionView: UICollectionView!
    private var viewModel = PokemonViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupLightningView()
        setupTitleLabel()
        setupCollectionView()
        bindViewModel()
        viewModel.fetchPokemons()
    }
    
    private func setupLightningView() {
        view.addSubview(lightningView)
        
        lightningView.accessibilityIdentifier = "lightningView"

        NSLayoutConstraint.activate([
            lightningView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 114),
            lightningView.topAnchor.constraint(equalTo: view.topAnchor, constant: -34),
            lightningView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.76),
            lightningView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.77)
        ])
    }
    
    private func setupTitleLabel() {
        view.addSubview(titleLabel)
        
        titleLabel.accessibilityIdentifier = "titleLabel"
        
        NSLayoutConstraint.activate([
            titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 135),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24)
        ])
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = .zero
        layout.sectionInset = UIEdgeInsets(top: 10, left: 24, bottom: 0, right: 24)
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 5

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        
        collectionView.register(PokemonCollectionViewCell.self, forCellWithReuseIdentifier: "pokemonCollectionViewCell")
        
        view.addSubview(collectionView)
        
        collectionView.accessibilityIdentifier = "collectionView"
        
        collectionView.delegate = self
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 180),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func bindViewModel() {
        viewModel.pokemons
            .bind(to: collectionView.rx.items(cellIdentifier: "pokemonCollectionViewCell", cellType: PokemonCollectionViewCell.self)) { _, pokemon, cell in
                cell.configure(name: pokemon.name, ability: pokemon.abilities.first?.ability.name ?? "Unknown", imageUrl: pokemon.imageUrl)
            }
            .disposed(by: disposeBag)
        
        collectionView.rx.modelSelected(PokemonModel.self)
            .subscribe(onNext: { [weak self] pokemon in
                let pokemonViewController = PokemonViewController()
                pokemonViewController.pokemon = pokemon
                pokemonViewController.modalPresentationStyle = .overFullScreen
                pokemonViewController.modalTransitionStyle = .crossDissolve
                self?.present(pokemonViewController, animated: true)
            })
            .disposed(by: disposeBag)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 55) / 2
        return CGSize(width: width, height: width * 0.675)
    }
}
