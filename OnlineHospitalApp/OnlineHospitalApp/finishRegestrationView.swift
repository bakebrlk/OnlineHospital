//
//  finishRegestrationView.swift
//  OnlineHospitalApp
//
//  Created by bakebrlk on 08.10.2023.
//

import SwiftUI

struct finishRegestrationView: View {
    var body: some View {
        VStack(alignment: .leading){
            Spacer()
            
            title
                .frame(alignment: .leading)
            description
            
            Spacer()
            
            btn
        }
        .background(Color("Purple"))
    }
    
    private let title: some View = {
        return Text("Вы записаны на прием!")
            .frame(maxWidth: .infinity)
            .foregroundStyle(Color.white)
            .font(.system(size: 38))
            .frame(alignment: .leading)
            .padding()
        
    }()
    
    private let description: some View = {
        return Text("Мы отправим вам уведмление чтобы вы не забыли о приеме. \n\nЕсли захотите изменить или отменить запись, вы можете сделать на cтранице с записями.")
            .frame(maxWidth: .infinity)
            .foregroundStyle(Color.white)
            .padding()
    }()
    
    private var btn: some View {
        Button(action: {
            print("next")
        }, label: {
            Text("Хорошо")
                .foregroundStyle(Color.black)
                .font(.system(size: 18))
                .fontWeight(.bold)
                .padding()
        })
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.white)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.gray, lineWidth: 2)
            )
            .padding()
    }
}

#Preview {
    finishRegestrationView()
}
