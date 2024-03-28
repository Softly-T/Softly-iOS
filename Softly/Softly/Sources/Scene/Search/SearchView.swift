//
//  SearchView.swift
//  Softly
//
//  Created by 노가현 on 3/22/24.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject private var searchViewModel = SearchViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    SearchBar(searchViewModel: searchViewModel)
                    RemoveSection()
                    SearchCategory(categories: ["봄", "여름", "애플", "이사", "콘서트", "식집사"])
                    Rectangle()
                        .fill(Color.gray100)
                        .frame(width: 393, height: 4)
                    Spacer().frame(height: 36)
                    SecondPostGridView()
                    Spacer().frame(height: 32)
                    Banner2View()
                    Spacer().frame(height: 24)
                    Post2GridView()
                    Spacer().frame(height: 40)
                    SecondPostGridView()
                }
                .padding(.horizontal, 20)
            }
        }
    }
}

struct SearchBar: View {
    @ObservedObject var searchViewModel: SearchViewModel
    @Environment(\.dismiss) var dismiss
    
    @State private var isPressed = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button(action: {
                    dismiss()
                }) {
                    Image("Arrow")
                        .resizable()
                        .frame(width: 31, height: 20)
                }
                Spacer().frame(height: 24)
                ZStack {
                    HStack {
                        TextField("분위기나 계절, 분야로 검색해보세요", text: $searchViewModel.search)
                            .SoftlyFont(.p3, color: .gray200)
                            .padding(.leading, 8)
                        Spacer()
                        Button(action: {
                            searchViewModel.search = ""
                        }) {
                            NavigationLink(destination: SearchListView()) {
                                Image("searchimg")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .padding(.trailing, 12)
                            }
                        }
                    }
                }
                .frame(width: 298, height: 36, alignment: .leading)
                .cornerRadius(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .inset(by: 0.5)
                        .stroke(.black, lineWidth: 1)
                )
            }
            Spacer().frame(height: 20)
        }
        .padding(.horizontal, 20)
    }
}

struct RemoveSection: View {
    @State private var isPressed = false
    var body: some View {
        HStack {
            Text("최근 검색 타래")
                .SoftlyFont(.h4, color: .gray900)
            Spacer()
            Button(action: {
                isPressed.toggle()
            }) {
                Text("모두 지우기")
                    .SoftlyFont(.p3, color: .gray300)
            }
        }
        .padding(.horizontal, 20)
        Spacer().frame(height: 8)
    }
}

struct SearchCategory: View {
    var categories: [String]
    
    init(categories: [String]) {
        self.categories = categories
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(categories, id: \.self) { category in
                    CategoryButton(title: category)
                    
                }
            }
            .padding(.horizontal)
        }
        Spacer().frame(height: 16)
    }
}

struct PrivateCategoryButton: View {
    
    @State private var isPressed = false
    
    var title: String
    
    var body: some View {
        
        Button(action: {
            isPressed.toggle()
        }) {
            HStack {
                Spacer()
                Text(title)
                    .SoftlyFont(.p2, color: .gray900)
                    .cornerRadius(8)
                Image(isPressed ? "xx" : "")
                    .foregroundColor(isPressed ? .white : .gray900)
            }
            .cornerRadius(8)
        }
        .padding(8)
        .background(isPressed ? Color.primary900 : Color.white)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .inset(by: 0.5)
                .stroke(isPressed ? Color.black : Color.gray300, lineWidth: 1)
            
        )
    }
}


#Preview {
    SearchView()
}
