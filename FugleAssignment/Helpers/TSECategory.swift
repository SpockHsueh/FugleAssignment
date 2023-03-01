//
//  TSECategory.swift
//  FugleAssignment
//
//  Created by 薛宇振 on 2023/2/28.
//

import Foundation

enum TSECategory: String {
    
    case 水泥工業 = "01"
    case 食品工業 = "02"
    case 塑膠工業 = "03"
    case 紡織工業 = "04"
    case 電機機械 = "05"
    case 電器電纜 = "06"
    case 化學工業 = "21"
    case 生技醫療 = "22"

    case 化學生技業 = "07"
    case 玻璃陶瓷 = "08"
    case 造紙工業 = "09"
    case 鋼鐵工業 = "10"
    case 橡膠工業 = "11"
    case 汽車工業 = "12"
    case 電子工業 = "13"
    case 半導體業 = "24"
    case 電腦及週邊設備業 = "25"
    case 光電業 = "26"
    case 通訊網路業 = "27"
    case 電子零組件業 = "28"
    case 電子通路業 = "29"
    case 資訊服務業 = "30"
    case 其他電子業 = "31"
    
    case 建材營造 = "14"
    case 航運 = "15"
    case 觀光 = "16"
    case 金融 = "17"
    case 貿易百貨 = "18"
    case 油電燃氣 = "23"
    case 綜合 = "19"
    case 其他 = "20"
    case 管理股票 = "80"
    
    // TODO
    // 待確認
    case 證券相關 = "XX"
    case 期貨相關 = "98"
    
    func value() -> String {
        switch self {
        case .水泥工業:
            return "水泥工業"
        case .食品工業:
            return "食品工業"
        case .塑膠工業:
            return "塑膠工業"
        case .紡織工業:
            return "紡織工業"
        case .電機機械:
            return "電機機械"
        case .電器電纜:
            return "電器電纜"
        case .化學工業:
            return "化學工業"
        case .生技醫療:
            return "生技醫療"
        case .玻璃陶瓷:
            return "玻璃陶瓷"
        case .造紙工業:
            return"造紙工業"
        case .鋼鐵工業:
            return "鋼鐵工業"
        case .橡膠工業:
            return "橡膠工業"
        case .汽車工業:
            return "汽車工業"
        case .半導體業:
            return "半導體業"
        case .電腦及週邊設備業:
            return "電腦及週邊設備業"
        case .光電業:
            return "光電業"
        case .通訊網路業:
            return "通訊網路業"
        case .電子零組件業:
            return "電子零組件業"
        case .電子通路業:
            return "電子通路業"
        case .資訊服務業:
            return "資訊服務業"
        case .其他電子業:
            return "其他電子業"
        case .建材營造:
            return "建材營造"
        case .航運:
            return "航運"
        case .觀光:
            return "觀光"
        case .金融:
            return "金融"
        case .貿易百貨:
            return "貿易百貨"
        case .油電燃氣:
            return "油電燃氣"
        case .綜合:
            return "綜合"
        case .其他:
            return "其他"
        case .管理股票:
            return "管理股票"
        case .化學生技業:
            return "化學生技業"
        case .電子工業:
            return "電子工業"
        case .證券相關:
            return "證券相關"
        case .期貨相關:
            return "期貨相關"
        }
    }
}
