//
//  HanJuVM.m
//  RHVideo
//
//  Created by 蔡荣辉 on 2018/4/19.
//  Copyright © 2018年 蔡荣辉. All rights reserved.
//

#import "HanJuVM.h"
#import "RHNetworking.h"

@implementation HanJuVM

- (NSString *)URL:(NSString *)url {
    NSString *baseURL = @"http://api.hanju.koudaibaobao.com/api/series/";
    baseURL = [baseURL stringByAppendingString:url];
    return baseURL;
}

- (void)hanJu {
    NSString *url = [self URL:[NSString stringWithFormat:@"indexV2?_ts=%.f&count=60&offset=0", ([[NSDate date] timeIntervalSince1970] * 1000)]];
    [[RHNetworking manager] GET:url parameters:nil finishBlock:^(RHResponse *response) {
        if (response.error) {
            
            return;
        }
        if ([response.responseObject[@"rescode"] integerValue] == 0) {
            NSArray *moveArr = response.responseObject[@"seriesList"];
            
        }else {
            
        }
    }];
    
    /*
     {
     more = 0;
     rescode = 0;
     seriesList =     (
     {
     category = 1;
     count = 6;
     intro = "";
     isFinished = 0;
     name = "\U7ecf\U5e38\U8bf7\U5403\U996d\U7684\U6f02\U4eae\U59d0\U59d0";
     publishTime = 1522339200000;
     rank = 90;
     sid = Y5ZLBwoaik15hCJUUbFMI;
     source = "\U4e50\U89c6";
     thumb = "http://res.hanju.koudaibaobao.com/hj_res/FmKS0wHvkqzZad_wZRtwWzaMWSIL.jpg?imageView2/2/w/200/interlace/1";
     },
     {
     category = 1;
     count = 16;
     intro = "";
     isFinished = 1;
     name = "\U8ff7\U96fe/Misty";
     publishTime = 1517500800000;
     rank = 75;
     sid = arhQMWqVa3wDnjLB3jGS;
     source = "\U4e50\U89c6";
     thumb = "http://res.hanju.koudaibaobao.com/hj_res/Fg1va-RL1MSvn68EwnMuEUfLaEMx.jpg?imageView2/2/w/200/interlace/1";
     },
     {
     category = 1;
     count = 12;
     intro = "";
     isFinished = 0;
     name = "\U4f1f\U5927\U7684\U8bf1\U60d1\U8005";
     publishTime = 1520784000000;
     rank = 67;
     sid = "s7Vz1sFKGH_p2pUmbNYp";
     source = bilibili;
     thumb = "http://res.hanju.koudaibaobao.com/hj_res/FlvQoYQ_INM0z0CUnzIlmmqlmypx.jpg?imageView2/2/w/200/interlace/1";
     },
     {
     category = 1;
     count = 20;
     intro = "";
     isFinished = 1;
     name = "\U52a0\U6cb9\U5427\U5a01\U57fa\U57fa";
     publishTime = 1517760000000;
     rank = 87;
     sid = 15j4oDeHtYDUaT3pBu9Yy;
     source = bilibili;
     thumb = "http://res.hanju.koudaibaobao.com/hj_res/FhkySsrfjezJN8avISC_7N6n2Acg.jpg?imageView2/2/w/200/interlace/1";
     },
     {
     category = 1;
     count = 9;
     intro = "";
     isFinished = 0;
     name = "\U6211\U7684\U5927\U53d4";
     publishTime = 1521561600000;
     rank = 91;
     sid = spYmzms37Oj2iJoENpw4;
     source = "\U4e50\U89c6";
     thumb = "http://res.hanju.koudaibaobao.com/hj_res/FiV398BWWNdgACLPVSNWCIwibmuy.jpg?imageView2/2/w/200/interlace/1";
     },
     {
     category = 1;
     count = 12;
     intro = "";
     isFinished = 0;
     name = Live;
     publishTime = 1520611200000;
     rank = 91;
     sid = Lm4UHE4JIrBsIpAQcIwW;
     source = letv;
     thumb = "http://res.hanju.koudaibaobao.com/hj_res/FiODrqQTvGB0t6vGWI4akz1cTGot.jpg?imageView2/2/w/200/interlace/1";
     },
     {
     category = 1;
     count = 7;
     intro = "";
     isFinished = 0;
     name = "Switch-\U6539\U53d8\U4e16\U754c";
     publishTime = 1522166400000;
     rank = 81;
     sid = "CQxrtceseeDF_W08r4To";
     source = letv;
     thumb = "http://res.hanju.koudaibaobao.com/hj_res/FsvxAfkow0QhVGo6buZSyNcYrxJt.jpg?imageView2/2/w/200/interlace/1";
     },
     {
     category = 1;
     count = 31;
     intro = "";
     isFinished = 1;
     name = "\U5047\U5192\U5c0f\U59d0\Uff08\U6cf0\U5267\Uff09";
     publishTime = 1522252800000;
     rank = 73;
     sid = LzSozNtNPS12NsbMki7P5;
     source = bilibili;
     thumb = "http://res.hanju.koudaibaobao.com/hj_res/Fj5hwFQDNaUNIn0ZxgPfaB5PC2Pu.jpg?imageView2/2/w/200/interlace/1";
     },
     {
     category = 1;
     count = 6;
     intro = "";
     isFinished = 0;
     name = "\U6211\U4eec\U9047\U89c1\U7684\U5947\U8ff9";
     publishTime = 1522598400000;
     rank = 86;
     sid = eypdQFKesdIBtVGCGEJs;
     source = bilibili;
     thumb = "http://res.hanju.koudaibaobao.com/hj_res/FvPHFRbeHGigNo_oi4XWT3sXcihU.jpg?imageView2/2/w/200/interlace/1";
     },
     {
     category = 1;
     count = 20;
     intro = "";
     isFinished = 1;
     name = "\U82b1\U6e38\U8bb0";
     publishTime = 1512748800000;
     rank = 72;
     sid = diLIx4HEsJx4bDYf4aEE;
     source = tvn;
     thumb = "http://res.hanju.koudaibaobao.com/hj_res/Fk2BP5EGzFDswZ0KbCLrFV2zvoY4.jpg?imageView2/2/w/200/interlace/1";
     },
     {
     category = 1;
     count = 16;
     intro = "";
     isFinished = 1;
     name = "\U5e7f\U64ad\U7f57\U66fc\U53f2/Radio Romance";
     publishTime = 1517155200000;
     rank = 70;
     sid = i4BMjH9kkyY5yKNqen6q;
     source = "\U4e50\U89c6";
     thumb = "http://res.hanju.koudaibaobao.com/hj_res/FnZwRQvARrOg0jBds-uTggNWjpdK.jpg?imageView2/2/w/200/interlace/1";
     },
     {
     category = 1;
     count = 14;
     intro = "";
     isFinished = 0;
     name = "\U5584\U826f\U9b54\U5973\U4f20";
     publishTime = 1520006400000;
     rank = 69;
     sid = "SCi_ncKcRQhlKJ0jNFUe";
     source = "\U4e50\U89c6";
     thumb = "http://res.hanju.koudaibaobao.com/hj_res/FoRatxXoe7r9SouhT0_yOtrIx0CR.jpg?imageView2/2/w/200/interlace/1";
     },
     {
     category = 1;
     count = 10;
     intro = "";
     isFinished = 0;
     name = "\U8981\U4e00\U8d77\U751f\U6d3b\U5417";
     publishTime = 1521216000000;
     rank = 80;
     sid = 191ozhwfl1R3uY38VVGPR;
     source = bilibili;
     thumb = "http://res.hanju.koudaibaobao.com/hj_res/FkuU4QtzL-edcsQHbYxe4pY-3aTN.jpg?imageView2/2/w/200/interlace/1";
     },
     {
     category = 1;
     count = 8;
     intro = "";
     isFinished = 0;
     name = "\U81f4\U5fd8\U4e86\U8bd7\U7684\U4f60";
     publishTime = 1521993600000;
     rank = 74;
     sid = "VZSO_fwO8YOpZ74x2xgM";
     source = bilibili;
     thumb = "http://res.hanju.koudaibaobao.com/hj_res/FhEIA3v0yJGaXv4Dq8bH8HdKAZw9.jpg?imageView2/2/w/200/interlace/1";
     },
     {
     category = 1;
     count = 12;
     intro = "";
     isFinished = 0;
     name = "\U5bcc\U5bb6\U516c\U5b50";
     publishTime = 1521907200000;
     rank = 86;
     sid = MxtLZ2HEV5P86u3JWF4x;
     source = bilibili;
     thumb = "http://res.hanju.koudaibaobao.com/hj_res/FnPIEDF2LDjr_bCbuQoaX8crDHi6.jpg?imageView2/2/w/200/interlace/1";
     },
     {
     category = 1;
     count = 52;
     intro = "";
     isFinished = 1;
     name = "\U6211\U9ec4\U91d1\U5149\U8f89\U7684\U4eba\U751f";
     publishTime = 1504281600000;
     rank = 80;
     sid = "15lCN4S_NXxYOAZm_XX3S";
     source = "\U7231\U5947\U827a";
     thumb = "http://res.hanju.koudaibaobao.com/hj_res/FnvrIWVThxvCAb0Kul_DjsK9Coq2.jpg?imageView2/2/w/200/interlace/1";
     },
     {
     category = 1;
     count = 16;
     intro = "";
     isFinished = 1;
     name = "\U673a\U667a\U7684\U76d1\U72f1\U751f\U6d3b";
     publishTime = 1511280000000;
     rank = 94;
     sid = c8E5fUoiGXziVIBbzsOW;
     source = "\U4e50\U89c6";
     thumb = "http://res.hanju.koudaibaobao.com/hj_res/FopRlrRSpJS2pyhq6R5rq_Mju_u0.jpg?imageView2/2/w/200/interlace/1";
     },
     {
     category = 1;
     count = 18;
     intro = "";
     isFinished = 0;
     name = "\U8981\U5148\U63a5\U543b\U5417/\U80fd\U5148\U63a5\U543b\U5417";
     publishTime = 1519056000000;
     rank = 82;
     sid = tJD6lhp71Q16Wn36hk0HS;
     source = bilibili;
     thumb = "http://res.hanju.koudaibaobao.com/hj_res/Fq8ViMq6el-29tkSPNh2_nhcEyy5.jpg?imageView2/2/w/200/interlace/1";
     },
     {
     category = 1;
     count = 14;
     intro = "";
     isFinished = 0;
     name = "\U5c0f\U795e\U7684\U5b69\U5b50\U4eec";
     publishTime = 1520006400000;
     rank = 74;
     sid = "S1T0I7Lsvm16_dgY7HVQp";
     source = "\U4e50\U89c6";
     thumb = "http://res.hanju.koudaibaobao.com/hj_res/FvkgxCHjXaNh1DUjzaOWF6Gp7TId.jpg?imageView2/2/w/200/interlace/1";
     },
     {
     category = 1;
     count = 14;
     intro = "";
     isFinished = 0;
     name = "\U90a3\U4e2a\U7537\U4eba\U6b27\U6811/\U90a3\U4e2a\U7537\U4eba\U5434\U79c0";
     publishTime = 1520179200000;
     rank = 61;
     sid = 17F5FeYKfBGe4E3ln3wUG;
     source = bilibili;
     thumb = "http://res.hanju.koudaibaobao.com/hj_res/FnOh5ENwgXmXRT0P5q8_4_pOBSxk.jpg?imageView2/2/w/200/interlace/1";
     },
     {
     category = 1;
     count = 2;
     intro = "";
     isFinished = 0;
     name = "\U5355\U8eab\U59bb\U5b50";
     publishTime = 1521475200000;
     rank = 80;
     sid = dCIhf3kAAZ9fuAxFA4gd;
     source = bilibili;
     thumb = "http://res.hanju.koudaibaobao.com/hj_res/Fm7iSaSgPa6mxPYV5nRW2tofeDN3.jpg?imageView2/2/w/200/interlace/1";
     },
     {
     category = 1;
     count = 9;
     intro = "";
     isFinished = 0;
     name = "\U7275\U7740\U624b\Uff0c\U770b\U5915\U9633\U897f\U4e0b";
     publishTime = 1521561600000;
     rank = 70;
     sid = "XxttLG3TqmyBxb9H_Uh8";
     source = "\U4e50\U89c6";
     thumb = "http://res.hanju.koudaibaobao.com/hj_res/FlWvikAReOehz3EdTt6bmVlP-uHx.jpg?imageView2/2/w/200/interlace/1";
     },
     {
     category = 1;
     count = 20;
     intro = "";
     isFinished = 1;
     name = "\U6709\U54c1\U4f4d\U7684\U5979";
     publishTime = 1497542400000;
     rank = 79;
     sid = PlFsZ3EyGV10WACY91hmY;
     source = jtbc;
     thumb = "http://res.hanju.koudaibaobao.com/hj_res/FqOfeV_Rz7Q1nPQwbvH8Yn5ar6zh.jpeg?imageView2/2/w/200/interlace/1";
     },
     {
     category = 1;
     count = 16;
     intro = "";
     isFinished = 1;
     name = "\U4e0d\U662f\U673a\U5668\U4eba";
     publishTime = 1512489600000;
     rank = 80;
     sid = "h_yrI5pbQd8RFRZjEAWu";
     source = "\U4e50\U89c6";
     thumb = "http://res.hanju.koudaibaobao.com/hj_res/FsX8cX1FVZqhq0imeVINroVTbOBn.jpg?imageView2/2/w/200/interlace/1";
     },
     {
     category = 1;
     count = 16;
     intro = "";
     isFinished = 1;
     name = "Mother/\U6bcd\U4eb2";
     publishTime = 1516723200000;
     rank = 84;
     sid = IFPgi8e5f918KUkYUQwNg;
     source = "\U4e50\U89c6";
     thumb = "http://res.hanju.koudaibaobao.com/hj_res/FtTruQfkNCgvARKLWdcuimXrWfPa.jpg?imageView2/2/w/200/interlace/1";
     },
     {
     category = 1;
     count = 10;
     intro = "";
     isFinished = 1;
     name = "Unnatural/\U975e\U81ea\U7136\U6b7b\U4ea1\Uff08\U65e5\U5267\Uff09";
     publishTime = 1518969600000;
     rank = 91;
     sid = 7tdG4ogo9ysLbpYIiAja;
     source = bilibili;
     thumb = "http://res.hanju.koudaibaobao.com/hj_res/Fqp0RkMyVCb7_QnAA9ojdzk6M7ZH.jpg?imageView2/2/w/200/interlace/1";
     },
     {
     category = 1;
     count = 13;
     intro = "";
     isFinished = 0;
     name = "\U4e0a\U95e8\U4e08\U592b\U5434\U4f5c\U6597";
     publishTime = 1520006400000;
     rank = 76;
     sid = 16T7xoAABvSGl1aq3lBXG;
     source = bilibili;
     thumb = "http://res.hanju.koudaibaobao.com/hj_res/Fnwe9YCZR4eFYUzfP6sJp4xRmDLZ.jpg?imageView2/2/w/200/interlace/1";
     },
     {
     category = 1;
     count = 20;
     intro = "";
     isFinished = 1;
     name = "\U6740\U4e86\U6211\U6cbb\U6108\U6211/Kill me heal me";
     publishTime = 1420560000000;
     rank = 90;
     sid = syFbUBOSkeyNn23xszsw;
     source = "\U571f\U8c46";
     thumb = "http://res.hanju.koudaibaobao.com/hj_res/Fmk4kq3HcuwYzIw5lf4d1jaFoE-J.jpg?imageView2/2/w/200/interlace/1";
     },
     {
     category = 1;
     count = 20;
     intro = "";
     isFinished = 1;
     name = "\U9ed1\U9a91\U58eb";
     publishTime = 1512489600000;
     rank = 71;
     sid = "IFxcyde_5k16zOfClSZs8";
     source = "\U767e\U5ea6";
     thumb = "http://res.hanju.koudaibaobao.com/hj_res/Fp54seWNx_VjspaM3bL5qTmNWkbu.jpg?imageView2/2/w/200/interlace/1";
     },
     {
     category = 1;
     count = 16;
     intro = "";
     isFinished = 1;
     name = "\U53ea\U662f\U76f8\U7231\U7684\U5173\U7cfb";
     publishTime = 1512921600000;
     rank = 87;
     sid = YFEdyjqp1dbGVfujwI4e;
     source = "\U4e50\U89c6";
     thumb = "http://res.hanju.koudaibaobao.com/hj_res/FuA2AQO-ZTa4q7QB7BIJ-X6YZ-JJ.jpg?imageView2/2/w/200/interlace/1";
     }
     );
     ts = 1524128392858;
     }
     */
}

@end
