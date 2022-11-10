//
//  ViewModelBase.swift
//  Movies
//
//  Created by Mehmet Tarhan on 10/11/2022.
//

import Foundation

enum LoadingState {
    case loading, success, failure, none
}

class ViewModelBase: ObservableObject {
    @Published var loadingState: LoadingState = .none
}
