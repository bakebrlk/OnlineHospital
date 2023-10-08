//
//  recordView.swift
//  OnlineHospitalApp
//
//  Created by bakebrlk on 07.10.2023.
//

import SwiftUI

private enum variants{
    case mySelf
    case Another
}

struct recordView: View {
    @State private var checkBtn: variants = .mySelf
    
    var body: some View {
        
        VStack(alignment: .leading){
            title
            HorizontalBtns
            
            recordSelfView()
        }
    }
    
    private var title: some View {
        Text("Выберите кого хотите записать")
            .font(.system(size: 32))
            .fontWeight(.semibold)
            .padding()
    
    }
    
    private var HorizontalBtns: some View {
        HStack{
            mySelfBtn
            anotherBtn
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
    
    private var mySelfBtn: some View {
        variantBtns(text: "Себя", index: .mySelf)
    }
    
    private var anotherBtn: some View {
        variantBtns(text: "Другого", index: .Another)
    }
    
    private func variantBtns(text: String, index: variants) -> some View{
        return Button(action: {
            checkBtn = index
        }, label: {
            Text(text)
                .frame(alignment: .center)
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(checkBtn == index ? .white : .black)
                .padding()
                .frame(maxWidth: .infinity)
        })
        .background(checkBtn == index ? Color.blue : Color.white)
        .cornerRadius(16)
        .frame(maxWidth: .infinity)
        .padding(5)
    }
    
    
}

#Preview {
    recordView()
}
