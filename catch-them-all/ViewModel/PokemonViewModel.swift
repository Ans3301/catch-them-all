//
//  ViewModel.swift
//  catch-them-all
//
//  Created by Мария Анисович on 04.02.2025.
//

import RxCocoa
import RxSwift

final class PokemonViewModel {
    var pokemons: Driver<[PokemonModel]> {
        pokemonsRelay.asDriver(onErrorJustReturn: [])
    }

    private let pokemonsRelay = BehaviorRelay<[PokemonModel]>(value: [])

    private let apiService = APIService()

    func fetchPokemons() {
        Task {
            do {
                let pokemonList = try await apiService.fetchPokemonList()
                let details = await apiService.fetchPokemonDetails(for: pokemonList.results)
                pokemonsRelay.accept(details)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
