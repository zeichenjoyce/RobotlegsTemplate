/**
 * Copyright (C) 2005-2011 by Rivello Multimedia Consulting (RMC).                    
 * code [at] RivelloMultimediaConsulting [dot] com                                                  
 *                                                                      
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the      
 * "Software"), to deal in the Software without restriction, including  
 * without limitation the rights to use, copy, modify, merge, publish,  
 * distribute, sublicense, and#or sell copies of the Software, and to   
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:                                            
 *                                                                      
 * The above copyright notice and this permission notice shall be       
 * included in all copies or substantial portions of the Software.      
 *                                                                      
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,      
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF   
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 * IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR    
 * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
 * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.                                      
 */
//Marks the right margin of code *******************************************************************
package com.rmc.projects.multiplayertemplate.robotlegs.controller.commands
{
	
	//--------------------------------------
	//  Imports
	//--------------------------------------
	import com.rmc.projects.multiplayertemplate.managers.AssetManager;
	import com.rmc.projects.multiplayertemplate.robotlegs.controller.signals.flexmobile.ViewNavigatorSignal;
	import com.rmc.projects.multiplayertemplate.robotlegs.model.multiplayer.union.MultiplayerModel;
	import com.rmc.projects.multiplayertemplate.robotlegs.model.phrases.PhrasesModel;
	import com.rmc.projects.robotlegstemplate.robotlegs.model.events.flexmobile.MultiplayerConnectEvent;
	import com.rmc.projects.multiplayertemplate.robotlegs.services.ILoadService;
	
	import org.robotlegs.mvcs.Command;
	
	import spark.transitions.FlipViewTransition;
	
	
	/**
	 * <p>Command: Clearing the message for the application</p>
	 * 
	 * <p>AUTHOR  		: Samuel Asher Rivello (code [at] RivelloMultimediaConsulting [dot] com)</p>
	 * <p>COMPANY 		: Rivello Multimedia Consulting</p>
	 * <p>CREATION DATE 	: Apr 05, 2010</p>
	 * 
	 * @example Here is a code example.  
	 * 
	 * <listing version="3.0" >
	 * 	//Code example goes here.
	 * </listing>
	 *
	 */
	public class ClearMessageCommand extends Command
	{
		
		//--------------------------------------
		//  Properties
		//--------------------------------------
		/**
		 * Reference to the MessageModel
		 * 
		 */
		[Inject]
		public var messageModel : MultiplayerModel;
		
		/**
		 * Signal: Change the View
		 * 
		 */
		[Inject]
		public var viewNavigatorPopViewSignal : ViewNavigatorSignal;
		
		
		//--------------------------------------
		//  Methods
		//--------------------------------------
		/**
		 * Robotlegs Requirement: Execute the command
		 * 
		 * @return void
		 *
		 */
		override public function execute():void
		{
			
			//	CHANGE MESSAGE
			messageModel.message = "";
			
			//	CHANGE VIEW
			viewNavigatorPopViewSignal.dispatch(new MultiplayerConnectEvent (MultiplayerConnectEvent.POP_VIEW, null, AssetManager.getViewTransition(MultiplayerConnectEvent.POP_VIEW) ) );
			
		}
	}
}