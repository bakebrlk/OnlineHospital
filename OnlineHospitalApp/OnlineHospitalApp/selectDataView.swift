//
//  selectDataView.swift
//  OnlineHospitalApp
//
//  Created by bakebrlk on 08.10.2023.
//

import SwiftUI

struct selectDataView: View {
    
    private let times: [[String]] = [["11:00", "12:30","15:00", "16:30"], ["9:00", "9:30", "10:00", "10:30", "11:00", "11:30"]]
    
    private let prices: [[String]] = [["4000T", "3800T", "3700т", "3500T"]]
    
    var body: some View {
        VStack(alignment: .leading){
            title
            
            Preduprejdenia
            
            date1
            time1
            
            Spacer()
            
            moreBtn
        }
    }
    
    private var title: some View {
        Text("Выберите дату и время")
            .font(.system(size: 38))
            .fontWeight(.semibold)
            .padding()
    
    }
    
    private var Preduprejdenia: some View {
        HStack(alignment: .top){
            Image(systemName: "exclamationmark.warninglight.fill")
                .foregroundColor(.orange)
                .padding(.top)
            VStack(alignment: .leading){
                Text("Отмена и изменение времени приема может стоит денег.")
                    .foregroundColor(.brown)
                    .font(.system(size: 20))
                Button(action: {
                    
                }, label: {
                    Text("Подробнее")
                        .foregroundStyle(Color.brown)
                        .bold()
                })
                .padding()
                .background(Color.white)
                .cornerRadius(16)
                .padding(.bottom)
                
            }
            .padding(.top)
        }
        .frame(maxWidth: .infinity)
        .background(Color.brown.opacity(0.3))
        .cornerRadius(16)
        .padding()
    }
    
    private var date1 : some View {
        date(title: "5 мая, пятница")
    }
    
    private var time1 : some View {
//        HStack{
//            
//          
//        }
        
        time(time: "11:00", price: "4000T")
    }
    
    private func date(title: String) -> some View {
        Text(title)
            
            .font(.system(size: 28))
            .fontWeight(.bold)
            .foregroundColor(.gray).opacity(0.8)
            .padding()
    }
    
    private func time(time: String, price: String) -> some View{
        Button(action: {
            
        }, label: {
            VStack{
                Text(time)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Text(price)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
        })
        
        .padding()
        .background(Color.blue.opacity(0.1))
        .cornerRadius(16)
        .padding(.leading)
    }
    
    private var moreBtn : some View = {
        return Button(action: {
            
        }, label: {
            Text("Показать еще")
                .frame(maxWidth: .infinity)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding()
        })
        .background(
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.clear)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 30)
                .stroke(Color.gray, lineWidth: 2)
        )
        .padding()
    }()
}

#Preview {
    selectDataView()
}
