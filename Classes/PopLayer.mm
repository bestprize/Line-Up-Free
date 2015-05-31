#include "PopLayer.h"

USING_NS_CC;
USING_NS_CC_EXT;

#include <iostream>
#include <cmath>
#include <string> 
#include <sstream>

using namespace std;


// on "init" you need to initialize your instance
bool Pop::init()
{
    //////////////////////////////
    // 1. super init first
	if ( !LayerColor::initWithColor(Color4B(100,100,100,100)))
    {
        return false;
    }
    
    cocos2d::Size visibleSize = Director::getInstance()->getVisibleSize();
    Vec2 origin = Director::getInstance()->getVisibleOrigin();

	string fullPlistPath = FileUtils::sharedFileUtils()->fullPathForFilename("my.plist");
	FileUtils *fu = FileUtils::getInstance();
	ValueMap vm = fu->getValueMapFromFile(fullPlistPath.c_str());


	Scale9Sprite* scale9 = Scale9Sprite::create("scale9.png");
	scale9->setContentSize(cocos2d::Size(visibleSize.width*2/3,visibleSize.height*4/5));
	scale9->setPosition(visibleSize.width/2,visibleSize.height/2);
	addChild(scale9);

//    auto label = LabelTTF::create(vm["NotRight"].asString().c_str(),"Georgia",48);
//    label->setColor(Color3B(255,255,255));
//    label->setPosition(visibleSize.width/2,visibleSize.height*2/3);
//    addChild(label);
    
    auto closeItem = MenuItemImage::create(
                                              "yes-64.png",
                                              "yes-64.png",
                                              CC_CALLBACK_1(Pop::cancel, this));
    
    closeItem->setPosition(visibleSize.width/2,visibleSize.height/3);
    
    // create menu, it's an autorelease object
    auto menu = Menu::create(closeItem, NULL);
    menu->setPosition(Vec2::ZERO);
    addChild(menu, 1);

    auto callback = [](Touch *,Event *){
        return true;
    };
    
    
    
    auto touchListenerPop = EventListenerTouchOneByOne::create();
    //touchListenerPop->onTouchBegan = CC_CALLBACK_2(Pop::onTouchBegan,this);
    touchListenerPop->onTouchBegan = callback;
    touchListenerPop->setSwallowTouches(true);
    _eventDispatcher->addEventListenerWithSceneGraphPriority(touchListenerPop,this);
    
    return true;
}




void Pop::cancel(Ref* pSender)
{
	this->removeFromParentAndCleanup(true);
    return;
}


void Pop::setContentM( const char* content, int fontsize ){
    
    cocos2d::Size visibleSize = Director::getInstance()->getVisibleSize();
    auto label = LabelTTF::create(content,"Georgia",fontsize,cocos2d::Size(visibleSize.width*5/8,400),TextHAlignment::CENTER,TextVAlignment::CENTER);
    label->setColor(Color3B(255,255,255));
    label->setPosition(visibleSize.width/2,visibleSize.height*2/3);
    addChild(label);
    
}

void Pop::setContentMLink(){
    
    cocos2d::Size visibleSize = Director::getInstance()->getVisibleSize();
    
    MenuItemImage *linkItem;
    linkItem = MenuItemImage::create(
                                     "qi-pro-120.png",
                                     "qi-pro-180.png",
                                     CC_CALLBACK_1(Pop::menulinkToOther, this));
    
    linkItem->setPosition(visibleSize.width*2/5,visibleSize.height/2 + 0);
    
    // create menu, it's an autorelease object
    auto menuLink = Menu::create(linkItem, NULL);
    menuLink->setPosition(Vec2::ZERO);
    addChild(menuLink, 1);
    
    MenuItemImage *linkItem1;
    linkItem1 = MenuItemImage::create(
                                      "qi-adv-120.png",
                                      "qi-adv-180.png",
                                      CC_CALLBACK_1(Pop::menulinkToOther1, this));
    
    linkItem1->setPosition(visibleSize.width*3/5,visibleSize.height/2 + 0);
    
    // create menu, it's an autorelease object
    auto menuLink1 = Menu::create(linkItem1, NULL);
    menuLink1->setPosition(Vec2::ZERO);
    addChild(menuLink1, 1);
    
    
}

void Pop::menulinkToOther(Ref* pSender)
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://itunes.apple.com/cn/app/id991471880?mt=8"]];
}

void Pop::menulinkToOther1(Ref* pSender)
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://itunes.apple.com/cn/app/id999365832?mt=8"]];
}





