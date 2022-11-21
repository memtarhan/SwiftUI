//
//  BiometricAuth.swift
//  BucketList
//
//  Created by Mehmet Tarhan on 21/11/2022.
//

import LocalAuthentication
import SwiftUI

struct BiometricAuth: View {
    @State private var isUnlocked = false

    var body: some View {
        VStack {
            if isUnlocked {
                Text("Unlocked")

            } else {
                Text("Locked")
            }
        }
        .onAppear {
            authenticate()
        }
    }

    func authenticate() {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data"

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, _ in
                if success {
                    print("successfull")
                    isUnlocked = true
                } else {
                    print("failed: \(error?.localizedDescription)")
                    isUnlocked = false
                }
            }

        } else {
            print("no biometrics")
        }
    }
}

struct BiometricAuth_Previews: PreviewProvider {
    static var previews: some View {
        BiometricAuth()
    }
}
