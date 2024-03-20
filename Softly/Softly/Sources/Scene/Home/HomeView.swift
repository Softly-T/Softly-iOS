import SwiftUI

struct HomeView: View {
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                TopSectionView() // header section
                
                BannerSectionView() // TWS's Banner
                
                CategorySectionView() // category
                
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(0..<4) { _ in
                        PostView() // post list view
                    }
                }
                .padding(.horizontal, 20)
                Spacer().frame(height: 40)
                
                SecondBannerView() // camera man view
                    .padding(.bottom, 24)
                
                LazyHGrid(rows: columns, spacing: 8) {
                    ForEach(0..<2) { _ in
                        SecondPostView() // post list2 view
                            .padding(.horizontal, 20)
                    }
                }
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(0..<6) { _ in
                        PostView() // post list view
                    }
                }
                .padding(.horizontal, 20)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    struct TopSectionView: View {
        var body: some View {
            HStack {
                LogoImageView(imageName: "Logo", width: 74, height: 40)
                Spacer()
                IconImageView(imageName: "glass", width: 24, height: 24)
                Spacer().frame(width: 16)
                IconImageView(imageName: "bell", width: 22, height: 24)
            }
            .padding(.horizontal, 20)
            .padding(.top, 74)
            .frame(height: 133)
            .background(Color.gray900)
        }
    }
    
    struct BannerSectionView: View {
        var body: some View {
            ZStack {
                RoundedImageView(imageName: "Banner_1", width: 353, height: 438, cornerRadius: 24)
                VStack {
                    //Text("봄맞이 패션 타래 모음")
                    //.SoftlyFont(.p1, color: .white)
                    //.padding(.top, 4)
                    //Text("패션의 계절,\n 봄이 다가온다!")
                    //.SoftlyFont(.h2, color: .white)
                    //IconButtonStyle()
                }
            }
            .padding(.horizontal, 20)
        }
    }
    
    struct IconButtonStyle: View {
        var body: some View {
            ZStack {
                Image(systemName: "arrow.right")
                    .resizable()
                    .frame(width: 28, height: 22.4)
                    .foregroundColor(.primary900)
            }
            .frame(width: 48, height: 48)
            .background(Color.gray900.opacity(0.8))
            .cornerRadius(100)
        }
    }
    
    struct CategorySectionView: View {
        private let categories = ["뷰티", "패션", "IT", "인테리어", "덕질", "기타"]
        
        var body: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(categories, id: \.self) { category in
                        CategoryButton(title: category)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    
    struct CategoryButton: View {
        
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
            //.frame(width: 74, height: 32)
            .background(isPressed ? Color.primary900 : Color.white)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .inset(by: 0.5)
                    .stroke(isPressed ? Color.black : Color.gray300, lineWidth: 1)
                
            )
        }
    }
    
    struct LogoImageView: View {
        let imageName: String
        let width: CGFloat
        let height: CGFloat
        
        var body: some View {
            Image(imageName)
                .frame(width: width, height: height)
        }
    }
    
    struct IconImageView: View {
        let imageName: String
        let width: CGFloat
        let height: CGFloat
        
        var body: some View {
            Image(imageName)
                .resizable()
                .frame(width: width, height: height)
                .foregroundColor(.white)
        }
    }
    
    struct RoundedImageView: View {
        let imageName: String
        let width: CGFloat
        let height: CGFloat
        let cornerRadius: CGFloat
        
        var body: some View {
            Image(imageName)
                .frame(width: width, height: height)
                .cornerRadius(cornerRadius)
        }
    }
    
    struct PostView: View {
        @State private var postPressed = false
        @State private var heartPressed = false
        var body: some View {
            VStack(alignment: .leading) {
                ZStack(alignment: .topTrailing) {
                    
                    Button(action: {
                        postPressed.toggle()
                    }) {
                        Image("post_example")
                            .resizable()
                            .frame(width: 169, height: 193)
                            .cornerRadius(8)
                    }
                    
                    Button(action: {
                        heartPressed.toggle()
                    }) {
                        Image(heartPressed ? "redheart" : "primaryHeart")
                            .frame(alignment: .topTrailing)
                            .padding(.top, 12)
                            .padding(.trailing, 8)
                    }
                }
                Spacer().frame(height: 12)
                Text("소개 제목")
                Spacer().frame(height: 4)
                Text("아이디")
            }
        }
    }
    
    struct SecondBannerView: View {
        var body: some View {
            Image("Banner_2")
                .resizable()
                .frame(width: 280, height: 378)
                .padding(.horizontal, 20)
        }
    }
    
    struct SecondPostView: View {
        @State private var isPressed = false
        @State private var post2Pressed = false
        var body: some View {
            ZStack {
                HStack {
                    Button (action: {
                        post2Pressed.toggle()
                    }) {
                        Image("SecondBanner_1")
                        Spacer().frame(width: 8)
                        VStack(alignment: .leading) {
                            Text("제품이름")
                                .SoftlyFont(.h5, color: .gray900)
                            Spacer().frame(height: 4)
                            Text("가격")
                                .SoftlyFont(.p3, color: .primary900)
                        }
                    }
                    Spacer()
                    
                    Button(action: {
                        isPressed.toggle()
                    }) {
                        Image(isPressed ? "redheart" : "primaryHeart")
                            .frame(alignment: .trailing)
                            .padding(.trailing, 20)
                    }
                }
            }
            .frame(width: 353, height: 64)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .inset(by: -0.5)
                    .stroke(Color(.gray900))
            )
        }
    }
}

#Preview {
    MainTabView()
}
