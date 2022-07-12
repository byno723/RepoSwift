//
//  BillPayment.swift
//  TopUpEmoney
//
//  Created by gorbyno sitepu on 24/06/22.
//

import SwiftUI

struct BillPayment: View {
//    @Binding private var navigationSelection : String?
    @Binding var sourceNavigationLink : String?
//    
    var body: some View {
        ZStack{
            Color.secondary.opacity(0.3)
              Payment(sourceNavigationLink: $sourceNavigationLink)
        }
        .navigationBarTitle(
            "Bill Payment",
            displayMode: .inline
        )

    }
}

//struct BillPayment_Previews: PreviewProvider {
//    static var previews: some View {
//        BillPayment()
//    }
//}


struct Payment : View{
    @State var amount : String = ""
    @State private  var navigationSelection : String?
    @Binding var sourceNavigationLink : String?
    
    var body: some View{
        VStack(){
            VStack(alignment:.leading){
                SavedListCustom(
                    category: "OVI",
                    phoneNumber: 23829323
                )
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
                    subtitle: "OVO"
                )
                CustomList(
                    title: "INFORMATION",
                    subtitle: "OVO CASH BALANCE \nWill BE DEDUCTED Rp1500 FOR ADMIN \nFEE"
                ).multilineTextAlignment(.trailing)
                
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.secondary)
                    .padding(.top,30)
                
                
                Text("Amount")
                    .font(.system(size: 16, weight: .bold))
                    .padding(.top,20)
                
                HStack{
                    Text("IDR")
                        .font(.system(size: 16, weight: .bold))
                        .padding(.top,5)
                    Spacer()
                    
                    TextField(
                        "0",
                        text: $amount )
                    .multilineTextAlignment(.trailing)
                    
                }
                
            }
            .padding(.all,20)
            .background(Color.white)
            .cornerRadius(10)
            .frame(width: .infinity)
            .padding([.leading, .trailing],20)
            .shadow(color: .black, radius: 0.3)
            .padding(.top,20)
            
            
            NavigationLink(
                destination: TransactionSummary(sourceNavigationLink: $sourceNavigationLink),
                tag: ScreenName.TransactionSummery.rawValue,
                selection: $navigationSelection
            )
            {EmptyView()}
               
            PrimaryButton(
                title: "Continue",
                action: {
                    self.navigationSelection = ScreenName.TransactionSummery.rawValue
                }
            )
            
             Spacer()
          
        }
       
           
    }
}
