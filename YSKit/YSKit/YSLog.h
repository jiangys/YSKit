//
//  YSLog.h
//  BFKit
//
//  The MIT License (MIT)
//
//  Copyright (c) 2014 - 2016 Fabrizio Brancati. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

@import Foundation;

/**
 *  Exented NSLog
 *
 *  @param file         File
 *  @param lineNumber   Line number
 *  @param functionName Function name
 *  @param format       Format
 */
void ExtendNSLog(const char * _Nonnull file, int lineNumber, const char * _Nonnull function, NSString * _Nonnull format, ...);

/**
 *  This class adds some useful methods to NSLog
 *
 *  YSLog(): Exented NSLog
 *
 *  YSLogString: Log string
 *
 *  YSLogDetailedString: Detailed log string
 *
 *  YSLogClear: Clear the log string
 */
@interface YSLog : NSObject

/**
 *  YSLog only if in DEBUG mode
 */
#ifdef DEBUG
    /**
     *  Exented NSLog
     */
    #define YSLog(args ...) ExtendNSLog(__FILE__, __LINE__, __PRETTY_FUNCTION__, args);
    /**
     *  Log string
     */
    #define YSLogString [YSLog logString]
    /**
     *  Detailed log string
     */
    #define YSLogDetailedString [YSLog logDetailedString]
    /**
     *  Clear the log string
     */
    #define YSLogClear [YSLog clearLog]
#else
    #define YSLog(args ...)
    #define YSLogString
    #define YSLogDetailedString
    #define YSLogClear
#endif

/**
 *  Clear the log string.
 *  You can call it with the YSLogClear macro   
 */
+ (void)clearLog;

/**
 *  Get the log string.
 *  You can call it with the YSLogString macro
 *
 *  @return Returns the log string
 */
+ (NSString * _Nonnull)logString;

/**
 *  Get the detailed log string.
 *  You can call it with the YSLogDetailedString macro
 *
 *  @return Returns the detailed log string
 */
+ (NSString * _Nonnull)detailedLogString;

/**
 *  Get the detailed log string.
 *  You can call it with the YSLogDetailedString macro
 *
 *  @return Returns the detailed log string
 */
+ (NSString * _Nonnull)logDetailedString DEPRECATED_MSG_ATTRIBUTE("Use -detailedLogString");

@end
