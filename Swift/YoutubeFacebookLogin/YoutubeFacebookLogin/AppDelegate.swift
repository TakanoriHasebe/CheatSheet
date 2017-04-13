//
//  AppDelegate.swift
//  YoutubeFacebookLogin
//
//  Created by Takanori.H on 2017/04/12.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit
import FBSDKCoreKit // ①
import Firebase // ②
import GoogleSignIn // ③

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {

    var window: UIWindow?

    // ①, ③
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // ②
        FIRApp.configure()
        
        // ③
        GIDSignIn.sharedInstance().clientID = FIRApp.defaultApp()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        
        // ①
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
        return true
    }
    
    // ③
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        if let err = error{
            print("Googleログインに失敗しました。:", err )
            return
        }
        
        print("Googleログインに成功しました。", user ?? "")
        
        guard let idToken = user.authentication.idToken else{ return }
        guard let accessToken = user.authentication.accessToken else { return }
        let credentials = FIRGoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
        
        FIRAuth.auth()?.signIn(with: credentials, completion: { (user, error) in
            if let err = error{
                print("Googleログインを用いたFirebaseへの接続に失敗しました。", err)
                return
            }
            
            guard let uid = user?.uid else { return }
            print("Googleログインを用いたFirebaseへの接続に成功しました", user?.uid)
        })
    }

    // ①, ③
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        // ①
        let handled = FBSDKApplicationDelegate.sharedInstance().application(app, open: url, sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as! String, annotation: options[UIApplicationOpenURLOptionsKey.annotation])
        // ③
        GIDSignIn.sharedInstance().handle(url, sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String, annotation: options[UIApplicationOpenURLOptionsKey.annotation])
        
        return handled
        
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

