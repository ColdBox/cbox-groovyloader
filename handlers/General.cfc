﻿<cfcomponent output="false">
	<cfscript>
	this.event_cache_suffix   = "";
	this.prehandler_only      = "";
	this.prehandler_except    = "";
	this.posthandler_only     = "";
	this.posthandler_except   = "";
	this.aroundHandler_only   = "";
	this.aroundHandler_except = "";
	/* HTTP Methods Allowed for actions. */
	/* Ex: this.allowedMethods = {delete='POST,DELETE',index='GET'} */
	this.allowedMethods = structNew();
	</cfscript>

	<!----------------------------------------- IMPLICIT EVENTS ------------------------------------------>

	<!---
		UNCOMMENT HANDLER IMPLICIT EVENTS
		<!--- preHandler --->
		<cffunction name="preHandler" returntype="void" output="false" hint="Executes before any event in this handler">
		<cfargument name="event">
		<cfargument name="rc">
		<cfargument name="prc">
		<cfargument name="action" hint="The intercepted action"/>
		<cfargument name="eventArguments" hint="The event arguments an event is executed with (if any)"/>
		<cfscript>
		</cfscript>
		</cffunction>
		<!--- postHandler --->
		<cffunction name="postHandler" returntype="void" output="false" hint="Executes after any event in this handler">
		<cfargument name="event">
		<cfargument name="rc">
		<cfargument name="prc">
		<cfargument name="action" 			hint="The intercepted action"/>
		<cfargument name="eventArguments" 	hint="The event arguments an event is executed with (if any)"/>
		<cfscript>
		</cfscript>
		</cffunction>
		<!--- aroundHandler --->
		<cffunction name="aroundHandler" returntype="void" output="false" hint="Executes around any event in this handler">
		<cfargument name="event">
		<cfargument name="rc">
		<cfargument name="prc">
		<cfargument name="targetAction" 	hint="The intercepted action UDF method"/>
		<cfargument name="eventArguments" 	hint="The event arguments an event is executed with (if any)"/>
		<cfscript>
		// process targeted action
		argument.targetAction(event);
		</cfscript>
		</cffunction>
		<!--- onMissingAction --->
		<cffunction name="onMissingAction" returntype="void" output="false" hint="Executes if a request action (method) is not found in this handler">
		<cfargument name="event" >
		<cfargument name="rc">
		<cfargument name="prc">
		<cfargument name="missingAction" 	hint="The requested action string"/>
		<cfargument name="eventArguments" 	hint="The event arguments an event is executed with (if any)"/>
		<cfscript>
		</cfscript>
		</cffunction>
		<!--- onError --->
		<cffunction name="onError" output="false" hint="Executes if ANY action causes an exception">
		<cfargument name="event">
		<cfargument name="rc">
		<cfargument name="prc">
		<cfargument name="faultAction" 		hint="The action that caused the error"/>
		<cfargument name="exception"  		hint="The exception structure"/>
		<cfargument name="eventArguments" 	hint="The event arguments an event is executed with (if any)"/>
		<cfscript>
		</cfscript>
		</cffunction>
	--->

	<!------------------------------------------- PUBLIC EVENTS ------------------------------------------>

	<!--- Default Action --->
	<cffunction name="index" returntype="void" output="false" hint="My main event">
		<cfargument name="event">
		<cfargument name="rc">
		<cfargument name="prc">

		<cfset rc.welcomeMessage = "Welcome to ColdBox!">
		<cfset event.setView( "home" )>
	</cffunction>

	<!--- Do Something Action --->
	<cffunction name="doSomething" returntype="void" output="false" hint="Do Something">
		<cfargument name="event">
		<cfargument name="rc">
		<cfargument name="prc">

		<cfset setNextEvent( "general.index" )>
	</cffunction>

	<!------------------------------------------- PRIVATE EVENTS ------------------------------------------>
</cfcomponent>
