#pragma once

#include "ofxiOS.h"
#include "Flake.h"

class ofApp : public ofxiOSApp {
    
public:
    void setup();
    void update();
    void draw();
    void exit();
    
    void touchDown(ofTouchEventArgs & touch);
    void touchMoved(ofTouchEventArgs & touch);
    void touchUp(ofTouchEventArgs & touch);
    void touchDoubleTap(ofTouchEventArgs & touch);
    void touchCancelled(ofTouchEventArgs & touch);
    
    void lostFocus();
    void gotFocus();
    void gotMemoryWarning();
    void deviceOrientationChanged(int newOrientation);
    
    vector <Flake> myFlakes;
    int soundNum;
    int bgNum;
    int eColBgR;
    int eColBgG;
    int eColBgB;
    int eColDetailR;
    int eColDetailG;
    int eColDetailB;
    
    int safeArea;
    
    ofSoundPlayer sound1;
    ofSoundPlayer sound2;
    ofSoundPlayer sound3;
    ofSoundPlayer sound4;
    ofSoundPlayer sound5;
    ofSoundPlayer sound6;
    
};


