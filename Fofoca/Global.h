//
//  Global.h
//  Fofoca
//
//  Created by Alexandre Marones on 1/29/13.
//  Copyright (c) 2013 4Mobile. All rights reserved.
//


#import <AdSupport/AdSupport.h>

//---------------------------------------------------------------------------------------------------------
// URL's
//---------------------------------------------------------------------------------------------------------
#define K_URL_NEWS @"http://www.google.com/reader/api/0/stream/contents/user/01062876072085304549/label/babado"

#define K_URL_APP_IN_APP_STORE @"https://itunes.apple.com/us/app/babado/id593111986?mt=8"



//---------------------------------------------------------------------------------------------------------
// YQL
//---------------------------------------------------------------------------------------------------------
#define K_YQL_NOVELAS_FUXICO @"http://query.yahooapis.com/v1/public/yql?q=SELECT%20*%20FROM%20html%20WHERE%20url%20%3D%20%22https%3A%2F%2Fofuxico.terra.com.br%2Fcanais.html%22%20AND%20xpath%20%3D%20%22%2F%2Fdiv%5B%40class%20%3D%20'canal'%5D%22%20AND%20charset%20%3D%20%22iso-8859-1%22&format=json&callback="