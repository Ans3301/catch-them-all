//
//  ViewModel.swift
//  catch-them-all
//
//  Created by Мария Анисович on 04.02.2025.
//

import RxSwift
import RxCocoa

final class PokemonViewModel {
    let pokemons = BehaviorRelay<[PokemonModel]>(value: [])
    
    private let apiService = APIService()

    func fetchPokemons() {
        Task {
            do {
                let pokemonList = try await apiService.fetchPokemonList()
                let details = await apiService.fetchPokemonDetails(for: pokemonList.results)
                pokemons.accept(details)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
