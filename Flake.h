#pragma once

#include "ofxiOS.h"

class Flake{
public:
    
    void setup(ofPoint myPoint){
        flakePoint=myPoint;
        float speedMax = 5;
        speedVector.set(ofRandom(-speedMax,speedMax), ofRandom(-speedMax, speedMax));
        eSize = 125;
        rotationSpeed = ofRandomf();
        rotationAngle = 0;
        ofSetCircleResolution(60);
        mouth.load("mouthYellow.png");

        
        
    }
    
    void update() {
        
        flakePoint=flakePoint+speedVector;
        if(flakePoint.x<0+eSize/2+1 || flakePoint.x>ofGetWidth()-eSize/2+1) {
            speedVector.x*=-1;
        }
        
        if(flakePoint.y<0+eSize/2+1 || flakePoint.y>ofGetHeight()-eSize/2+1) {
            speedVector.y*=-1;
        }
        
        rotationAngle+=rotationSpeed;
        
    }
    
    void draw(int eColBgR, int eColBgG, int eColBgB, int eColDetailR, int eColDetailG, int eColDetailB) {
        ofPushMatrix();
        ofTranslate(flakePoint);
        ofRotateZ(rotationAngle);
        ofSetColor(eColBgR,eColBgG,eColBgB);
        ofDrawEllipse(0,0,eSize,eSize);
        ofSetColor(eColDetailR,eColDetailG,eColDetailB);
        ofSetLineWidth(0);
        ofDrawEllipse(-20,-15,eSize/5,eSize/5);
        ofDrawEllipse(20,-15,eSize/5,eSize/5);
        
        mouth.draw(-38.5,5);
        ofPopMatrix();
    }

    
    ofPoint flakePoint;
    ofVec2f speedVector;
    
    ofImage mouth;
    
    int eSize;
    float angle;
    float rotationAngle, rotationSpeed;
    
};


