//
//  recordSelfView.swift
//  OnlineHospitalApp
//
//  Created by bakebrlk on 08.10.2023.
//

import SwiftUI

struct recordSelfView: View {
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
        info(text: "Иванов Иван", font: .medium)
    }
    
    private var iinTitle: Text {
        info(text: "ИИН:", font: .thin)
    }
    
    private var iin: Text {
        info(text: "041115486195", font: .medium)
    }
    
    private var numberPhoneTitle: Text{
        info(text: "Номер телефона:", font: .thin)
    }
    
    private var numberPhone: Text {
        info(text: "+7 707 748 4815", font: .medium)
    }
    
    private var addressTitle: Text {
        info(text: "Адрес прописки:", font: .thin)
    }
    
    private var address: Text {
        info(text: "ул. Гани Иляева 15", font: .medium)
    }
    
    private func verticalInfo(title: Text, description: Text) -> some View {
        VStack(alignment: .leading){
            title
            description
                .padding(.top, 1)
        }
        .padding(.top)
        .padding(.leading)
    }
    
    private func info(text: String, font: Font.Weight) -> Text{
        Text(text)
            .font(.system(size: font == .bold ? 22 : 20))
            .foregroundColor(.black)
            .fontWeight(font)
    }
}

#Preview {
    recordSelfView()
}
