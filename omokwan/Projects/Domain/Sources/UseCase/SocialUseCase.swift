//
//  SocialUseCase.swift
//  Domain
//
//  Created by 김동준 on 9/18/24
//

import DI
import Dependencies

public protocol SocialUseCaseProtocol {
    func signInWithKakao() async -> Result<String, NetworkError>
    func signInWithApple() async -> Result<String, AppleSignInError>
}

public struct SocialUseCase {
    public let signInWithKakao: () async -> Result<String, NetworkError>
    public let signInWithApple: () async -> Result<String, AppleSignInError>
}

extension SocialUseCase: DependencyKey {
    public static var liveValue: SocialUseCase = {
        let repository: SocialRepositoryProtocol = DIContainer.shared.resolve()
        return SocialUseCase(
            signInWithKakao: {
                await repository.signInWithKakao()
            },
            signInWithApple: {
                await repository.signInWithApple()
            }
        )
    }()
}

extension DependencyValues {
    public var socialUseCase: SocialUseCase {
        get { self[SocialUseCase.self] }
        set { self[SocialUseCase.self] = newValue }
    }
}
