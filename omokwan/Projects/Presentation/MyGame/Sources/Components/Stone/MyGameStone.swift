//
//  MyGameStone.swift
//  MyGame
//
//  Created by 김동준 on 12/7/24
//

import SwiftUI
import DesignSystem
import Domain

struct MyGameStone: View {
    let fullRectSize: CGFloat
    let stoneSize: CGFloat
    let myGameCompleteStatus: MyGameCompleteStatus
    
    init(
        fullRectSize: CGFloat,
        stoneSize: CGFloat,
        myGameCompleteStatus: MyGameCompleteStatus
    ) {
        self.fullRectSize = fullRectSize
        self.stoneSize = stoneSize
        self.myGameCompleteStatus = myGameCompleteStatus
    }
    
    var body: some View {
        ZStack {
            stone
            stoneStatusButton
        }
    }
}

// MARK: 오목돌에 관한 View
private extension MyGameStone {
    private var stone: some View  {
        Circle()
            .fill(
                LinearGradient(
                    stops: gradientColors,
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .opacity(stoneOpacity)
            .frame(width: stoneSize, height: stoneSize)
            .shadow(
                color: stoneShadowColor,
                radius: 10,
                x: 0, y: 0
            )
            .modifier(MyGameStoneModifier(myGameCompleteStatus: myGameCompleteStatus))
    }
    
    private var gradientColors: [Gradient.Stop] {
        switch myGameCompleteStatus {
        case .complete:
            return [
                Gradient.Stop(color: OColors.oWhite.swiftUIColor, location: MyGameConstants.linearGradientStartPoint),
                Gradient.Stop(color: OColors.uiPrimary.swiftUIColor, location: MyGameConstants.linearGradientMiddlePoint),
                Gradient.Stop(color: OColors.uiLinearGradientEndPoint.swiftUIColor, location: MyGameConstants.linearGradientEndPoint)
            ]
        case .inComplete, .inCompleteWithSkip:
            return [
                Gradient.Stop(color: OColors.oWhite.swiftUIColor, location: MyGameConstants.linearGradientStartPoint),
                Gradient.Stop(color: OColors.gray600.swiftUIColor, location: MyGameConstants.linearGradientMiddlePoint),
                Gradient.Stop(color: OColors.oWhite.swiftUIColor, location: MyGameConstants.linearGradientEndPoint)
            ]
        }
    }
    
    private var stoneOpacity: CGFloat {
        switch myGameCompleteStatus {
        case .complete: 0.5
        case .inComplete, .inCompleteWithSkip: 0.2
        }
    }
    
    private var stoneShadowColor: Color {
        switch myGameCompleteStatus {
        case .complete:
            OColors.uiPrimary.swiftUIColor// .opacity(0.7)
        case .inComplete, .inCompleteWithSkip:
            OColors.oBlack.swiftUIColor
//            OColors.uiInCompletedStoneShadow.swiftUIColor
        }
    }
}

// MARK: 오목돌의 status (완료, 미완료와 같은 상태)에 대한 View
private extension MyGameStone {
    private var stoneStatusButton: some View {
        ZStack(alignment: .topTrailing) {
            Color.clear
            
            Button {
                
            } label: {
                ZStack {
                    Circle()
                        .fill(stoneStatusButtonBackgroundColor)
                        .padding(.trailing, 4)
                        .padding(.top, 4)
                        .frame(fullRectSize / 3, fullRectSize / 3)
                        .modifier(
                            MyGameStoneStatusButtonModifier(
                                myGameCompleteStatus: myGameCompleteStatus,
                                size: fullRectSize / 3
                            )
                        )
                    stoneStatusButtonContent
                        .padding(.trailing, 4)
                        .padding(.top, 4)
                }
            }
        }.frame(fullRectSize, fullRectSize)
    }
    
    @ViewBuilder
    private var stoneStatusButtonContent: some View {
        switch myGameCompleteStatus {
        case .complete:
            OImages.icCheck.swiftUIImage
                .renderingMode(.template)
                .resizedToFit(24, 24)
                .foregroundColor(OColors.icon01.swiftUIColor)
        case .inComplete:
            OText(
                "완료하기",
                token: .subtitle_01,
                color: OColors.textOnDisable.swiftUIColor
            ).frame(fullRectSize / 3, fullRectSize / 3)
        case .inCompleteWithSkip:
            OText(
                "미완료",
                token: .subtitle_01
            ).frame(fullRectSize / 3, fullRectSize / 3)
        }
    }
    
    private var stoneStatusButtonBackgroundColor: Color {
        switch myGameCompleteStatus {
        case .complete:
            OColors.uiPrimary.swiftUIColor
        case .inComplete:
            OColors.uiDisable01.swiftUIColor
        case .inCompleteWithSkip:
            OColors.uiDisable02.swiftUIColor
        }
    }
}
