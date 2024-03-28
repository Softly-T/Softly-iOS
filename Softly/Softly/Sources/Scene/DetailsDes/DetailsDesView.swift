//
//  DetailsDesView.swift
//  Softly
//
//  Created by 서지완 on 3/14/24.
//

// 상세설명 화면입니다.

import SwiftUI
import PopupView

struct DetailsDesView: View {
    @Environment(\.dismiss) var dismiss
    @State var heartList = ["primaryHeart","redheart"]
    @State var selectedIndex = 0
    @State private var textHeight: CGFloat = 0
    @State var popupfirst : Bool = false
    @State var popupsharing : Bool = false
    @State var popupreport : Bool = false
    @State var popupreportlist: [Bool] = Array(repeating: false, count: 6)
    @State var popupreporttext: Array = ["성적인 컨텐츠","상업적인 의도가 다분한 컨텐츠","도배된 컨텐츠","증오 또는 혐오 표현이 담긴 컨텐츠","위험을 조장하는 컨텐츠","사기 또는 거짓 사실이 담긴 컨텐츠"]
    @State var popupreportsubmission : Bool = false
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        Button{
                            dismiss()
                        } label: {
                            Image("leftimg")
                                .padding(.trailing, 8)
                            
                            Text("뒤로가기")
                                .SoftlyFont(.caption, color: .gray300)
                        }
                        Spacer()
                        
                        NavigationLink(destination: HomeView()) {
                            Image("homeimg")
                        }
                        
                        // 임의로 DetailsDesView로 들어가 있고 다른 View 퍼블리싱이 완료되면 변경예정
                        NavigationLink(destination: DetailsDesView()) {
                            Image("searchimg")
                                .padding(.horizontal, 16)
                        }
                        
                        NavigationLink(destination: DetailsDesView()) {
                            Image("heartimg")
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                    
                    ScrollView (showsIndicators: false){
                        ZStack (alignment: .topLeading){
                            Image("detailsmainimg")
                                .cornerRadius(24)
                                .frame(width: 353, height: 451)
                                .overlay(
                                    Image("mainimgshadow")
                                        .padding(.top, 315)
                                )
                            Button {
                                popupfirst.toggle()
                            }label: {
                                Image("pointgray")
                                    .padding(.top, 24)
                                    .padding(.leading, 293)
                            }
                            
                            Text("{제목}")
                                .SoftlyFont(.h3, color: .white)
                                .padding(.leading, 16)
                                .padding(.top, 319)
                            HStack(spacing: 0){
                                Image("noneimg")
                                Text("{아이디}")
                                    .SoftlyFont(.p2, color: .primary900)
                                    .padding(.leading, 8)
                            }
                            .padding(.leading, 16)
                            .padding(.top, 355)
                            
                            
                        }
                        .padding(.top, 24)
                        
                        
                        Text("{이번 물건 소개의 컨셉 or 자기 소개}")
                            .padding(.top, 24)
                            .SoftlyFont(.p1, color: .black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 20)
                        
                        Rectangle()
                            .frame(height: 6)
                            .foregroundStyle(.gray100)
                            .padding(.top, 32)
                            .padding(.bottom, 16)
                        
                        ForEach(1...2, id: \.self) { _ in
                            HStack(alignment: .top,spacing: 0){
                                ZStack(alignment: .top){
                                    Rectangle()
                                        .frame(width: 4,height: textHeight)
                                    
                                    Text("N")
                                        .SoftlyFont(.p1, color: .white)
                                        .frame(width: 32,height: 32)
                                        .background(
                                            RoundedRectangle(cornerRadius: 4)
                                                .frame(width: 32,height: 32)
                                        )
                                        .padding(.top, 107)
                                }
                                .padding(.leading, 20)
                                
                                VStack(alignment: .leading, spacing: 0){
                                    ZStack {
                                        Image("detailimg2")
                                            .padding(.leading, 8)
                                            .frame(width: 313,height: 247)
                                        
                                        HStack(spacing: 0){
                                            Button{
                                                
                                            }label: {
                                                Image("wLeft")
                                                    .padding(.leading, 8)
                                            }
                                            
                                            Spacer()
                                            
                                            Button {
                                                
                                            }label: {
                                                Image("wRight")
                                            }
                                        }
                                        .frame(width: 313,height: 247)
                                    }
                                    
                                    HStack(spacing: 0){
                                        Text("{제품 이름}")
                                            .SoftlyFont(.h4)
                                        
                                        Spacer()
                                        Button {
                                            popupsharing.toggle()
                                        }label: {
                                            Image("linkimg")
                                                .padding(.top, 5)
                                                .padding(.trailing, 12)
                                        }
                                        
                                        
                                        Image(heartList[selectedIndex])
                                            .onTapGesture {
                                                selectedIndex = selectedIndex == 0 ? 1 : 0
                                                print("0은 하트꺼짐 / 1은 하트켜짐: \(selectedIndex)")
                                            }
                                            .padding(.trailing, 17)
                                            .padding(.top, 5)
                                    }
                                    .padding(.top, 24)
                                    
                                    Text("{가격}")
                                        .SoftlyFont(.p1, color: .primary900)
                                        .padding(.top, 12)
                                    
                                    Text("안녕하세요지완띠입니당안녕하세요지완띠입니당안녕하세요지완띠입니당안녕하세요지완띠입니당안녕하세요지완띠입니당안녕하세요지완띠입니당너무피곤해힘들어졸려배고파으아아내일기숙사입소...불행해")
                                        .SoftlyFont(.p1, color: .gray400)
                                        .padding(.top, 12)
                                        .frame(width: 303)
                                }
                                .padding(.leading, 8)
                                
                                Spacer()
                            }
                            .background(
                                GeometryReader { textGeometry in
                                    Color.clear.onAppear {
                                        self.textHeight = textGeometry.size.height
                                    }
                                }
                            )
                            .padding(.top, 40)
                        }
                        
                        Button {
                            dismiss()
                        }label: {
                            Text("홈으로 돌아가기")
                                .SoftlyFont(.h4)
                                .foregroundStyle(.white)
                                .padding(.vertical, 16)
                                .padding(.horizontal, 123)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .foregroundStyle(.primary900)
                                    
                                )
                                .padding(.top, 56)
                        }
                    }
                }.popup(isPresented: $popupfirst) {
                    VStack(alignment: .leading,spacing: 0){
                        HStack(spacing: 0) {
                            Spacer()
                            Image("popupline")
                                .padding(.top, 24)
                            Spacer()
                        }
                        Button {
                            popupsharing.toggle()
                        }label: {
                            Text("공유하기")
                                .SoftlyFont(.h4, color: .gray900)
                                .padding(.top, 36)
                                .padding(.leading, 29)
                        }
                        Button {
                            popupreport.toggle()
                        }label: {
                            Text("신고하기")
                                .SoftlyFont(.h4, color: .primary900)
                                .padding(.top, 24)
                                .padding(.leading, 29)
                        }
                        
                        
                        
                        Button{
                            popupfirst.toggle()
                        }label: {
                            Text("취소")
                                .SoftlyFont(.h4, color: .gray300)
                                .padding(.horizontal, 181)
                                .padding(.top, 29)
                        }
                        
                        
                        Spacer()
                        
                        
                    }
                    .background(Color.white)
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
                .popup(isPresented: $popupsharing) {
                    VStack(alignment: .leading,spacing: 0){
                        HStack(spacing: 0) {
                            Spacer()
                            Image("popupline")
                                .padding(.top, 24)
                            Spacer()
                        }
                        
                        HStack(spacing: 0) {
                            Spacer()
                            sharingButton(
                                imageName: "kakao",
                                textName: "카카오톡"
                            )
                            sharingButton(
                                imageName: "x",
                                textName: "X"
                            )
                            sharingButton(
                                imageName: "instagram",
                                textName: "인스타그램"
                            )
                            sharingButton(
                                imageName: "serve",
                                textName: "기타"
                            )
                            Spacer()
                            
                        }
                        .padding(.top, 48)
                        
                        
                        Spacer()
                        
                        
                    }
                    .background(.white)
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
                .popup(isPresented: $popupreport) {
                    
                    VStack(alignment: .leading,spacing: 0){
                        HStack(spacing: 0) {
                            Spacer()
                            Image("popupline")
                                .padding(.top, 24)
                            Spacer()
                        }
                        Text("신고 사유가 무엇인가요?")
                            .padding(.top, 32)
                            .padding(.leading, 20)
                            .SoftlyFont(.h4, color: .gray900)
                        ForEach(0...5, id: \.self) { index in
                            Button{
                                popupreportlist[index].toggle()
                                
                                for i in 0..<popupreportlist.count {
                                    if i != index {
                                        popupreportlist[i] = false
                                    }
                                }
                            }label: {
                                BorderHstackView {
                                    Circle()
                                        .frame(width: 24,height: 24)
                                        .foregroundStyle(.white)
                                        .overlay(
                                            Circle()
                                                .frame(width: 16,height: 16)
                                                .foregroundStyle(popupreportlist[index] ? .primary900 : .white)
                                        ).overlay(
                                            Circle()
                                                .stroke(popupreportlist[index] ? .primary900 : .gray200, lineWidth: 1.5)
                                        )
                                    Text(popupreporttext[index])
                                        .padding(.leading, 8)
                                        .SoftlyFont(.p2, color: .gray900)
                                }
                                .padding(.leading, 20)
                            }
                            
                            
                            
                        }
                        .padding(.top, 16)
                        
                        Button {
                            if popupreportlist.contains(true) {
                                popupreportsubmission.toggle()
                            }
                        }label: {
                            Text("신고하기")
                                .SoftlyFont(.h4)
                                .foregroundStyle(.white)
                                .padding(.vertical, 16)
                                .padding(.horizontal, 147)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .foregroundStyle(popupreportlist.contains(true) ? .primary900 : .gray300)
                                )
                                .padding(.top, 46)
                        }
                        .padding(.leading, 20)
                        
                        Spacer()
                    }
                    .background(.white)
                    .frame(height: 457)
                    .cornerRadius(20)
                } customize: {
                    $0
                        .type(.toast)
                        .position(.bottom)
                        .dragToDismiss(true)
                        .closeOnTapOutside(true)
                        .backgroundColor(.black.opacity(0.5))
                }
                .popup(isPresented: $popupreportsubmission) {
                    VStack(alignment: .leading, spacing: 0){
                        Text("이 타래를 신고하시겠어요?")
                            .SoftlyFont(.p2, color: .gray900)
                            .padding(.top, 24)
                        
                        HStack(spacing: 0) {
                            Spacer()
                            Button {
                                popupreportsubmission.toggle()
                            }label: {
                                Text("취소")
                                    .SoftlyFont(.p2, color: .gray200)
                                    .padding(.trailing, 36)
                            }
                            
                            Button {
                                popupreportsubmission.toggle()
                                popupreport.toggle()
                                popupfirst.toggle()
                            }label: {
                                Text("확인")
                                    .SoftlyFont(.p2, color: .primary900)
                                    .padding(.trailing, 24)
                            }
                            
                        }
                        .padding(.top, 38)
                        
                        Spacer()
                    }
                    .padding(.leading, 20)
                    .background(Color.white)
                    .frame(width: 280,height: 116)
                    .cornerRadius(8)
                    
                } customize: {
                    $0
                        .type(.toast)
                        .position(.center)
                        .dragToDismiss(true)
                        .closeOnTapOutside(true)
                        .backgroundColor(.black.opacity(0.5))
                }
                
                
            }
        }
        .navigationBarBackButtonHidden()
    }
    
    @ViewBuilder
    func sharingButton(imageName: String, textName: String) -> some View {
        VStack {
            Image(imageName)
                .padding(.bottom, 8)
            Text(textName)
                .SoftlyFont(.caption, color: .gray900)
        }
        .padding(.horizontal, 16)
    }
    
    @ViewBuilder
    func reportlistButton(imageName: String, textName: String) -> some View {
        VStack {
            Image(imageName)
                .padding(.bottom, 8)
            Text(textName)
                .SoftlyFont(.caption, color: .gray900)
        }
        .padding(.horizontal, 16)
    }
    struct BorderHstackView<Content: View>: View {
        let content: () -> Content
        
        init(@ViewBuilder content: @escaping () ->  Content) {
            self.content = content
        }
        
        var body: some View {
            HStack {
                content()
            }
        }
    }
    
}


#Preview {
    DetailsDesView()
}
