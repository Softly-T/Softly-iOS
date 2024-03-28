//
//  SearchViewModel.swift
//  Softly
//
//  Created by 노가현 on 3/22/24.
//

import Foundation
class SearchViewModel: ObservableObject {
    @Published var search: String = ""
    @Published var selectedButton: Int?
}
