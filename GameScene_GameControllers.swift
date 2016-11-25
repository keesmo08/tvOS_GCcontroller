//
//  GameScene_GameControllers.swift
//  tvOSContollerGame
//
//  Created by Sam Stevens on 11/25/16.
//  Copyright © 2016 Sam Stevens. All rights reserved.
//

import Foundation
import SpriteKit
import GameController

extension GameScene {
    func setUpControllerObservers(){
        NotificationCenter.default.addObserver(self, selector: Selector("connectControllers"), name: NSNotification.Name.GCControllerDidConnect, object: nil)
        NotificationCenter.default.addObserver(self, selector: Selector("controllerDisconnected"), name: NSNotification.Name.GCControllerDidDisconnect, object: nil)
    }
    
    func connectControllers(){
        self.isPaused = false
        for controller in GCController.controllers() {
            if (controller.extendedGamepad != nil ) {
                controller.extendedGamepad?.valueChangedHandler = nil
                setUpExtendedController (controller: controller)
            }  else if (controller.gamepad != nil ) {
                controller.gamepad?.valueChangedHandler = nil
                setUpStandardController (controller: controller)
            }
        }
        //… to be continued…
        #if os(tvOS)
            for controller in GCController.controllers() {
                if ( controller.extendedGamepad != nil) {
                    //ignore
                } else if ( controller.gamepad != nil) {
                    //ignore
                } else if ( controller.microGamepad != nil) {
                    controller.microGamepad?.valueChangedHandler = nil
                    setUpStandardController( controller: controller )
                }
            }
        #endif
    }
    func setUpExtendedController( controller:GCController) {
        controller.extendedGamepad?.valueChangedHandler = {
            (gamepad: GCExtendedGamepad, element:GCControllerElement) in
            if (gamepad.controller?.playerIndex == .index1) {
                // this is player 1 playing the controller
            } else if (gamepad.controller?.playerIndex == .index2) {
                // this is player 1 playing the controller
            }
            
            if (gamepad.leftThumbstick == element) {
                if (gamepad.leftThumbstick.left.value > 0.2) {
                    print("isPressed leftThumbstick left")
                } else if (gamepad.leftThumbstick.left.isPressed == false) {
                    print ("left go of leftThumbstick left")
                }
            } else if (gamepad.rightThumbstick == element) {
                if (gamepad.rightThumbstick.right.value > 0.2) {
                    print("isPressed rightThumbstick right")
                } else if (gamepad.rightThumbstick.right.isPressed == false) {
                    print ("left go of rightThumbstick right")
                }
            } else if (gamepad.dpad == element) {
                if (gamepad.dpad.right.isPressed == true){
                    print("isPressed dpad right")
                } else if (gamepad.dpad.right.isPressed == false){
                    print("let go of dpad right")
                }
                if (gamepad.dpad.left.isPressed == true){
                    print("isPressed dpad left")
                } else if (gamepad.dpad.left.isPressed == false){
                    print("let go of dpad left")
                }
            } else if (gamepad.leftShoulder == element){
                if ( gamepad.leftShoulder.isPressed == true){
                    print("leftShoulder isPressed")
                } else if ( gamepad.leftShoulder.isPressed == false) {
                    print("leftShoulder released")
                }
            }
            else if (gamepad.leftTrigger == element){
                if ( gamepad.leftTrigger.isPressed == true){
                    print("leftTrigger isPressed")
                } else if ( gamepad.leftTrigger.isPressed == false) {
                    print("leftTrigger released")
                }
            }
            else if (gamepad.rightShoulder == element){
                if ( gamepad.rightShoulder.isPressed == true){
                    print("rightShoulder isPressed")
                } else if ( gamepad.rightShoulder.isPressed == false) {
                    print("rightShoulder released")
                }
            }
            else if (gamepad.rightTrigger == element){
                if ( gamepad.rightTrigger.isPressed == true){
                    print("rightTrigger isPressed")
                } else if ( gamepad.rightTrigger.isPressed == false) {
                    print("rightTrigger released")
                }
            } else if ( gamepad.buttonA == element) {
                if ( gamepad.buttonA.isPressed == true){
                    print("buttonA isPressed")
                } else if ( gamepad.buttonA.isPressed == false) {
                    print("buttonA released")
                }
            } else if ( gamepad.buttonY == element) {
                if ( gamepad.buttonY.isPressed == true){
                    print("buttonY isPressed")
                } else if ( gamepad.buttonY.isPressed == false) {
                    print("buttonY released")
                }
            } else if ( gamepad.buttonB == element) {
                if ( gamepad.buttonB.isPressed == true){
                    print("buttonB isPressed")
                } else if ( gamepad.buttonB.isPressed == false) {
                    print("buttonB released")
                }
            } else if ( gamepad.buttonX == element) {
                if ( gamepad.buttonX.isPressed == true){
                    print("buttonX isPressed")
                } else if ( gamepad.buttonX.isPressed == false) {
                    print("buttonX released")
                }
            }
        }
    }
    
    func setUpStandardController( controller:GCController) {
        controller.gamepad?.valueChangedHandler = {
            (gamepad: GCGamepad, element:GCControllerElement) in
            if (gamepad.controller?.playerIndex == .index1) {
                // this is player 1 playing the controller
            } else if (gamepad.controller?.playerIndex == .index2) {
                // this is player 1 playing the controller
            }
        
            if (gamepad.dpad == element) {
                if (gamepad.dpad.right.isPressed == true){
                    print("isPressed dpad right")
                } else if (gamepad.dpad.right.isPressed == false){
                    print("let go of dpad right")
                }
                if (gamepad.dpad.left.isPressed == true){
                    print("isPressed dpad left")
                } else if (gamepad.dpad.left.isPressed == false){
                    print("let go of dpad left")
                }
            } else if (gamepad.leftShoulder == element){
                if ( gamepad.leftShoulder.isPressed == true){
                    print("leftShoulder isPressed")
                } else if ( gamepad.leftShoulder.isPressed == false) {
                    print("leftShoulder released")
                }
            }
            else if ( gamepad.buttonA == element) {
                if ( gamepad.buttonA.isPressed == true){
                    print("buttonA isPressed")
                } else if ( gamepad.buttonA.isPressed == false) {
                    print("buttonA released")
                }
            } else if ( gamepad.buttonY == element) {
                if ( gamepad.buttonY.isPressed == true){
                    print("buttonY isPressed")
                } else if ( gamepad.buttonY.isPressed == false) {
                    print("buttonY released")
                }
            } else if ( gamepad.buttonB == element) {
                if ( gamepad.buttonB.isPressed == true){
                    print("buttonB isPressed")
                } else if ( gamepad.buttonB.isPressed == false) {
                    print("buttonB released")
                }
            } else if ( gamepad.buttonX == element) {
                if ( gamepad.buttonX.isPressed == true){
                    print("buttonX isPressed")
                } else if ( gamepad.buttonX.isPressed == false) {
                    print("buttonX released")
                }
            }
        }
    }
    #if os(tvOS)
    func setUpMicroController( controller:GCController) {
        controller.microGamepad?.valueChangedHandler = {
            (gamepad:GCMicroGamepad, element:GCControllerElement) in
            gamepad.reportsAbsoluteDpadValues = true
            gamepad.allowsRotation = true
            if ( gamepad.buttonX == element) {
                
                if (gamepad.buttonX.isPressed == true){
                    //Button X is the play / pause button on the new Apple TV remote
                    print("pressed buttonX on the microGamepad")
                } else if (gamepad.buttonX.isPressed == false ){
                    print("released buttonX on the microGamepad")
                }
            } else if ( gamepad.buttonA == element) {
                //Button A is usually activated by a harder press on the touchpad.
                if (gamepad.buttonA.isPressed == true){
                    print("pressed buttonA on the microGamepad")
                } else if (gamepad.buttonA.isPressed == false ){
                    print("released buttonA on the microGamepad")
                }
            }
            else if (gamepad.dpad == element) {
                if (gamepad.dpad.right.value > 0.1) {
                    print("pressed right")
                } else if (gamepad.dpad.right.value == 0.0) {
                    print("released right")
                }
                if (gamepad.dpad.left.value > 0.1) {
                    print("pressed left")
                } else if (gamepad.dpad.left.value == 0.0) {
                    print("released left")
                }
            }
        }
    }
    #endif
    func controllerDisconnected(){
        self.isPaused = true;
    }
}
