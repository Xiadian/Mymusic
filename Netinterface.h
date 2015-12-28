
//
//  Netinterface.h
//  Music
//
//  Created by XiaDian on 15/12/23.
//  Copyright © 2015年 xue. All rights reserved.
//

#ifndef Netinterface_h
#define Netinterface_h
/*起床分类：
 音乐列表数据dsfsdfsfs
 */
#define KGetUpURL @"http://www.8zhuayule.com/v2/scene.do?method=getAnonymityPlaylist&sid=12&stype=98&cursor=0&offset=20&dv=Android_360&vr=3.3.0&imei=862326023786466&mac=c8:dd:c9:4d:c7:16"


/*歌曲信息 需要修改musicicode 需要拼接字符
 */
#define KMusicInfoURL @"http://www.8zhuayule.com/android.do?method=getMusicUrlByCode&musiccode=%@&dv=Android_360&vr=3.3.0&imei=862326023786466&mac=c8:dd:c9:4d:c7:16"

/*睡觉分类：
 音乐数据列表
 */
#define KSleepURL @"http://www.8zhuayule.com/v2/scene.do?method=getAnonymityPlaylist&sid=24&stype=98&cursor=0&offset=20&dv=Android_360&vr=3.3.0&imei=862326023786466&mac=c8:dd:c9:4d:c7:16"

/*在路上分类：
 */
#define KOnTheWayURL @"http://www.8zhuayule.com/v2/scene.do?method=getAnonymityPlaylist&sid=14&stype=98&cursor=0&offset=20&dv=Android_360&vr=3.3.0&imei=862326023786466&mac=c8:dd:c9:4d:c7:16"

/*工作
 */
#define KWorkURL @"http://www.8zhuayule.com/v2/scene.do?method=getAnonymityPlaylist&sid=11&stype=98&cursor=0&offset=20&dv=Android_360&vr=3.3.0&imei=862326023786466&mac=c8:dd:c9:4d:c7:16"

/*阅读
 */
#define KReadURL @"http://www.8zhuayule.com/v2/scene.do?method=getAnonymityPlaylist&sid=29&stype=98&cursor=0&offset=20&dv=Android_360&vr=3.3.0&imei=862326023786466&mac=c8:dd:c9:4d:c7:16%20[17.196%20s]"

/*运动
 */
#define KSportsURL @"http://www.8zhuayule.com/v2/scene.do?method=getAnonymityPlaylist&sid=13&stype=98&cursor=0&offset=20&dv=Android_360&vr=3.3.0&imei=862326023786466&mac=c8:dd:c9:4d:c7:16"

/*下午茶
 */
#define KAfternoonURL @"http://www.8zhuayule.com/v2/scene.do?method=getAnonymityPlaylist&sid=18&stype=98&cursor=0&offset=20&dv=Android_360&vr=3.3.0&imei=862326023786466&mac=c8:dd:c9:4d:c7:16"
/*搜索界面
 */
#define KSearchURL @"http://www.8zhuayule.com/v2/search.do?method=getRecommends&dv=Android_360&vr=3.3.0&imei=862326023786466&mac=c8:dd:c9:4d:c7:16"

/*热榜界面
 */
#define KHotURL @"http://www.8zhuayule.com/v2/scene.do?method=getPublicPlaylist&sid=34&stype=99&cursor=0&offset=20&dv=Android_360&vr=3.3.0&imei=862326023786466&mac=00:00:00:00:00:00"




#endif /* Netinterface_h */
