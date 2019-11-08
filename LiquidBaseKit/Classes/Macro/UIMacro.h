//
//  UIMacro.h
//  MotoBand2019
//
//  Created by Eric on 2019/3/18.
//  Copyright © 2019 Eric. All rights reserved.
//

#ifndef UIMacro_h
#define UIMacro_h

//RGB颜色
#define RGBColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

//屏幕尺寸
#define ScreenHeight    [[UIScreen mainScreen] bounds].size.height
#define ScreenWidth     [[UIScreen mainScreen] bounds].size.width



//引导页文案
#define YDPicNameArray @[@"iOS_Intro_A.png",@"iOS_Intro_B.png",@"iOS_Intro_C.png",@"iOS_Intro_D.png"]

#define YDTitleArray @[@"交互改版",@"发现",@"骑迹",@"即刻出发"]

#define YDDesTitleArray @[@"全新交互，畅快淋漓",@"智能推荐系统，不错过每一个精彩",@"让我们去远方！",@"JUST RIDE!"]

#endif /* UIMacro_h */
