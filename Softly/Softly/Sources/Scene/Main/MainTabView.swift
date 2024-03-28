////
////  MainTabView.swift
////  Softly
////
////  Created by 노가현 on 3/20/24.
////
//
//import SwiftUI
//
//struct MainTabView: View {
//    @State var selection: TabFlow = .homeimg
//    @State var tabbarHidden = false
//    
//    var tabItem: [(Image, String, TabFlow)] = [
//        (.init(.homeimg), "홈", .homeimg),
//        (.init(.searchimg), "검색", .searchimg),
//        (.init(.make), "타래제작", .make),
//        (.init(.heartimg), "찜", .heartimg),
//        (.init(.profile), "프로필", .profile)
//    ]
//    
//    var body: some View {
//        ZStack(selection: $selection) {
//            HomeView()
//                .toNavigationView()
//                .eraseToAnyView()
//                .tag(TabFlow.homeimg)
//            
//            SearchView()
//                .toNavigationView()
//                .eraseToAnyView()
//                .tag(TabFlow.searchimg)
//            
//            MakeView()
//                .toNavigationView()
//                .eraseToAnyView()
//                .tag(TabFlow.make)
//            
//            HeartView()
//                .toNavigationView()
//                .eraseToAnyView()
//                .tag(TabFlow.heartimg)
//            ProfileView()
//                .toNavigationView()
//                .eraseToAnyView()
//                .tag(TabFlow.profile)
//        }
//    }
//    
//    if !tabbarHidden {
//        VStack {
//            Spacer()
//            
//            tabbarView()
//                .background {
//                    Color.white
//                        .ignoresSafeArea()
//                }
//                .environment(\.selectionTabbKey, $selection)
//        }
//    }
//}
//    .onChange(of: tabbarHidden) { _ in
//        UITabBar.hideTabBar()
//    }
//    .environment(\.selectionTabbKey, $selection)
//}
//
////    var body: some View {
////        VStack(spacing: 0) {
////            TabView(selection: $selection) {
////                HomeView()
////                    .tag(TabFlow.home)
////            }
////            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
////            .ignoresSafeArea(.container, edges: .bottom)
////            .edgesIgnoringSafeArea(.all)
////
////            tabbarView()
////                .background(Color.gray900)
////                .ignoresSafeArea(.all, edges: .bottom)
////        }
////    }
//
//@ViewBuilder
//func tabbarView() -> some View {
//    HStack {
//        Spacer()
//        
//        ForEach(tabItem, id: \.1) { image, title, tag in
//            tabItemView(image: image, title: title, tag: tag)
//                .frame(maxWidth: .infinity)
//            Spacer()
//        }
//    }
//    .frame(height: 85)
//}
//
//@ViewBuilder
//func tabItemView(image: Image, title: String, tag: TabFlow) -> some View {
//    Button {
//        selection = tag
//    } label: {
//        VStack (alignment: .center, spacing: 4) {
//            Spacer().frame(height: 18.5)
//            image
//                .renderingMode(.template)
//                .foregroundColor(
//                    tag == selection
//                    ? .primary900
//                    : .white
//                )
//            Spacer().frame(height: 6)
//            Text(title)
//                .SoftlyFont(.caption)
//                .foregroundColor(
//                    tag == selection
//                    ? .primary900
//                    : .white
//                )
//        }
//        .padding(.vertical, 18)
//        
//    }
//}
//
//#Preview {
//    MainTabView()
//}


import SwiftUI

struct MainTabView: View {
    @State var selection: TabFlow = .homeimg
    @State var tabbarHidden = false

    var tabItem: [(Image, String, TabFlow)] = [
        (.init(.homeimg), "홈", .homeimg),
        (.init(.searchimg), "검색", .searchimg),
        (.init(.make), "타래제작", .make),
        (.init(.heartimg), "찜", .heartimg),
        (.init(.profile), "프로필", .profile)
    ]

    var body: some View {
        ZStack {
            TabView(selection: $selection) {
                HomeView()
                    .tag(TabFlow.homeimg)
                
                SearchView()
                    .tag(TabFlow.searchimg)

                MakeView()
                    .tag(TabFlow.make)

                HeartView()
                    .tag(TabFlow.heartimg)
                
                ProfileView()
                    .tag(TabFlow.profile)
            }
            .environment(\.tabbarHidden, $tabbarHidden)
            

            if !tabbarHidden {
                VStack {
                    Spacer()

                    tabbarView()
                        .background {
                            Color.white
                                .ignoresSafeArea()
                        }
                        .environment(\.selectionTabbKey, $selection)
                }
            }
        }
        .onChange(of: tabbarHidden) { _ in
            UITabBar.hideTabBar()
        }
        .environment(\.selectionTabbKey, $selection)
    }

    @ViewBuilder
    func tabbarView() -> some View {
        HStack {
            Spacer()

            ForEach(tabItem, id: \.1) { image, title, tag in
                tabItemView(image: image, title: title, tag: tag)
                    .frame(width: 56, height: 60)

                Spacer()
            }
        }
    }

    @ViewBuilder
    func tabItemView(image: Image, title: String, tag: TabFlow) -> some View {
        Button {
            selection = tag
        } label: {
            VStack(spacing: 4) {
                image
                    .renderingMode(.template)
                    .foregroundColor(
                        tag == selection
                        ? .primary900
                        : .gray400
                    )
                Text(title)
                    .SoftlyFont(.caption)
                    .foregroundColor(
                        tag == selection
                        ? .primary900
                        : .gray400
                    )
            }
            .padding(.vertical, 18)
        }
    }
}

extension View {
    func toNavigationView() -> some View {
        NavigationView {
            self
        }
        .navigationViewStyle(.stack)
    }
}
