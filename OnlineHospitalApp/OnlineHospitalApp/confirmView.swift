//
//  confirmView.swift
//  OnlineHospitalApp
//
//  Created by bakebrlk on 13.10.2023.
//

import SwiftUI

struct confirmView: View {
    var body: some View {
        VStack{
            title
        }
    }
    
    private let title: some View = {
        Text("Подтвердите \nзапись")
            .font(.system(size: 32))
            .frame(maxWidth: .infinity)
            .bold()
            
    }()
    
    private let visa: some View = {
        HStack{
            
        }
    }()
}

#Preview {
    confirmView()
}
