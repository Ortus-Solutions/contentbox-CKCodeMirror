<cfoutput>

<div class="row">
    <div class="col-md-12">
        <h1 class="h1"><i class="fa fa-code fa-lg"></i> CKCodeMirror Settings</h1>
    </div>
</div>


<div class="row">
	<div class="col-md-9">

		<div class="panel panel-default">
		    <div class="panel-body">

				<div class="body" id="mainBody">
					#getInstance( "MessageBox@cbMessageBox" ).renderit()#

					<p>
						Below you can modify the settings used by the CK Code Mirror module.
					</p>
					
					#html.startForm( action="cbadmin.module.ckcodemirror.home.saveSettings", name="settingsForm" )#

						<fieldset>
							<legend><i class="fa fa-cogs"></i> <strong>Options</strong></legend>
							
							#html.select(
								name="theme",
								label="Theme:",
								class="form-control input-lg",
								options=prc.themes,
								groupwrapper="div class='form-group'",
								selectedValue=prc.settings.theme
							)#
						</fieldset>

						<!--- Submit --->
						<div class="actionBar center">
							#html.submitButton( 
								value="Save Settings",
								class="btn btn-lg btn-primary",
								title="Save Settings" 
							)#
						</div>

					#html.endForm()#

				</div>
			</div>
		</div>

	</div>
	<div class="col-md-3">
		<!--- Info Box --->
		<div class="panel panel-primary">
		    <div class="panel-heading">
		        <h3 class="panel-title"><i class="fa fa-medkit"></i> Need Help?</h3>
		    </div>
		    <div class="panel-body">
		    	#renderview(view="_tags/needhelp", module="contentbox-admin" )#
		    </div>
		</div>
	</div>
</div>

</cfoutput>