component{

	// DI
	property name="settingService" 	inject="settingService@cb";
	property name="cb" 				inject="cbHelper@cb";

	function settings( event, rc, prc ){
		// Exit handler
		prc.xehSave = cb.buildModuleLink( "CKCodeMirror", "home.saveSettings" );
		prc.tabModules_CKCodeMirror = true;
		// settings
		prc.settings = getModuleSettings( "CKCodeMirror" );
		// Avaialble themes
		prc.themes = ["ambiance-mobile", "ambiance", "blackboard", "cobalt", "eclipse", "elegant", "erlang-dark", "lesser-dark",
					  "monokai", "neat", "night", "rubyblue", "solarized", "twilight", "vibrant-link" ,"xq-dark"];
		prc.modes  = ["bbcode", "bbcodemixed","htmlmixed","text/html","application/x-httpd-php","text/javascript"];

		// view
		event.setView( "home/settings" );
	}

	function saveSettings( event, rc, prc ){
		// Get compressor settings
		prc.settings = getModuleSettings( "CKCodeMirror" );

		// iterate over settings
		for( var key in prc.settings ){
			// save only sent in setting keys
			if( structKeyExists( rc, key ) ){
				prc.settings[ key ] = rc[ key ];
			} else
				prc.settings[ key ] = false;

		}

		// Save settings
		var args 	= { name="cbox-CKCodeMirror" };
		var setting = settingService.findWhere( criteria=args );
		setting.setValue( serializeJSON( prc.settings ) );
		settingService.save( setting );

		// Messagebox
		getModel( "messagebox@cbMessagebox" ).info( "Settings Saved & Updated!" );
		// Relocate via CB Helper
		cb.setNextModuleEvent( "CKCodeMirror", "home.settings" );
	}

}