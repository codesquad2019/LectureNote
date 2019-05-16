//
//  동물들.swift
//  SOLID
//
//  Created by 이동영 on 16/05/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import Foundation


//protocol 전화할수있는 {
//    func 전화하다()
//}
//
//protocol 게임할수있는 {
//    func 게임하다()
//}

/// - Note: ISP 이전
//protocol 카메라가되는 {
//    func 사진찍다()
//    func 동영상을찍다()
//}
/// 프로토콜 말고 ISP

/// - Note: ISP 이후
//protocol 사진찍을수있는 {
//     func 사진찍다()
//}
//
//protocol 동영상찍을수있는 {
//      func 동영상을찍다()
//}
//
//protocol 카메라가되는: 사진찍을수있는,동영상찍을수있는{
//}

/// - Note: SRP 이후
//protocol 전화소프트웨어 {
//    func 전화하다()
//}
//
//protocol 게임소프트웨어 {
//    func 게임하다()
//}
//
//protocol 사진소프트웨어 {
//    func 사진찍다()
//}
//
//protocol 동영상소프트웨어 {
//    func 동영상을찍다()
//}
//

