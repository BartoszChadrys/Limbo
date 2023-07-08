//
//  ProfileView.swift
//  Limbo
//
//  Created by Bartek Chadryś on 04/05/2023.
//

import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()
    @StateObject private var alertModel = Alerts()
    
    var body: some View {
        ZStack {
            backgroundColorView()
            
            VStack(spacing: 15) {
                LimboLogoWithPointsView(alertModel: alertModel, hasQuiz: false)
                
                ScrollView {
                    VStack(spacing: 15) {
                        VStack(spacing: 0) {
                            Image("exampleAvatar")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                            
                            Image("arrowsRotateIcon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 17, height: 17)
                                .padding(.leading, 85)
                        }
                        
                        VStack {
                            Text("Maciej Kowalski")
                                .font(.custom("Montserrat", size: 20))
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                            
                            Text("maciejk@gmail.com")
                                .font(.custom("Montserrat", size: 12))
                                .fontWeight(.light)
                                .foregroundColor(.white)
                                .tint(.white)
                        }
                        
                        VStack(spacing: 15) {
                            Text("Wymień punkty na bonusy")
                                .font(.custom("Montserrat", size: 15))
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                            
                            Button() {
                                print("Redeem points clicked!")
                            } label: {
                                ReedemPointsButtonView(alertModel: alertModel)
                            }
                        }
                        .padding(.bottom, 10)
                        .padding(.top, 10)
                        
                        Text("Zmien hasło")
                            .font(.custom("Montserrat", size: 15))
                            .fontWeight(.medium)
                            .foregroundColor(.white)

                        VStack(spacing: 12) {
                            TextFieldView(title: "Stare hasło", holdText: $viewModel.oldPassword)
                            TextFieldView(title: "Nowe hasło", holdText: $viewModel.newPassword)
                            TextFieldView(title: "Powtórz nowe hasło", holdText: $viewModel.repeatNewPassword)
                        }
                        
                        ChangePasswordButtonView(alertModel: alertModel)
                    }
                }
                .scrollIndicators(.hidden)
                .padding(.bottom, K.navbarBottomPadding)
            }
        }
        .overlay {
            if alertModel.showPointsAlert {
                PointsAlertView(alertModel: alertModel)
            } else if alertModel.showChangePasswordAlert {
                ChangePasswordAlertView(alertModel: alertModel)
            } else if alertModel.showExchangePointsAlert {
                ExchangePointsAlertView(alertModel: alertModel)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct SquareAlertBackgroundView: View {
    var body: some View {
        ZStack(alignment: .trailing) {
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(.backgroundColor())
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(LinearGradient.orangeGradient(), lineWidth: 1.5)
                        .frame(width: K.alertWidth, height: K.squareAlertHeight)
                })
                .frame(width: K.alertWidth, height: K.squareAlertHeight)
        }
    }
}

struct ExchangePointsAlertView: View {
    var alertModel: Alerts
    
    var body: some View {
        ZStack {
            Button {
                alertModel.showExchangePointsAlert = false
            } label: {
                Color.black
                    .opacity(0.75)
            }
            
            ZStack(alignment: .trailing) {
                SquareAlertBackgroundView()
                
                Button {
                    alertModel.showExchangePointsAlert.toggle()
                } label: {
                    Text("X")
                        .font(.custom("Montserrat", size: 14))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom, 130)
                        .padding(.trailing, 15)
                }
            }
            
            VStack(spacing: 15) {
                Text("Czy na pewno chcesz\n wymienić punkty?")
                    .font(.custom("Montserrat", size: 18))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Text("Tej operacji nie da się cofnąć")
                    .font(.custom("Montserrat", size: 16))
                    .fontWeight(.semibold)
                    .foregroundColor(.orangeAlertColor())
                    .multilineTextAlignment(.center)
                
                HStack(spacing: 10) {
                    Button {
                        alertModel.showExchangePointsAlert = false
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(LinearGradient.orangeGradient(), lineWidth: 1.5)
                            
                            Text("NIE")
                                .font(.custom("Montserrat", size: 16))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        .frame(width: 110, height: 45)
                    }
                    
                    Button {
                        alertModel.showExchangePointsAlert = false
                    } label: {
                        GradientButton(text: "TAK")
                            .frame(width: 110, height: 45)
                    }
                }
            }
        }
    }
}

struct ChangePasswordAlertView: View {
    var alertModel: Alerts
    
    var body: some View {
        ZStack {
            Button {
                alertModel.showChangePasswordAlert = false
            } label: {
                Color.black
                    .opacity(0.75)
            }
            
            ZStack(alignment: .trailing) {
                SquareAlertBackgroundView()
                
                Button {
                    alertModel.showChangePasswordAlert.toggle()
                } label: {
                    Text("X")
                        .font(.custom("Montserrat", size: 14))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom, 130)
                        .padding(.trailing, 15)
                }
                
                VStack(spacing: 15) {
                    Text("Zmiana hasła")
                        .font(.custom("Montserrat", size: 20))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    Text("Twoje hasło zostało\n zmienione")
                        .font(.custom("Montserrat", size: 17))
                        .fontWeight(.semibold)
                        .foregroundColor(.orangeAlertColor())
                        .multilineTextAlignment(.center)
                    
                    Button {
                        alertModel.showChangePasswordAlert = false
                    } label: {
                        GradientButton(text: "Powrót")
                            .frame(width: 150, height: 45)
                    }
                }
                .frame(width: K.alertWidth, height: K.squareAlertHeight)
            }
        }
    }
}

struct ChangePasswordButtonView: View {
    var alertModel: Alerts
    
    var body: some View {
        ZStack {
            LinearGradient.orangeGradient()
            
            Button() {
                alertModel.showChangePasswordAlert.toggle()
            } label: {
                Text("Zmień hasło")
                    .font(.custom("Montserrat", size: 13))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
        }
        .frame(width: 130, height: 45)
        .cornerRadius(25)
        .padding(.top, 5)
    }
}

struct ReedemPointsButtonView: View {
    var alertModel: Alerts
    
    var body: some View {
        Button {
            alertModel.showExchangePointsAlert.toggle()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .stroke(LinearGradient.orangeGradient(), lineWidth: 3)
                    .frame(height: 120)
                
                HStack(spacing: 40) {
                    VStack {
                        Text("Punkty do wymiany")
                            .font(.custom("Montserrat", size: 15))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        
                        Text("49")
                            .font(.custom("Montserrat", size: 30))
                            .fontWeight(.semibold)
                            .overlay {
                                LinearGradient.orangeGradient()
                            }
                            .mask(Text("49")
                                .font(.custom("Montserrat", size: 30))
                                .fontWeight(.semibold))
                        
                        Text("Kliknij, aby przejść do ekranu \nwymiany punktów")
                            .font(.custom("Montserrat", size: 10))
                            .fontWeight(.light)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                    
                    Image("redeemPointsIcon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 80, maxHeight: 80)
                }
            }
            .padding(.leading, 15)
            .padding(.trailing, 15)
        }
        
    }
}
