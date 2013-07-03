//
//  textViewForHTML.h
//  BiomeBattle_v_0.1
//  Team: CMPT2752013SummerGroup13
//
//  Created by Rui Zheng on 6/23/13.
//  Copyright (c) 2013 Rui Zheng. All rights reserved.
//

#ifndef BiomeBattle_v_0_1_textViewForHTML_h
#define BiomeBattle_v_0_1_textViewForHTML_h
#define TEXTVIEW_SET_HTML_TEXT(__textView__, __text__)\
do\
{\
if ([__textView__ respondsToSelector: NSSelectorFromString(@"setContentToHTMLString:")])\
[__textView__ performSelector: NSSelectorFromString(@"setContentToHTMLString:") withObject: __text__];\
else\
__textView__.text = __text__;\
}\
while (0)

#define TEXTVIEW_GET_HTML_TEXT(__textView__, __text__)\
do\
{\
if ([__textView__ respondsToSelector: NSSelectorFromString(@"contentAsHTMLString")])\
__text__ = [__textView__ performSelector: NSSelectorFromString(@"contentAsHTMLString") withObject: nil];\
else\
__text__ = __textView__.text;\
}\
while (0)
#endif
