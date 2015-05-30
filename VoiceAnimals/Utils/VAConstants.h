//
//  VAConstants.h
//  VoiceAnimals
//
//  Created by Than Dang on 5/30/15.
//  Copyright (c) 2015 Than Dang. All rights reserved.
//

#define DATABASE_VERSION    @"kDatabaseVersion"
#define DATABASE_FOLDER [[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"Database"]
#define BUNDLE_DB_PATH [[NSBundle mainBundle] pathForResource:@"database" ofType:@"sqlite"]
#define DATABASE_NAME   @"database.sqlite"


#define kDateFormat @"yyyy-MM-dd HH:mm"
#define kDateFormat_Column @"dd.MM.yy"
#define kDateProfileFormat  @"yyyy-MM-dd"
#define kTimeFormat @"h:mm a"
#define kTimeSQLiteFormat   @"yyyy-MM-dd HH:mm"

#define kDateTimeFormatServer   @"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
#define kDateTimeFormatExpiry   @"yyyy-MM-dd'T'HH:mm:ss.SSS+HH:mm"
#define kDateTimeFormatServer1  @"'yyyy'-'MM'-'dd'T'HH':'mm':'ss'.'SSSZ'"

#define CURRENT_DB_VERSION @"1.0.0"


#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define ISCONNECTINGNETWORK	(([[Reachability reachabilityForInternetConnection] currentReachabilityStatus]!=NotReachable)||([[Reachability reachabilityForLocalWiFi] currentReachabilityStatus]!=NotReachable))

#define d2r (M_PI / 180.0)

#define kDisableLog         false
#ifdef DEBUG
#define DEBUG_LOG(fmt, ...) if(!kDisableLog) NSLog((@"%s [Line %d]\n" fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define DEBUG_LOG
#endif

#define kAppDelegate    (AppDelegate *)[[UIApplication sharedApplication] delegate]

//Color
//Color
#define kCOLOR_CELL_EVEN [UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1]
#define kCOLOR_CELL_ODD    [UIColor whiteColor]
#define kCOLOR_HEADER   [UIColor colorWithRed:193/255.0 green:193/255.0 blue:193/255.0 alpha:1]
#define kCOLOR_BACKGROUND   [UIColor colorWithRed:85/255.0 green:124/255.0 blue:219/255.0 alpha:1]

#define kCOLOR_HIGHT [UIColor colorWithRed:85/255.0 green:124/255.0 blue:219/255.0 alpha:1]
#define kCOLOR_NORMAL [UIColor colorWithRed:85/255.0 green:124/255.0 blue:219/255.0 alpha:1]
#define kCOLOR_LOW [UIColor colorWithRed:85/255.0 green:124/255.0 blue:219/255.0 alpha:1]

#define kCOLOR_DES [UIColor colorWithRed:250/255.0 green:149/255.0 blue:5/255.0 alpha:1]


#define kColor_Check [UIColor colorWithRed:236/255.0 green:82/255.0 blue:0.0 alpha:1]


#define kColor_Name [UIColor colorWithRed:255/255.0 green:38/255.0 blue:64.0/255 alpha:1.0]

//Font
#define kDefaultFont [UIFont fontWithName:@"NeoSansStd-Light" size:10.0]
#define kDefaultFontMedium [UIFont fontWithName:@"NeoSansStd-Medium" size:15.0]

#define kTimeFont [UIFont fontWithName:@"NeoSansStd-LightItalic" size:17.0]


#define kDefaultFontButton [UIFont fontWithName:@"NeoSansStd-Regular" size:20.0]
#define kDefaultFontText [UIFont fontWithName:@"NeoSansStd-Regular" size:14.0]

#define kBigFont [UIFont fontWithName:@"NeoSansStd-Medium" size:25.0]
#define kMediumItalicFont [UIFont fontWithName:@"NeoSansStd-LightItalic" size:17.0]


#define kChim   @"tieng_chim_keu"
#define kBo     @"tieng_bo_keu"
#define kDe     @"tieng_de_keu"
#define kCho    @"tieng_cho_keu"
#define kEch    @"tieng_ech_keu"
#define kMeo    @"tieng_meo_keu"

#define kType   @"mp3"


#define kTagCustomCell  117
#define kLimitOffset    50
#define kImageThumbnail 70.0
#define kDateFormater   @"yyyy-MM-dd HH:mm"

#define kNotification_resultImage   @"notification_result_image"
#define NOTIFY_UPDATE_PREVIEWING_PICTURE    @"notification_previewing_picture"

#define DOCUMENT_FOLDER [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define FOLDER_PHOTOS   @"Photos"

#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

#define kNotificationReload @"notification_reload_map"
#define d2r (M_PI / 180.0)
#define kMapZoomSize            500.0
#define kURL_GOOGLE_DIRECTION @"http://maps.googleapis.com/maps/api/directions/json?origin=%@&destination=%@&sensor=false&unit=metric&mode=driving"
