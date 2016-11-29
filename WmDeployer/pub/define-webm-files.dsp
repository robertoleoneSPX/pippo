<HTML><HEAD><TITLE>Define webMethods Files</TITLE>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
<META http-equiv=Pragma content=no-cache>
<META http-equiv=Expires content=-1>
<LINK href="webMethods.css" type=text/css rel=stylesheet>
<LINK href="xtree.css" type=text/css rel=stylesheet>
<SCRIPT src="webMethods.js"></SCRIPT>
<script src="xtree.js"></script>
<script src="xtreecheckbox.js"></script>
</HEAD>
<BODY>

<TABLE width="100%">
  <TBODY>
  <TR>
    <TD class=menusection-Deployer>%value bundleName% > webMethods Files</TD>
  </TR>
  </TBODY>
</TABLE>

<TABLE width="100%">
<!- Update Files -> 
%ifvar action equals('updateFiles')%
	<!- Packages: projectName, bundleName and tag-value pairs from tree ->
	%invoke wm.deployer.gui.UIBundle:updateBundleFileList%
		%include error-handler.dsp%

		%ifvar status equals('Success')%
		<script>
			// refresh Project left-frame 
			startProgressBar("Displaying new Project definition");
			if(is_csrf_guard_enabled && needToInsertToken) {
   			   parent.treeFrame.document.location.href = "bundle-list.dsp?projectName=%value -htmlcode projectName%&" + _csrfTokenNm_ + "=" + _csrfTokenVal_;
			} else {
			   parent.treeFrame.document.location.href = "bundle-list.dsp?projectName=%value -htmlcode projectName%";
			}
		</script>
		%else%
			<script> stopProgressBar(); </script>
		%endif%
		%ifvar status equals('Warning')%
		<script>
			// refresh Project left-frame 
			startProgressBar("Displaying new Project definition");
			if(is_csrf_guard_enabled && needToInsertToken) {
   			   parent.treeFrame.document.location.href = "bundle-list.dsp?projectName=%value -htmlcode projectName%&" + _csrfTokenNm_ + "=" + _csrfTokenVal_;
			} else {
			   parent.treeFrame.document.location.href = "bundle-list.dsp?projectName=%value -htmlcode projectName%";
			}
		</script>
		%endif%
	%onerror%
		%loop -struct%
			<tr><td>%value $key%=%value%</td></tr>
		%endloop%
	%end invoke%
%end if%
</TABLE>

<SCRIPT>resetRows();</SCRIPT>
<TABLE width="100%">
  <TR>
    <TD colspan="2">
      <UL>
				<LI> <A onclick="return startProgressBar('Refreshing webMethods Files');" href="define-webm-files.dsp?projectName=%value projectName%&bundleName=%value bundleName%&regExp=%value regExp%">Refresh this Page</A></LI> 
       </UL>
    </TD>
  </TR>
</TABLE>

<TABLE class="tableView" width="100%">
	<TBODY>
  <TR>
    <TD class="heading"> Select webMethods Files</TD>
  </TR>

%comment%
	<FORM id="form" name="form" method="POST" action="under-construction.dsp">
%endcomment%
	<FORM id="form" name="form" method="POST" action="define-webm-files.dsp">

	<!- Submit Button, placed at top for convenience ->
	<TR>
		<TD class="action">
			<INPUT onclick="return startProgressBar('Saving webMethods Files');" align="center" type="submit" 
				VALUE="Save" name="submit"> </TD>
		<INPUT type="hidden" name="projectName" value='%value projectName%'>
		<INPUT type="hidden" name="bundleName" value='%value bundleName%'>
		<INPUT type="hidden" name="regExp" value='%value regExp%'>
		<INPUT type="hidden" name="action" value="updateFiles">
		<INPUT type="hidden" name="topDir" value="..">
	</TR>

	<TR>
		<script> writeTD("rowdata-l", "width='100%'");</script>

<script>
	%invoke wm.deployer.gui.UISettings:getSettings%
    %endinvoke%
    
	// Enumerate over entire list of configured sources
	%invoke wm.deployer.gui.UIBundle:getBundleSourceServers%
		%ifvar servers -notempty%
			var fileTree = new WebFXTree("webMethods Files");

		%loop servers%
			%rename serverAliasName serverAlias -copy%
			// Ping this Integration server before investing too much in it
			%ifvar ../optimisticNetwork equals('false')%
				%invoke wm.deployer.gui.server.IS:ping%
				%endinvoke%
			%endif%
			%ifvar ../optimisticNetwork equals('true')%
					%include inc-webm-files-tree.dsp%
			%else%	
				%ifvar status equals('Success')%
					%include inc-webm-files-tree.dsp%
				%else%
					var serverTree = new WebFXTreeItem("%value serverAlias% (Unavailable: %value message%)",
						null, null, webFXTreeConfig.serverIcon, webFXTreeConfig.serverIcon);
				%endif%
			%endif%

			fileTree.add(serverTree);
		%endloop serverAliases%
		%else%
			var fileTree = new WebFXTree("webMethods Files (no Source Servers configured)", null, null, 
				webFXTreeConfig.ISIcon, webFXTreeConfig.ISIcon);
		%endif%
	%endinvoke servers%

// Write out the tree for the next section
	w(fileTree);
</script>
		</TD>
	</TR>

<!- If the regular expression is in force, let the user know>
	<TR>
		<TD valign="top"></td>
		<script>
		writeTDspan("col-l","1");
%ifvar regExp -notempty%
		w("Regular Expression '%value regExp%' not applied to webMethods Files");
%endif%
		</script>
		<TD valign="top"></td>
	</TR>

	<!- Submit Button, placed at bottom for convenience ->
	<TR>
		<TD class="action">
			<INPUT onclick="return startProgressBar('Saving webMethods Files');" align="center" type="submit" 
				VALUE="Save" name="submit2"> </TD>
	</TR>

	</FORM>
	<TBODY>
</TABLE>

<script>
// This bit selects checkboxes from the current definition of the project ->
// getBundleFilesForFolder: projectName*, bundleName, topDir = ..

%invoke wm.deployer.gui.UIBundle:getBundleSourceServers%
%loop servers%
	%scope param(topDir='..')%
	%rename /projectName projectName -copy%
	%rename /bundleName bundleName -copy%
	%invoke wm.deployer.gui.UIBundle:getBundleFilesForFolder%
	%loop files%
		// Find the uniquely named Element
		%ifvar type equals('Folder')%
			var p = document.getElementsByName("%value ../serverAliasName -urlencode%$DEPLOYERDATA$%value name -urlencode%$DEPLOYERDATA$FOLDER_INCL").item(0);
		%else%
			var p = document.getElementsByName("%value ../serverAliasName -urlencode%$DEPLOYERDATA$%value name -urlencode%$DEPLOYERDATA$FILE_INCL").item(0);
		%endif%

		if (p != null) {
			var parentID = p.parentNode.id;
			var anchor = document.getElementById(parentID + '-anchor');

			// check this item, trigger cascade behavior
			webFXTreeHandler.all[parentID].setChecked(true);

			%ifvar type equals('Folder')%
				// For non-partial folders, set to default node behavior
				%ifvar isPartialFolder equals('false')%
					anchor.href = webFXTreeConfig.defaultAction;
					anchor.onclick = 'return true;';
					p.parentNode.className = webFXTreeConfig.defaultClass;	
				%else%
				// For complete folders, disable the checkbox
					p.disabled = true;
				%endif%
			%endif%
		}
	%endloop%
	%endinvoke%
	%endscope%
%endloop%
%endinvoke%

%ifvar action equals('updateFiles')%
%else%
	stopProgressBar();
%endif%

</script>
</BODY></HTML>
