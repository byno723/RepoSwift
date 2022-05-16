//
//  ModalView.swift
//  ModalTransition
//
//  Created by gorbyno sitepu on 07/05/22.
//

import Foundation
import SwiftUI

struct ModalView : View{
    @Binding var isShowing : Bool
    @State private var isDragging = false
    
    @State private var curHeight : CGFloat = 400
    let minHeight: CGFloat = 400
    let maxheight :  CGFloat = 700
    let startOpacity : Double = 0.4
    let endOpacity : Double = 0.8
    
    var dragPercetage : Double{
        let res = Double((curHeight-minHeight) / (maxheight-minHeight))
        return max(0, min(1,res))
    }
    
    var body: some View{
        ZStack(alignment:.bottom){
            if isShowing{
                Color.black
                    .opacity(startOpacity + (endOpacity-startOpacity)*dragPercetage).ignoresSafeArea()
                    .onTapGesture {
                        isShowing = true
                    }
                .frame(height:400)
                .frame(maxWidth:.infinity)
                
                
                mainView
                
                .transition(.move(edge: .bottom))
            }
           
        }
        .frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeInOut)
    }
    
    var mainView : some View{
        VStack{
            //handle
            ZStack{
                Capsule()
                    .frame(width:40, height:6)
            }.frame(height:40).frame(maxWidth:.infinity).background(Color.white.opacity(0.0001)) // this is important for dragging !
                .gesture(dragGesture)
            
            ZStack{
                VStack{
                    Text("\"If you truly loved yourself, you could never hurt another.\"")
                        .font(.system(size: 25,weight: .regular))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 10)
                    Text("Budha")
                        .font(.system(size: 20, weight: .bold))
                }
                
                .padding(.horizontal,30)
            }
            .frame(maxHeight:.infinity)
            .padding(.bottom,35)
        }.frame(height:curHeight).frame(maxWidth:.infinity)
            .background(
//            hack for rounded corner
                ZStack{
                    RoundedRectangle(cornerRadius: 30)
                    Rectangle()
                        .frame(height:curHeight/2)
                }.foregroundColor(.white)
            )
            .animation(isDragging ? nil : .easeInOut(duration: 0.45))
            .onDisappear{curHeight = minHeight}
    }
    
//    dragging
    @State private var prevDragTranslation = CGSize.zero
    var dragGesture: some Gesture{
        DragGesture(minimumDistance: 0, coordinateSpace: .global)
            .onChanged{ val in
                if !isDragging{
                    isDragging = true
                }
                let dragAmount = val.translation.height - prevDragTranslation.height
                if curHeight > maxheight || curHeight < minHeight{
                    curHeight -= dragAmount / 6
                    
                }else{
                    curHeight -= dragAmount
                }
                prevDragTranslation = val.translation
            }
            .onEnded{ val in
                prevDragTranslation = .zero
                isDragging = false
                if curHeight > maxheight{
                    curHeight = maxheight
                }else if curHeight < minHeight{
                    curHeight = minHeight
                }
            }
    }
    
}


struct ModalView_Preview: PreviewProvider{
    static var previews: some View{
       ContentView()
    }
}
