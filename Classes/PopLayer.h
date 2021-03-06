#ifndef __POPLAYER_H__
#define __POPLAYER_H__

#include "cocos2d.h"
#include "cocos-ext.h"

class Pop : public cocos2d::LayerColor
{
public:
    // there's no 'id' in cpp, so we recommend returning the class instance pointer
   

    // Here's a difference. Method 'init' in cocos2d-x returns bool, instead of returning 'id' in cocos2d-iphone
    virtual bool init();  
    
	
    // implement the "static create()" method manually
    CREATE_FUNC(Pop);
	void cancel(Ref* pSender);
    void setContentM( const char* content, int fontsize );
    void setContentMLink();
    void menulinkToOther(Ref* pSender);
    void menulinkToOther1(Ref* pSender);

};

#endif // __POPLAYER_H__
