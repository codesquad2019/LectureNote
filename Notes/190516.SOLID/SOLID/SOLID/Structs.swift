//
//  Structs.swift
//  SOLID
//
//  Created by 이동영 on 16/05/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import Foundation

//struct 스마트폰: 전화할수있는, 게임할수있는, 카메라가되는 {
//
//    func 전화하다() {
//        print("전화해요")
//    }
//
//    func 게임하다() {
//        print("게임해요")
//    }
//
//    func 사진찍다() {
//        print("사진찍어요")
//    }
//
//    func 동영상을찍다() {
//        print("동영상찍어요")
//    }
//}

/// - Note: ISP 이전
//struct 동영상을못찍는스마트폰:전화할수있는, 게임할수있는, 카메라가되는 {
//
//
//    func 전화하다() {
//        print("전화해요")
//    }
//
//    func 게임하다() {
//        print("게임해요")
//    }
//
//    func 사진찍다() {
//        print("사진찍어요")
//    }
//    
//    func 동영상을찍다() {
//        ()
//    }
//
//}

/// - Note: ISP 이후
//struct 동영상을못찍는스마트폰:전화할수있는, 게임할수있는, 사진찍을수있는 {
//
//    func 전화하다() {
//        print("전화해요")
//    }
//
//    func 게임하다() {
//        print("게임해요")
//    }
//
//    func 사진찍다() {
//        print("사진찍어요")
//    }
//
//}



/// - Note: DIP 이전
//struct 스마트폰 {
//
//    let 전화어플:T전화 = T전화()
//    let 게임어플:앵그리버드 = 앵그리버드()
//    let 사진어플:캔디카메라 = 캔디카메라()
//    let 동영상어플:카카오비디오 = 카카오비디오()
//
////    func 전화하기(){
////        self.전화어플.전화하다()
////    }
////
////    func 게임하기(){
////        self.게임어플.게임하다()
////    }
////
////    func 사진찍기(){
////        self.사진어플.사진찍다()
////    }
////
////    func 동영상찍기(){
////        self.동영상어플.동영상을찍다()
////    }
//}

/// - Note: DIP 이후
//struct 스마트폰 {
//
//    let 전화어플: 전화소프트웨어
//    let 게임어플: 게임소프트웨어
//    let 사진어플: 사진소프트웨어
//    let 동영상어플: 동영상소프트웨어
//
//    // 의존성 주입
//init(전화어플:전화소프트웨어,게임어플:게임소프트웨어,사진어플:사진소프트웨어,동영상어플:동영상소프트웨어){
//        self.전화어플 = 전화어플
//        self.게임어플 = 게임어플
//        self.사진어플 = 사진어플
//        self.동영상어플 = 동영상어플
//    }
//
//    func 전화하기(){
//        self.전화어플.전화하다()
//    }
//
//    func 게임하기(){
//        self.게임어플.게임하다()
//    }
//
//    func 사진찍기(){
//        self.사진어플.사진찍다()
//    }
//
//    func 동영상찍기(){
//        self.동영상어플.동영상을찍다()
//    }
//
//}
