//
//  LimboApp.swift
//  Limbo
//
//  Created by Bartek Chadryś on 20/04/2023.
//

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    print(urls[urls.count-1] as URL)

    return true
  }
}

@main
struct LimboApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var quizDataModel = QuizDataController()
    
    var body: some Scene {
        WindowGroup {
//            QuizView()
            FirstView()
                .environment(\.managedObjectContext, quizDataModel.container.viewContext)
        }
    }
}
