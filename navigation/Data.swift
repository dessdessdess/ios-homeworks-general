//
//  Data.swift
//  navigation
//
//  Created by Admin on 13.03.2022.
//

import Foundation

struct Post {
    let author: String
    let description: String
    let image: String
    let likes: Int
    let views: Int
}

internal let data: [Post] = [
    Post(author: "Ваш шедевр готов!", description: "Идейные соображения высшего порядка, а также новая модель организационной деятельности способствует подготовки и реализации позиций, занимаемых участниками в отношении поставленных задач. Равным образом сложившаяся структура организации позволяет выполнять важные задания по разработке соответствующий условий активизации. Идейные соображения высшего порядка, а также рамки и место обучения кадров позволяет выполнять важные задания по разработке форм развития. Таким образом укрепление и развитие структуры играет важную роль в формировании дальнейших направлений развития.", image: "firstImage.jpg", likes: 23, views: 157),
    Post(author: "Смысл сайта", description: "Идейные соображения высшего порядка, а также консультация с широким активом позволяет оценить значение систем массового участия. Повседневная практика показывает, что дальнейшее развитие различных форм деятельности обеспечивает широкому кругу (специалистов) участие в формировании существенных финансовых и административных условий.", image: "secondImage.jpg", likes: 159, views: 2387),
    Post(author: "Равным образом укрепление и развитие структуры позволяет выполнять важные задания по разработке новых предложений", description: "Таким образом сложившаяся структура организации требуют от нас анализа дальнейших направлений развития. Таким образом начало повседневной работы по формированию позиции в значительной степени обуславливает создание системы обучения кадров, соответствует насущным потребностям.", image: "thirdImage.jpg", likes: 589, views: 5346),
    Post(author: "По своей сути рыбатекст является альтернативой традиционному lorem ipsum,", description: "Задача организации, в особенности же укрепление и развитие структуры представляет собой интересный эксперимент проверки позиций, занимаемых участниками в отношении поставленных задач. Идейные соображения высшего порядка, а также сложившаяся структура организации позволяет выполнять важные задания по разработке систем массового участия. С другой стороны укрепление и развитие структуры требуют определения и уточнения позиций, занимаемых участниками в отношении поставленных задач.", image: "fourthImage.jpg", likes: 8963, views: 14562)
]
