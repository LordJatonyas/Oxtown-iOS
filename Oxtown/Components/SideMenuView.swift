//
//  Created by John Lee on 1/5/24.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var isSidebarVisible: Bool
    var sideBarWidth = UIScreen.main.bounds.size.width * 0.7
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(.black.opacity(0.4))
            .opacity(isSidebarVisible ? 1 : 0)
            .animation(.linear, value: isSidebarVisible)
            .onTapGesture {
                isSidebarVisible.toggle()
            }
            .gesture(DragGesture()
                .onEnded({value in
                    let horizontalSwipe = value.translation.width
                    if horizontalSwipe < 0 {
                        isSidebarVisible.toggle()
                    }
                }))
            content
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    var content: some View {
        HStack(alignment: .top) {
            Color(.sand)
            .frame(width: sideBarWidth)
            .offset(x: isSidebarVisible ? 0 : -sideBarWidth)
            .animation(.default, value: isSidebarVisible)
            Spacer()
        }
    }
}

#Preview {
    SideMenuView(isSidebarVisible: .constant(true))
}
