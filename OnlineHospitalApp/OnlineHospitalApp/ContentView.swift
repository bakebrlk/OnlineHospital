//
//  ContentView.swift
//  OnlineHospitalApp
//
//  Created by bakebrlk on 05.10.2023.
//

import SwiftUI

enum pages: Int{
    case none = 0
    case format = 1
    case record = 2
    case date = 3
    case confirm = 4
    case successfully = 5
}

enum variants: String{
    case none
    case online
    case offline
    case home
}

enum variantsRecord{
    case mySelf
    case Another
}

struct ContentView: View {
    
    @State private var page: pages = .format
    @State private var formatConsultation: variants = .none
    @State private var formatClient: variantsRecord = .mySelf
    @State private var infoClient = ["Иванов Иван","041115486195","+7 707 748 4815","ул. Гани Иляева 15"]
    @State private var infoClientAnother = ["","","",""]
    @State private var price: Int = 0
    @State private var time: String = ""
    @State private var date: String = ""
    private var record = ""
    @State var id = -1
    @State var checkAnimation = false
    @State var stopAnimation = false
    @State var errorText = "Пожалуйста, выберите формат"
    @State var isLoding = false
    
    var body: some View {
        ZStack{
            if(isLoding){
                Color(.black).opacity(isLoding ? 0.1 : 0)
                    .ignoresSafeArea()
            }
            VStack(alignment: .leading) {
                topPage
                
                if(page == .format){
                    FormatView(buttonPressed: $formatConsultation)
                }else if(page == .record){
                    recordView(checkBtn: $formatClient, infoClient: $infoClient ,infoClientAnother: $infoClientAnother)
                    
                    
                }else if(page == .date){
                    ZStack{
                        
                        selectDataView(format: $formatConsultation, id: $id, time: $time, date: $date, price: $price)
                            .onAppear {
                                startLoding()
                            }
                        if(isLoding){
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                                .scaleEffect(3)
                        }
                    }
                }else if(page == .confirm){
                    confirmView(price: price, formatConsultation: $formatConsultation, time: time, date: date, nameClient: getNameClient())
                }else if(page == .successfully){
                    finishRegestrationView(page: $page)
                }
                Spacer()
                
                if(stopAnimation){
                    errorAnimation()
                        .opacity(checkAnimation ? 1 : 0)
                    
                }
                btns
            }
            .padding()
        }
    }
    
    private func startLoding(){
        isLoding = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            isLoding = false
        }
    }
  
    private func getNameClient() -> String {
        return formatClient == .mySelf ? infoClient[0] : infoClientAnother[0]
    }
    private var topPage: some View{
        
        HStack{
            Spacer()
            
            firstPage
            
            secondPage
            
            thirdPage
            
            Spacer()
        }
        .padding()
    }
    
    private var firstPage: some View {
        pages(index: .format)
    }
    private var secondPage: some View {
        pages(index: .record)
    }
    private var thirdPage: some View {
        pages(index: .date)
    }
    
    private func pages(index: pages) -> some View {
        
        return Text("")
                    .frame(width: 35, height: 10)
                    .background(page.rawValue >= index.rawValue ? Color("MyCustomPurple"): Color.gray.opacity(0.5))
                    .cornerRadius(8)

    }
    
    private var btns: some View {
        HStack{
            btnBack

            btnNext
                .padding(.leading)
        }
        .padding(.leading)
    }
    
    private var btnBack: some View{
        
            Button(action: {
                print("Back")
                
                if(page == .record){
                    errorText = "Пожалуйста, выберите формат"
                    page = .format
                }else if(page == .date){
                    errorText = "Пожалуйста, напишите полные данные"
                    page = .record
                }else if(page == .confirm){
                    errorText = "Пожалуйста, выберите время!"
                    page = .date
                }else if(page == .successfully){
                    page = .confirm
                }
                
            }, label: {
                HStack{
                    Image(systemName: "arrowshape.backward.fill")
                        .foregroundColor(.black)
                    Text("Назад")
                        .foregroundStyle(Color.black)
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                }
            })
            .frame(width: 114,height: 56)
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.clear)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.gray, lineWidth: 2)
            )
        }
    
    private func errorAnimation() -> some View {
        HStack{
            Spacer()
        
            Text(errorText)
                .bold()
                .foregroundStyle(Color.red)
                .padding()
                .background(Color.blue.opacity(0.1))
                .cornerRadius(16)
                .offset(y: bounceAnimation())
                .onAppear {
                    startBounceAnimation()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.9) {
                        checkAnimation.toggle()
                        stopAnimation.toggle()
                    }
                }
                
                
            Spacer()
        }
    }
    
    private func bounceAnimation() -> CGFloat {
            return checkAnimation ? -30 : 0
    }
    
    private func startBounceAnimation() {
            withAnimation(Animation.easeInOut(duration: 0.5).repeatForever( autoreverses: true)) {
                checkAnimation.toggle()
            }
    }
    
    private var btnNext: some View {
            Button(action: {
                if(page == .format){
                    if(formatConsultation != .none){
                        errorText = "Пожалуйста, напишите полные данные"
                        page = .record
                    }else{
                        checkAnimation.toggle()
                        stopAnimation.toggle()
                    }
                }else if(page == .record){
                    if(formatClient == .Another){
                        if(!infoClientAnother[0].isEmpty && !infoClientAnother[1].isEmpty && !infoClientAnother[2].isEmpty && !infoClientAnother[3].isEmpty){
                            page = .date
                        }else{
                            checkAnimation.toggle()
                            stopAnimation.toggle()
                        }
                    }else{
                        page = .date
                    }
                }else if(page == .date){
                    errorText = "Пожалуйста, выберите время!"
                    if(id != -1){
                        page = .confirm
                    }else{
                        checkAnimation.toggle()
                        stopAnimation.toggle()
                    }
                }else if(page == .confirm){
                    page = .successfully
                }
            }, label: {
                if(page == .confirm){
                    NavigationLink(destination: finishRegestrationView(page: $page).navigationBarHidden(true)){
                        Text("Дальше")
                            .foregroundStyle(Color.white)
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                    }
                    
                }else{
                    Text("Дальше")
                        .foregroundStyle(Color.white)
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                }
            })
            .frame(width: 194,height: 56)
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color("MyCustomPurple"))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.gray, lineWidth: 2)
            )
        }
    

}

#Preview {
    ContentView()
}
