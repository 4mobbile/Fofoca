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
#define K_YQL_EMISSORAS_FUXICO @"http://query.yahooapis.com/v1/public/yql?q=SELECT%20*%20FROM%20html%20WHERE%20url%20%3D%20%22https%3A%2F%2Fofuxico.terra.com.br%2Fcanais.html%22%20AND%20xpath%20%3D%20%22%2F%2Fdiv%5B%40class%20%3D%20'canal'%5D%22%20AND%20charset%20%3D%20%22utf-8%22&format=json&callback="

#define K_YQL_NOVELA_FUXICO @"http://query.yahooapis.com/v1/public/yql?q=SELECT%20*%20FROM%20html%20WHERE%20url%20%3D%20%22https%3A%2F%2Fofuxico.terra.com.br%2Fnovela%2F%@.html%22%20AND%20xpath%20%3D%20%22%2F%2Fdiv%5B%40class%20%3D%20'outras'%5D%22%20AND%20charset%3D%22utf-8%22&format=json&callback="

#define K_YQL_FOTOGALERIAS @"http://query.yahooapis.com/v1/public/yql?q=SELECT%20*%20FROM%20html%20WHERE%20url%3D%22http%3A%2F%2Fego.globo.com%2Ffotos%2Findex.html%22%20AND%20xpath%3D%22%2F%2Fdiv%5B%40class%3D'conteudo'%5D%22%20AND%20charset%3D%22utf-8%22&format=json&callback="

//---------------------------------------------------------------------------------------------------------
// Cache
//---------------------------------------------------------------------------------------------------------
#define K_CACHE_TIME_GOOGLE_READER 5 * 60 // 5 min
#define K_CACHE_TIME 10 * 60 // 10 min


//---------------------------------------------------------------------------------------------------------
// Text Helper
//---------------------------------------------------------------------------------------------------------
#define K_TEXT_LEIA_MAIS @"Leia mais"