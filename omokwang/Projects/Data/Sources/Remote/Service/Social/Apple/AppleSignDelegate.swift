//
//  AppleSignDelegate.swift
//  Data
//
//  Created by 김동준 on 9/20/24
//

import AuthenticationServices

class AppleSignDelegate: NSObject {
    private var appleSignContinuation: CheckedContinuation<AppleSignResult, Never>?
    
    init(appleSignContinuation: CheckedContinuation<AppleSignResult, Never>? = nil) {
        self.appleSignContinuation = appleSignContinuation
    }
}

extension AppleSignDelegate: ASAuthorizationControllerDelegate {
    public func authorizationController(
        controller: ASAuthorizationController,
        didCompleteWithAuthorization authorization: ASAuthorization
    ) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential,
           let idTokenData = appleIDCredential.identityToken,
           let idToken = String(data: idTokenData, encoding: .utf8) {
            print("idToken = \(idToken)")
            appleSignContinuation?.resume(returning: .success(idToken))
        } else {
            appleSignContinuation?.resume(returning: .failure(.invalidToken))
        }
        
        appleSignContinuation = nil
    }
    
    public func authorizationController(
        controller: ASAuthorizationController,
        didCompleteWithError error: Error
    ) {
        appleSignContinuation?.resume(returning: .failure(.unKnownError(error)))
        appleSignContinuation = nil
    }
}
