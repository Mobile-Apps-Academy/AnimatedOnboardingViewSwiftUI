
//
// Created By: Mobile Apps Academy
// Subscribe : https://www.youtube.com/@MobileAppsAcademy?sub_confirmation=1
// Medium Blob : https://medium.com/@mobileappsacademy
// LinkedIn : https://www.linkedin.com/company/mobile-apps-academy
// Twitter : https://twitter.com/MobileAppsAcdmy
// Lisence : https://github.com/Mobile-Apps-Academy/MobileAppsAcademyLicense/blob/main/LICENSE.txt
//

import SwiftUI

struct OnboardingView: View {
    @State private var showNotification = false
    @State private var showContent = false

    var body: some View {
        ZStack{
            LeftPanelView()
                .offset(x: showNotification ? (-UIScreen.main.bounds.width / 100) : -UIScreen.main.bounds.width)
                                .animation(.interpolatingSpring(mass: 1.0, stiffness: 100.0, damping: 10, initialVelocity: 0), value: showNotification)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
        .onAppear{
            showNotification.toggle()
        }
    }
    
    @ViewBuilder
    private func LeftPanelView() -> some View {
        VStack(alignment: .leading) {
            LeftPanelViewContents()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.yellow)
        .padding(.trailing, 100)
    }
    
    @ViewBuilder
    private func LeftPanelViewContents() -> some View {
        VStack(alignment: .leading, spacing: 80) {
            Text("Mobile Apps Academy")
                .font(.system(size: 30))
                .bold()
                .opacity(0.4)
                .offset(y: showContent ? (-UIScreen.main.bounds.width / 100) : -UIScreen.main.bounds.width)
                                .animation(.interpolatingSpring(mass: 1.0, stiffness: 30.0, damping: 10, initialVelocity: 0), value: showContent)
                
            Text("One stop for all app development")
                .font(.system(size: 40))
                .bold()
                .scaleEffect(showContent ? CGSize(width: 1.0, height: 1.0) : CGSize(width: 0.0, height: 0.0))
                .animation(.interpolatingSpring(mass: 1.0, stiffness: 30.0, damping: 10, initialVelocity: 0), value: showContent)
        
            Button(action: {}, label: {
                HStack {
                    Text("Get Started")
                        .foregroundStyle(.white)
                        .bold()
                    
                    Image(systemName: "arrow.right")
                        .foregroundStyle(.white)
                }
            })
            .frame(width: 150, height: 50)
            .background(.black)
            .clipShape(Capsule())
            .offset(y: showContent ? (UIScreen.main.bounds.height / 10) : UIScreen.main.bounds.height)
                            .animation(.interpolatingSpring(mass: 1.0, stiffness: 30.0, damping: 10, initialVelocity: 0), value: showContent)
        }
        .padding()
        .onAppear{
            showContent.toggle()
        }
    }
}

#Preview {
    OnboardingView()
}
