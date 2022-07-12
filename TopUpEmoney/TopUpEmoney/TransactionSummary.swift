//
//  TransactionSummary.swift
//  TopUpEmoney
//
//  Created by gorbyno sitepu on 24/06/22.
//

import SwiftUI

struct TransactionSummary: View {
    @Binding var sourceNavigationLink : String?
    var body: some View {
        ZStack{
            Color.secondary.opacity(0.3)
            Summary(sourceNavigationLink: $sourceNavigationLink)
                .navigationBarTitle(
                    "Transaction Summary",
                    displayMode: .inline
                )
        }
    }
}

//struct TransactionSummary_Previews: PreviewProvider {
//    static var previews: some View {
//        TransactionSummary()
//    }
//}


struct Summary : View{
    @State private var navigationSelection : String?
    @Binding var sourceNavigationLink : String?
    
    var body: some View{
        VStack{
            VStack(alignment:.leading){
                SavedListCustom(category: "OVO", phoneNumber: 8239832932)
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.secondary)
                    .padding(.top,5)
                
                Text("Reference Number")
                    .font(.system(size: 16, weight: .bold))
                    .padding(.top,20)
                
                CustomList(
                    title: "ORG NAME",
                    subtitle: "OVO"
                )
                CustomList(
                    title: "CUSTOMER ID",
                    subtitle: "287238273"
                )
                CustomList(
                    title: "NAME",
                    subtitle: "OVO"
                )
                CustomList(
                    title: "NAME",
                    subtitle: "OVO"
                )
                CustomList(
                    title: "INFORMATION",
                    subtitle: "OVO CASH BALANCE \nWill BE DEDUCTED Rp1500 FOR ADMIN \nFEE"
                ).multilineTextAlignment(.trailing)
               
                VStack{
                    
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.secondary)
                    .padding(.top,5)
                
               
                    CustomList(
                        title: " Total ",
                        subtitle: "IDR 100,000"
                    )
                    
                }
                
            }
            .padding(.all, 20)
            .background(Color.white)
            .cornerRadius(10)
            .frame(width: .infinity)
            .padding([.leading, .trailing],20)
            .shadow(color: .black, radius: 0.3)
            .padding(.top,20)
            
            NavigationLink(
                destination: SuccessView(sourceNavigationLink: $sourceNavigationLink),
                tag: ScreenName.SuccessView.rawValue,
                selection: $navigationSelection
            )
            { EmptyView()}
            
            PrimaryButton(title: "Continue", action: {
                self.navigationSelection = ScreenName.SuccessView.rawValue
            })
            
            Spacer()
        }
       
    }
}
