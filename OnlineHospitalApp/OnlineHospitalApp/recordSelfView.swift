//
//  recordSelfView.swift
//  OnlineHospitalApp
//
//  Created by bakebrlk on 08.10.2023.
//

import SwiftUI

struct recordSelfView: View {
    
    @State private var textInfo = ["","","",""]
    
    init(){}
    
    init(fullName: String, iin: String, numberPhone: String, address: String){
        
    }
    var body: some View {
        
        VStack(alignment: .leading){
            
            verticalInfo(title: fullNameTitle, description: fullName)
                
            verticalInfo(title: iinTitle, description: iin)
            
            verticalInfo(title: numberPhoneTitle, description: numberPhone)
            
            verticalInfo(title: addressTitle, description: address)
        }
    }
    
    private var fullNameTitle: Text {
        info(text: "Имя и фамилия:", font: .thin)
    }
    
    private var fullName: Text {
        info(text: textInfo[0] == "" ? "Иванов Иван" : textInfo[0], font: .medium)
    }
    
    private var iinTitle: Text {
        info(text: "ИИН:", font: .thin)
    }
    
    private var iin: Text {
        info(text: textInfo[1] == "" ? "041115486195" : textInfo[1], font: .medium)
    }
    
    private var numberPhoneTitle: Text{
        info(text: "Номер телефона:", font: .thin)
    }
    
    private var numberPhone: Text {
        info(text: textInfo[2] == "" ? "+7 707 748 4815" : textInfo[2], font: .medium)
    }
    
    private var addressTitle: Text {
        info(text: "Адрес прописки:", font: .thin)
    }
    
    private var address: Text {
        info(text: textInfo[3] == "" ? "ул. Гани Иляева 15" : textInfo[3], font: .medium)
    }
    
    private func verticalInfo(title: Text, description: Text) -> some View {
        VStack(alignment: .leading){
            Text("")
                .frame(maxWidth: .infinity)
            title

            description
                .padding(.top, 1)
        }
        .frame(maxWidth: .infinity)
        .padding(.bottom, 5)
    }
    
    private func info(text: String, font: Font.Weight) -> Text{
        Text(text)
            .font(.system(size: font == .bold ? 22 : 20))
            .foregroundColor(.black)
            .fontWeight(font)
    }
}
//
//#Preview {
//    recordSelfView()
//}
