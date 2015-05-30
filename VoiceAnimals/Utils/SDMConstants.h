//
//  SDMConstants.h
//  Metermaild
//
//  Created by Dang Thanh Than on 1/19/15.
//  Copyright (c) 2015 Apide. All rights reserved.
//

#ifndef Metermaild_SDMConstants_h
#define Metermaild_SDMConstants_h
#import "AppDelegate.h"



//Variables
#define kAccess_Token @"access_token"
#define kX_App_Version                          @"X-App-Version"
#define kX_App_Language                         @"X-App-Language"
#define kX_App_Upgrade                          @"X-App-Upgrade"
#define kX_App_Message                          @"X-App-Message"

#define kUserDefault_DeviceToken                @"device_token"

#define kShadowRadius 1.0
#define kShadowRadiusHeader 4.0
#define kShadowOpacity 0.7

#define kForceBackLogin @"back_to_login"

#define kDateTimeFormatServer   @"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
#define kDateFormater   @"yyyy-MM-dd"

//URL
#define DEBUG_TEST   1

#if DEBUG_TEST == 1
    #define kURLAPI   @"https://metermaid.apide.com/api/%@"
#elif DEBUG_TEST == 0
    #define kURLAPI   @"https://apide.ngrok.com/api/%@"
#endif


#define kURL

#define kURLGoogleMapAPI    @"http://maps.googleapis.com/maps/api/directions/json?origin=%@&destination=%@&sensor=false&unit=metric&mode=driving"

#define kTIME_OUT_REQUEST   76
#define kTIME_OUT_REQUEST_DOWNLOAD   1200
#define kMinimumBackgroundTimeRemaining     76
#define kMinimumBackgroundTimeRemaining_download     600

#define kTagCustomCell  113
#define kLimitOffset    20

typedef enum {
    HTTPREQUEST_GET = 0,
    HTTPREQUEST_POST = 1,
    DOWNLOAD,
    HTTPREQUEST_PUT
} REQUEST_TYPE;


//Systems
#define DATABASE_NAME   @"database.sqlite"
#define CURRENT_DB_VERSION @"1.0.0"
#define DATABASE_VERSION    @"kDatabaseVersion"

//Components
#define kAppDelegate    (AppDelegate *)[[UIApplication sharedApplication] delegate]

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define ISCONNECTINGNETWORK	(([[Reachability reachabilityForInternetConnection] currentReachabilityStatus]!=NotReachable)||([[Reachability reachabilityForLocalWiFi] currentReachabilityStatus]!=NotReachable))

#define DATABASE_FOLDER [[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"Database"]
#define BUNDLE_DB_PATH [[NSBundle mainBundle] pathForResource:@"database" ofType:@"sqlite"]

#define kDisableLog         false
#ifdef DEBUG
#define DEBUG_LOG(fmt, ...) if(!kDisableLog) NSLog((@"%s [Line %d]\n" fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define DEBUG_LOG
#endif

//Notification

//Color
#define kDefaultFont [UIFont systemFontOfSize:15.0]

#define kColorScan   [UIColor colorWithRed:21.0/255 green:156.0/255 blue:31.0/255 alpha:1.0]
#define kColorMenu   [UIColor colorWithRed:244.0/255 green:242.0/255 blue:54.0/255 alpha:1.0]
#define kColorList   [UIColor colorWithRed:48.0/255 green:123.0/255 blue:225.0/255 alpha:1.0]
#define kColorLogout [UIColor colorWithRed:205.0/255 green:44.0/255 blue:46.0/255 alpha:1.0]
#define kColorCellOdd [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1.0]
#define kColorCellEven  [UIColor whiteColor]

//Table content
#define kUserTable      @"user"
#define kToken          @"token"
#define kUserName       @"username"
#define kPassword       @"password"
#define kId             @"id"

#define kPropertyMananger @"property_manager"
#define kCreatedAt      @"created_at"
#define kUpdatedAt      @"updated_at"
#define kBuilding_id    @"building_id"

#define kBuildings      @"buildings"

#define kBuildingTable  @"building"
#define kbuildingNumber @"building_number"
#define kName   @"name"
#define kAddress        @"address"
#define kCity           @"city"
#define kZipCode        @"zip_code"
#define kPhoneNumber    @"phone_number"
#define kEmployeeNumber @"employee_number"
#define kEmail          @"email"


#define kMeters         @"meters"
#define kReadings       @"meter_readings"



#define kMeterTable     @"meter"
#define kMeterNumber    @"meter_number"
#define kMeterName      @"name"
#define kMeterType      @"meter_type"
#define kMeterModel     @"model"
#define kMeterInstalledOn @"installed_on"
#define kMeterInitialReading @"initial_reading"

#define kMeterNotes     @"notes"
#define kMeterBuildingNumber @"building_id"

#define kReadingTable   @"reading"
#define kReadingId      @"reading_id"
#define kReadingNumber  @"number"
#define kReadingDate    @"date_read"
#define kRead           @"read"
#define kMeter_id       @"meter_id"

//Meter reading
#define kReading        @"meter_reading"
#define kRead_by_id     @"read_by_id" //User id
#define kRead_on        @"read_on" //Read_time (real time)
#define kUuid           @"uuid"
#define kValue          @"value"




#endif
