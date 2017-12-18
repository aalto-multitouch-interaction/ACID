#include "ofApp.h"




//--------------------------------------------------------------
void ofApp::setup(){
    ofSetBackgroundColor(255,255,0);
    
    
    sound1.load("1.mp3");
    sound2.load("2.mp3");
    sound3.load("3.mp3");
    sound4.load("4.mp3");
    sound5.load("5.mp3");
    sound6.load("6.mp3");
    
    soundNum = 0;
    bgNum = 0;
    
    eColBgR = 0;
    eColBgG = 0;
    eColBgB = 0;
    
    eColDetailR = 255;
    eColDetailG = 255;
    eColDetailB = 0;
    
}

//--------------------------------------------------------------
void ofApp::update(){
    for(int i=0;i<myFlakes.size();i++){
        for(int k=0;k<i;k++){
            if(myFlakes[i].flakePoint.distance(myFlakes[k].flakePoint) < myFlakes[i].eSize){
                ofVec2f force = (myFlakes[i].flakePoint - myFlakes[k].flakePoint).normalize();
                myFlakes[i].speedVector = myFlakes[i].speedVector.length() * force;
                myFlakes[k].speedVector = myFlakes[k].speedVector.length() * -force;
                
                //PICK NEXT SOUND
                
                if(soundNum<6) soundNum=ofRandom(6);
                
                if(soundNum==0) sound1.play();
                if(soundNum==1) sound2.play();
                if(soundNum==2) sound3.play();
                if(soundNum==3) sound4.play();
                if(soundNum==4) sound5.play();
                if(soundNum==5) sound6.play();
                
                //std::cout << soundNum << endl;
                
                //CHANGE BG
                
                bgNum=!bgNum;
                
                if(bgNum==0) {
                    ofSetBackgroundColor(0);
                    eColBgR=255;
                    eColBgG=255;
                    eColBgB=0;
                    
                    eColDetailR=0;
                    eColDetailG=0;
                    eColDetailB=0;
                    
                } else {
                    ofSetBackgroundColor(255, 255, 0);
                    eColBgR=0;
                    eColBgG=0;
                    eColBgB=0;
                    
                    eColDetailR=255;
                    eColDetailG=255;
                    eColDetailB=0;
                }
              
                
            };
        }
        
        
        myFlakes[i].update();
        
        
    }
}

//--------------------------------------------------------------
void ofApp::draw(){
    
    
    for(int i=0;i<myFlakes.size();i++){
        myFlakes[i].draw(eColBgR, eColBgG, eColBgB, eColDetailR, eColDetailG, eColDetailB);
        }
    
    
    
}

//--------------------------------------------------------------
void ofApp::exit(){
    
}

//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch){
    
    
    
}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch){
   
    safeArea=70;
    
    if(touch.x>safeArea && touch.x<ofGetWidth()-safeArea && touch.y>safeArea && touch.y<ofGetHeight()-safeArea){
    
    Flake newFlake;
    newFlake.setup(touch);
    myFlakes.push_back(newFlake);
        
    }
    
}

//--------------------------------------------------------------
void ofApp::touchDoubleTap(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::lostFocus(){
    
}

//--------------------------------------------------------------
void ofApp::gotFocus(){
    
}

//--------------------------------------------------------------
void ofApp::gotMemoryWarning(){
    
}

//--------------------------------------------------------------
void ofApp::deviceOrientationChanged(int newOrientation){
    
}


