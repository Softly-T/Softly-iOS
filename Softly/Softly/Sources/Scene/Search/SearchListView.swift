//
//  SearchListView.swift
//  Softly
//
//  Created by 노가현 on 3/26/24.
//

import SwiftUI
import PopupView

struct SearchListView: View {
    @Environment(\.dismiss) var dismiss
    
    @StateObject private var searchViewModel = SearchViewModel()
    @State private var isNavigationActive = false
    
    @State var popupgender : Bool = false
    @State var popupselect : Bool = false
    
    var body: some View {
        ScrollView {
            GeometryReader { geometry in
                SearchBar(searchViewModel: searchViewModel)
                VStack (spacing: 0) {
                    HStack(spacing: 0) {
                        Button (action: {
                            popupgender.toggle()
                        }) {
                            Text("성별")
                                .SoftlyFont(.p2, color: .gray600)
                            Image("SelectArrow")
                                .frame(width: 8, height: 12)
                        }
                        
                        Spacer().frame(width: 8)
                        
                        Button {
                        } label: {
                            Text("분야")
                                .SoftlyFont(.p2, color: .gray600)
                            Image("SelectArrow")
                                .frame(width: 8, height: 12)
                            Spacer()
                        }
                    }
                    .padding(.leading, 20)
                    Spacer()
                }
                
                .popup(isPresented: $popupgender) {
                    VStack(alignment: .leading, spacing: 0) {
                        HStack(spacing: 0) {
                            Spacer()
                            Image("popupline")
                                .padding(.top, 24)
                            Spacer()
                        }
                        Text("성별")
                            .SoftlyFont(.h3, color: .gray900)
                            .padding(.leading, 20)
                        Spacer().frame(height: 16)
                        
                        HStack(spacing: 0) {
                            Button {
                                popupselect.toggle()
                            } label: {
                                Text("여성")
                                    .SoftlyFont(.p1, color: .gray900)
                            }
                            
                            .frame(width: 169, height: 48)
                            .overlay (
                                RoundedRectangle(cornerRadius: 8)
                                    .inset(by: 0.5)
                                    .stroke(Color.gray300)
                            )
                            Spacer().frame(width: 16)
                            Button(action: {
                                popupselect.toggle()
                            }) {
                                Text("남성")
                                    .SoftlyFont(.p1, color: .gray900)
                            }
                            .frame(width: 169, height: 48)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .inset(by: 0.5)
                                    .stroke(Color.gray300)
                            )
                        }
                        .padding(.horizontal, 20)
                    }
                    .background(Color.gray100)
                    .frame(height: 202)
                    .cornerRadius(20)
                } customize: {
                    $0
                        .type(.toast)
                        .position(.bottom)
                        .dragToDismiss(true)
                        .closeOnTapOutside(true)
                        .backgroundColor(.black.opacity(0.5))
                }
                .navigationBarBackButtonHidden(true)
            }
        }
    }
}

#Preview {
    SearchView()
}
