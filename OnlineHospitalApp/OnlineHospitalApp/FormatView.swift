//
//  FirstContentView.swift
//  OnlineHospitalApp
//
//  Created by bakebrlk on 07.10.2023.
//

import SwiftUI



struct FormatView: View {
    
    @Binding var buttonPressed: variants

    var body: some View {
        VStack(alignment: .leading){
            
            title
            
            onlineСonsultations
                
            enrollClinic
                .padding(.top)
            
            callToTheHouse
                .padding(.top)
            
        }
        
    }
    
 
    
    private var title: some View {
        Text("Выберите формат \nприема")
            .font(.system(size: 32))
            .fontWeight(.semibold)
    }
    
    private var onlineСonsultations: some View{
        functional(title: "Онлайн-консультация", description: "Врач созвонится с вами и проведет консультацию в приложении.", variant: .online)
    }
    
    private var enrollClinic: some View{
        functional(title: "Записаться в клинику", description: "Врач будет ждать вас в своем кабинете в клинике.", variant: .offline)
    }
    
    private var callToTheHouse: some View{
        functional(title: "Вызвать на дом", description: "Врач сам приедет к вам домой в указанное время и дату.", variant: .offline)
    }
    
        
    private func functional(title: String, description: String, variant: variants) -> some View{
        
        return Button(action: {
            print("")
            buttonPressed = variant
        }, label: {
            VStack(alignment: .leading){
                
                Text(title)
                    .font(.custom("", size: 26))
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .padding(.top)
                    .padding(.bottom, 0.1)
                    
                Text(description)
                    .font(.system(size: 18))
                    .fontWeight(.thin)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom)
            }
            .padding()
            
            Spacer()
        })
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.blue).opacity(0.1)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(buttonPressed == variant ? Color.blue : Color.clear, lineWidth: 6)
        )
        .cornerRadius(16)
        .frame(maxWidth: .infinity)
    }
}

//#Preview {
//    FormatView()
//}
