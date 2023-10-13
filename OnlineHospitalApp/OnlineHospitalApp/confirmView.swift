//
//  confirmView.swift
//  OnlineHospitalApp
//
//  Created by bakebrlk on 13.10.2023.
//

import SwiftUI

struct confirmView: View {
    
    var price: Int
    @Binding var formatConsultation: variants
    var time: String
    var date: String
    var nameClient: String
    
    var body: some View {
        VStack(alignment: .leading){
            title
            
            infoDoc
            infoConsultation
            
            description
            
            Spacer()
            
            visa
        }
    }
    
    private let title: some View = {
        
        Text("Подтвердите \nзапись")
            .font(.system(size: 32))
            .bold()
            
    }()
    
    
    private var infoConsultation: some View {
        HStack{
            getInfConcultation(title: "Время", description: time)
            getInfConcultation(title: "Дата", description: date)
            getInfConcultation(title: "Цена", description: "\(price)₸")
            
        }
        .padding()
    }
    
    private func getInfConcultation(title: String, description: String) -> some View {
        VStack{
            Text(title)
                .bold()
                .foregroundStyle(Color.gray)
            
            Text(description)
                .bold()
                .foregroundStyle(Color.black)
        }
        .padding()
        .background(Color("MylightGray"))
        .cornerRadius(16)

    }
    
    private var infoReg: some View {
        HStack{
            avatarDoc
        }
    }
    
    private var infoDoc: some View {
        HStack{
            Image("avatarDoc")
            
            VStack(alignment: .leading){
                Text("Оксана Михайловна")
                    .bold()
                
                Text("Офтальмолог")
                    .fontWeight(.thin)
                
                HStack {
                    Image("grade")
                    Image("Ellipse")
                    Text("Шымкент")
                        .fontWeight(.thin)
                }
            }
            .padding(.leading)
            
            chatBtn
        }
    }
    
    private let chatBtn: some View = {
        Button(action: {
            
        }, label: {
            Image("chat")
                .padding()
        })
        .background(
            RoundedRectangle(cornerRadius: 28)
                .fill(Color.clear)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 28)
                .stroke(Color.gray, lineWidth: 1)
        )
        .padding()
    }()
    
    private let avatarDoc: some View = {
        Image("avatarDoc")
    }()
    
    private var description: some View {
        VStack(alignment: .leading){
            getDescription(text: "Формат приема:", font: .thin, size: 16)
            getDescription(text: formatConsultation == .online ? "Онлайн-консультация" : "Оффлайн-консультация", font: .bold, size: 18)
                .padding(.bottom)
            getDescription(text: "Пациент:", font: .thin, size: 16)
            getDescription(text: nameClient, font: .bold, size: 18)
        }
        
    }
    
    private func getDescription(text: String, font: Font.Weight, size: CGFloat) -> some View {
        Text(text)
            .fontWeight(font)
            .font(.system(size: size))
    }
    
    private var visaImage: some View {
        Image("visa")
            .cornerRadius(8)
            .padding()
    }
    
    private var visa: some View  {
        HStack{
            visaImage
            visaCode
            Spacer()
            
            priceForPay
            dropImage
        }
        .background(Color("MylightGray"))
        .cornerRadius(16)
        .frame(maxWidth: .infinity)
    }
    
    private let visaCode: some View = {
        VStack(alignment: .leading){
            Text("•••• 4515")
                .bold()
            
            Text("03/24")
                .fontWeight(.thin)
        }
    }()
    
    private var priceForPay: some View {
        Text("\(price)₸")
            .bold()
            .padding()
    }
    
    private let dropImage: some View = {
        Image("drop")
            .padding()
    }()
}
//
//#Preview {
//    confirmView()
//}
