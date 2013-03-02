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

#define K_URL_FUXICO @"http://ofuxico.terra.com.br"

#define K_URL_EGO @"http://ego.globo.com/"


//---------------------------------------------------------------------------------------------------------
// YQL
//---------------------------------------------------------------------------------------------------------
#define K_YQL_EMISSORAS_FUXICO @"http://query.yahooapis.com/v1/public/yql?q=SELECT%20*%20FROM%20html%20WHERE%20url%20%3D%20%22http%3A%2F%2Fofuxico.terra.com.br%2Fcanais.html%22%20AND%20xpath%20%3D%20%22%2F%2Fdiv%5B%40class%20%3D%20'canal'%5D%22%20AND%20charset%20%3D%20%22utf-8%22&format=json&callback="

#define K_YQL_NOVELA_FUXICO @"http://query.yahooapis.com/v1/public/yql?q=SELECT%20*%20FROM%20html%20WHERE%20url%20%3D%20%22http%3A%2F%2Fofuxico.terra.com.br%2Fnovela%2F%@.html%22%20AND%20xpath%20%3D%20%22%2F%2Fdiv%5B%40class%20%3D%20'outras'%5D%22%20AND%20charset%3D%22utf-8%22&format=json&callback="

#define K_YQL_CHAPTER @"http://query.yahooapis.com/v1/public/yql?q=SELECT%20*%20FROM%20html%20WHERE%20url%20%3D%20%22%@%22%20AND%20(xpath%20%3D%20%22%2F%2Fdiv%5B%40class%20%3D%20'img'%5D%22%20OR%20xpath%20%3D%20%22%2F%2Fdiv%5B%40class%20%3D%20'HOTWordsTxt'%5D%22)%20AND%20charset%3D%22utf-8%22&format=json&callback="

#define K_YQL_FOTOGALERIAS @"http://query.yahooapis.com/v1/public/yql?q=SELECT%20*%20FROM%20html%20WHERE%20url%3D%22http%3A%2F%2Fego.globo.com%2Ffotos%2Findex.html%22%20AND%20xpath%3D%22%2F%2Fdiv%5B%40class%3D'conteudo'%5D%22%20AND%20charset%3D%22utf-8%22&format=json&callback="

#define K_YQL_FOTOGALERIA @"http://query.yahooapis.com/v1/public/yql?q=SELECT%20*%20FROM%20html%20WHERE%20url%3D%22http%3A%2F%2Fego.globo.com%2Fpraia%2Ffotos%2F2013%2F02%2Frodrigo-lombardi-e-claudia-raia-gravam-salve-jorge-em-praia-do-rio.html%22%20AND%20(xpath%3D%22%2F%2Fspan%5B%40class%3D'data-criacao'%5D%22%20OR%20xpath%3D%22%2F%2Fspan%5B%40class%3D'data-atualizacao'%5D%22%20OR%20xpath%3D%22%2F%2Fh1%5B%40class%3D'titulo'%5D%22%20OR%20xpath%3D%22%2F%2Fdiv%5B%40class%3D'subtitulo'%5D%2Fp%22%20OR%20xpath%3D%22%2F%2Fdiv%5B%40class%3D'fotos'%5D%2Ful%2Fli%22)%20AND%20charset%3D%22utf-8%22&format=json&callback="

#define K_YQL_SIGNO @"http://query.yahooapis.com/v1/public/yql?q=SELECT%20*%20FROM%20html%20WHERE%20url%20%3D%20%22https%3A%2F%2Fhoroscopo.ego.globo.com%2Fsignos%2F%@%22%20AND%20xpath%20%3D%20%22%2F%2Fdiv%5B%40class%20%3D%20'miolo'%5D%2Fp%22%20AND%20charset%3D%22ISO-8859-1%22&format=json&callback="

#define K_YQL_LIST_CELEBRITY @"http://query.yahooapis.com/v1/public/yql?q=SELECT%20*%20FROM%20html%20WHERE%20url%20%3D%20%22http%3A%2F%2Fego.globo.com%2Ffamosos%2Findex.html%22%20AND%20xpath%20%3D%20%22%2F%2Fdiv%5B%40id%20%3D%20'A'%5D%2Ful%2Fli%22%20AND%20charset%3D%22utf-8%22&format=json&callback="

#define K_YQL_TOP_CELEBRITY @"http://query.yahooapis.com/v1/public/yql?q=SELECT%20*%20FROM%20html%20WHERE%20url%20%3D%20%22http%3A%2F%2Fego.globo.com%2Ffamosos%2Findex.html%22%20AND%20xpath%20%3D%20%22%2F%2Ful%5B%40class%20%3D%20'famosos-importantes'%5D%2Fli%22%20AND%20charset%3D%22utf-8%22&format=json&callback="


//---------------------------------------------------------------------------------------------------------
// SIGNOS
//---------------------------------------------------------------------------------------------------------
#define K_CAPRICORNIO @"capricornio"
#define K_AQUARIO @"aquario"
#define K_PEIXES @"peixes"
#define K_ARIES @"aries"
#define K_TOURO @"touro"
#define K_GEMEOS @"gemeos"
#define K_CANCER @"cancer"
#define K_LEAO @"leao"
#define K_VIRGEM @"virgem"
#define K_LIBRA @"libra"
#define K_ESCORPIAO @"escorpiao"
#define K_SAGITARIO @"sagitario"


//---------------------------------------------------------------------------------------------------------
// Cache
//---------------------------------------------------------------------------------------------------------
#define K_CACHE_TIME_GOOGLE_READER 5 * 60 // 5 min
#define K_CACHE_TIME 10 * 60 // 10 min


//---------------------------------------------------------------------------------------------------------
// Text Helper
//---------------------------------------------------------------------------------------------------------
#define K_TEXT_LEIA_MAIS @"Leia mais"