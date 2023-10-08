//
//  recordAnotherView.swift
//  OnlineHospitalApp
//
//  Created by bakebrlk on 08.10.2023.
//

//import SwiftUI
//
//struct recordAnotherView: View {
//    @Binding private var textOfField = [""]
//    
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//    
//    private var fullNameTitle: Text {
//        info(text: "Имя и фамилия:")
//    }
//    
//    private var fullName: TextField<some View> {
//        infoDescription(text: "Иванов Иван", index: 0)
//    }
//    
//    private var iinTitle: Text {
//        info(text: "ИИН:")
//    }
//    
//    private var iin: TextField<some View> {
//        infoDescription(text: "Введите ИИН человека", index: 1)
//    }
//    
//    private var numberPhoneTitle: Text{
//        info(text: "Номер телефона:")
//    }
//    
//    private var numberPhone: TextField<some View> {
//        infoDescription(text: "Введите номер телефона", index: 2)
//    }
//    
//    private var addressTitle: Text {
//        info(text: "Адрес:")
//    }
//    
//    private var address: TextField<some View> {
//        infoDescription(text: "Адрес прописки", index: 3)
//    }
//    
//    private func verticalInfo(title: Text, description: TextField<some View>) -> some View {
//        VStack(alignment: .leading){
//            title
//            description
//                .cornerRadius(16)
//                .padding(.top, 1)
//        }
//        .padding(.top)
//        .padding(.leading)
//    }
//    
//    private func infoDescription(text: String, index: Int) -> TextField<some View>{
//        TextField(text: textOfField[index]) {
//            info(text: text)
//        }
//    }
//    
//    private func info(text: String) -> Text{
//        Text(text)
//            .font(.system(size: 20))
//            .foregroundColor(.black)
//            .fontWeight(.thin)
//    }
//}
//
//#Preview {
//    recordAnotherView()
//}
