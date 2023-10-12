//
//  recordAnotherView.swift
//  OnlineHospitalApp
//
//  Created by bakebrlk on 08.10.2023.
//

import SwiftUI

struct recordAnotherView: View {
    @State var textOfField: [String] = ["","","",""]
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            setTitleDescription(title: fullNameTitle, description: fullName)
            
            setTitleDescription(title: iinTitle, description: iin)
            
            setTitleDescription(title: numberPhoneTitle, description: numberPhone)
            
            setTitleDescription(title: addressTitle, description: address)
            
            Spacer()
            
            //confirmBtn
        }
    }
    
    private var confirmBtn: some View{
        Button {
            if(textOfField[0] != "" && textOfField[1] != "" && textOfField[2] != "" && textOfField[3] != "" ){
                
            }
        } label: {
            Text("Подтвердить")
                .foregroundStyle(Color.black)
                .padding()
                .frame(maxWidth: .infinity)
        }
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.clear)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.gray, lineWidth: 1)
        )
        .padding()
    }
    
    private func setTitleDescription(title: Text, description: TextField<some View>) -> some View{
        
        VStack(alignment: .leading){
            title
            
            description
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.clear)
                )
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.gray, lineWidth: 1)
                )
        }
        .padding(.bottom, 10)
        
    }
    
    private var fullNameTitle: Text {
        info(text: "Имя и фамилия:")
    }
    
    private var fullName: TextField<some View> {
        infoDescription(text: "Иванов Иван", index: 0)
    }
    
    private var iinTitle: Text {
        info(text: "ИИН:")
    }
    
    private var iin: TextField<some View> {
        infoDescription(text: "Введите ИИН человека", index: 1)
    }
    
    private var numberPhoneTitle: Text{
        info(text: "Номер телефона:")
    }
    
    private var numberPhone: TextField<some View> {
        infoDescription(text: "Введите номер телефона", index: 2)
    }
    
    private var addressTitle: Text {
        info(text: "Адрес:")
    }
    
    private var address: TextField<some View> {
        infoDescription(text: "Адрес прописки", index: 3)
    }
    
    
    private func infoDescription(text: String, index: Int) -> TextField<some View>{
        TextField(text ,text: $textOfField[index])
    }
    
    private func info(text: String) -> Text{
        Text(text)
            .font(.system(size: 20))
            .foregroundColor(.black)
    }
}

//#Preview {
//    recordAnotherView()
//}
