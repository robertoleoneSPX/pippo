<HTML><HEAD>
<META http-equiv="Pragma" content="no-cache">
<META http-equiv="Content-Type" content="text/html; charset=UTF-8">
<META http-equiv="Expires" content="-1">
<SCRIPT src="webMethods.js"></SCRIPT>
<LINK href="webMethods.css" type="text/css" rel="stylesheet">
<BODY>
<SCRIPT language=JavaScript>
</SCRIPT>

<SCRIPT>
function getAsterisk(value) {
	var pwd = "";
	for (count=0; count<value.length; count++ ) {
		pwd = pwd + "*";
	}
	return w(pwd);
}

</SCRIPT>

%comment%
		%loop -struct%
			%value $key%=%value%<BR>
		%endloop%
%endcomment%

<TABLE width=100%>
	<TR>
		<TD class="menusection-Deployer">%value key% > %ifvar mode equals('view')%Source Values%else%Target Substitutions%endif%</TD>
	</TR>
</TABLE>

<TABLE width="100%">
<!- Save -> 
%ifvar actionButton equals('Save Substitutions')%
	<!- All fields on form ->
	%invoke wm.deployer.gui.UIVarsub:saveVarSubItem%
		%include error-handler.dsp%

	%onerror%
		%loop -struct%
			<tr><td>%value $key%=%value%</td></tr>
		%endloop%
	%end invoke%
%end if%

<!- Clear -> 
%ifvar actionButton equals('Clear Substitutions')%
	<!- All fields on form ->
	%invoke wm.deployer.gui.UIVarsub:removeVarSubItem%
		%include error-handler.dsp%

	%onerror%
		%loop -struct%
			<tr><td>%value $key%=%value%</td></tr>
		%endloop%
	%end invoke%
%end if%
</TABLE>

%invoke wm.deployer.gui.UIVarsub:getVarSubPort%

<TABLE width=100%>
%comment%
	<FORM name="properties" action="under-construction.dsp" method="POST">
%endcomment%
	<FORM NAME="properties" action="varsub-port.dsp" method="POST">
		<INPUT type="hidden" name="projectName" value="%value projectName%">
		<INPUT type="hidden" name="deploymentMapName" value="%value deploymentMapName%">
		<INPUT type="hidden" name="deploymentSetName" value="%value deploymentSetName%">
		<INPUT type="hidden" name="sourceServerAlias" value="%value sourceServerAlias%">
		<INPUT type="hidden" name="targetServerAlias" value="%value targetServerAlias%">
		<INPUT type="hidden" name="key" value="%value key%">
		<INPUT type="hidden" name="varSubItemType" value="%value varSubItemType%">
		<INPUT type="hidden" name="type" value="%value currentItem/type%">
		<INPUT type="hidden" name="mode" value="%value /mode%">

	<TR>
		<TD><IMG SRC="images/blank.gif" height=10 width=10></TD>
		<TD>
		<TABLE class="tableForm">

	%switch currentItem/type%
	%case 'Email'%
			<tr>
				<td class="heading" colspan="4">Email Client Listener Configuration</td>
			</tr>

			<tr>
				<td valign=top>
				<table class="%ifvar /mode equals('view')%tableView%else%tableForm%endif%" width="100%">

							<!- Package Name ->
					<tr><td class="heading" colspan=2>Package</td></tr>
					<tr><td class="evenrow">Package Name</td>
						<td class="%ifvar /mode equals('view')%evenrowdata-l%else%evenrow-l%endif%">
				%ifvar /mode equals('view')%
					%value /currentItem/properties/pkg%
				%else%
							<input name="properties.pkg" value="%value /varSubItem/properties/pkg%" width=30%>
				%endif%
						</td>
					</tr>

					<!- Host ->
					<tr><td class="heading" colspan=2>Server Information</td></tr>
					<tr>
						<td class="oddrow">Host Name</td>
						<td class="%ifvar /mode equals('view')%oddrowdata-l%else%oddrow-l%endif%">
				%ifvar /mode equals('view')%
							%value /currentItem/properties/host%
				%else%
							<input name="properties.host" value="%value /varSubItem/properties/host%" width=30%>
				%endif%
						</td>
					</tr>

					<!- Type ->
					<tr>
						<td class="evenrow">Type</td>
						<td class="%ifvar /mode equals('view')%evenrowdata-l%else%evenrow-l%endif%">
				%ifvar /mode equals('view')%
					%value /currentItem/properties/type%
				%else%
							<input name="properties.type" value="%value /varSubItem/properties/type%" width=30%>
				%endif%
						</td>
					</tr>

					<!- User Name ->
					<tr>
						<td class="oddrow">User Name</td>
						<td class="%ifvar /mode equals('view')%oddrowdata-l%else%oddrow-l%endif%">
				%ifvar /mode equals('view')%
							%value /currentItem/properties/user%
				%else%
							<input name="properties.user" value="%value /varSubItem/properties/user%" width=30%>
				%endif%
						</td>
					</tr>

					<!- Password ->
					<tr>
						<td class="evenrow">Password</td>
						<td class="%ifvar /mode equals('view')%evenrowdata-l%else%evenrow-l%endif%">
				%ifvar /mode equals('view')%
							<script>getAsterisk('%value -code /currentItem/properties/password%');</script>
				%else%
							<script>writeEditPass('%value /mode%', 'password', '%value /varSubItem/properties/password%');</script>
				%endif%
						</td>
					</tr>

					<!- Time Interval ->
					<tr>
						<td class="oddrow">Time Interval (seconds)</td>
						<td class="%ifvar /mode equals('view')%oddrowdata-l%else%oddrow-l%endif%">
				%ifvar /mode equals('view')%
							%value /currentItem/properties/interval%
				%else%
							<input name="properties.interval" value="%value /varSubItem/properties/interval%" width=30%>
				%endif%
						</td>
					</tr>

					<!- Port ->
					<tr>
						<td class="evenrow">Port</td>
						<td class="%ifvar /mode equals('view')%evenrowdata-l%else%evenrow-l%endif%">
				%ifvar /mode equals('view')%
							%value /currentItem/properties/port%
				%else%
							<input name="properties.port" value="%value /varSubItem/properties/port%" width=30%>
				%endif%
						</td>
					</tr>

					<!- Logout? ->
					<tr>
						<td class="oddrow">Log out after each mail check</td>
						<td nowrap class="%ifvar /mode equals('view')%oddrowdata-l%else%oddrow-l%endif%">
				%ifvar /mode equals('view')%
					%value /currentItem/properties/logout%
				%else%
							<input name="properties.logout" value="%value /varSubItem/properties/logout%" width=30%> yes/no
				%endif%
						</td>
					</tr>

					<tr>
						<td class="heading" colspan=2>Security</td>
					</tr>

					<!- RunasUser ->
					<tr>
						<td class="oddrow">Run services as user</td>
						<td class="%ifvar /mode equals('view')%oddrowdata-l%else%oddrow-l%endif%">
				%ifvar /mode equals('view')%
							%value /currentItem/properties/runuser%
				%else%
							<input name="properties.runuser" value="%value /varSubItem/properties/runuser%" width=30%>
				%endif%
						</td>
					</tr>

					<!- Require Auth? ->
					<tr>
						<td class="evenrow">Require authorization within message</td>
						<td nowrap class="%ifvar /mode equals('view')%evenrowdata-l%else%evenrow-l%endif%">
				%ifvar /mode equals('view')%
					%value /currentItem/properties/authorize%
				%else%
							<input name="properties.authorize" value="%value /varSubItem/properties/authorize%" width=30%> yes/no
				%endif%
						</td>
					</tr>

				</table>
				</td>
				<!-- END OF LEFT TABLE -->

				<!-- RIGHT TABLE -->
				<td valign=top >
				<table class="%ifvar /mode equals('view')%tableView%else%tableForm%endif%" width=100% >

					<tr>
						<td class="heading" colspan=2>Message Processing</td>
					</tr>
					<tr>
						<td class="oddrow">Global Service</td>
						<td class="%ifvar /mode equals('view')%oddrowdata-l%else%oddrow-l%endif%">
				%ifvar /mode equals('view')%
							%value /currentItem/properties/gservice%
				%else%
							<input name="properties.gservice" value="%value /varSubItem/properties/gservice%" width=30%>
				%endif%
						</td>
					</tr>

					<tr>
						<td class="evenrow">Default Service</td>
						<td class="%ifvar /mode equals('view')%evenrowdata-l%else%evenrow-l%endif%">
				%ifvar /mode equals('view')%
							%value /currentItem/properties/dservice%
				%else%
							<input name="properties.dservice" value="%value /varSubItem/properties/dservice%" width=30%>
				%endif%
						</td>
					</tr>

					<tr>
						<td class="oddrow">Send reply email with service output</td>
						<td class="%ifvar /mode equals('view')%oddrowdata-l%else%oddrow-l%endif%">
				%ifvar /mode equals('view')%
					%value /currentItem/properties/reply%
				%else%
							<input name="properties.reply" value="%value /varSubItem/properties/reply%" width=30%> yes/no
				%endif%
						</td>
					</tr>

					<tr>
						<td class="evenrow">Send reply email on error</td>
						<td class="%ifvar /mode equals('view')%evenrowdata-l%else%evenrow-l%endif%">
				%ifvar /mode equals('view')%
					%value /currentItem/properties/replyonerr%
				%else%
							<input name="properties.replyonerr" value="%value /varSubItem/properties/replyonerr%" width=30%> yes/no
				%endif%
						</td>
					</tr>

					<tr>
						<td class="oddrow">Delete valid messages (IMAP only)</td>
						<td class="%ifvar /mode equals('view')%oddrowdata-l%else%oddrow-l%endif%">
				%ifvar /mode equals('view')%
					%value /currentItem/properties/remove%
				%else%
							<input name="properties.remove" value="%value /varSubItem/properties/remove%" width=30%> yes/no
				%endif%
						</td>
					</tr>

					<tr>
						<td class="evenrow">Delete invalid messages (IMAP only)</td>
						<td class="%ifvar /mode equals('view')%evenrowdata-l%else%evenrow-l%endif%">
				%ifvar /mode equals('view')%
					%value /currentItem/properties/bad_remove%
				%else%
							<input name="properties.bad_remove" value="%value /varSubItem/properties/bad_remove%" width=30%> yes/no
				%endif%
						</td>
					</tr>

					<tr>
						<td class="oddrow">Multithreaded processing (IMAP only)</td>
						<td class="%ifvar /mode equals('view')%oddrowdata-l%else%oddrow-l%endif%">
				%ifvar /mode equals('view')%
					%value /currentItem/properties/multithread%
				%else%
							<input name="properties.multithread" value="%value /varSubItem/properties/multithread%" width=30%> yes/no
				%endif%
						</td>
					</tr>

					<tr>
						<td class="evenrow">Number of threads if multithreading turned on</td>
						<td class="%ifvar /mode equals('view')%evenrowdata-l%else%evenrow-l%endif%">
				%ifvar /mode equals('view')%
					%ifvar multithread equals('yes')%
						%value /currentItem/properties/num_threads%
					%else%
						0
					%endif%
				%else%
							<input name="properties.num_threads" size="2" MAXLENGTH="2" value="%value /varSubItem/properties/num_threads%"></input>
				%endif%
						</td>
					</tr>

					<tr>
						<td class="oddrow">Invoke service for each part of multipart message</td>
						<td nowrap class="%ifvar /mode equals('view')%oddrowdata-l%else%oddrow-l%endif%">
				%ifvar /mode equals('view')%
					%value /currentItem/properties/break_mmsg%
				%else%
							<input name="properties.break_mmsg" value="%value /varSubItem/properties/break_mmsg%" width=30%> yes/no
				%endif%
						</td>
					</tr>

					<tr>
						<td class="evenrow">Include email headers when passing message to content handler</td>
						<td nowrap class="%ifvar /mode equals('view')%evenrowdata-l%else%evenrow-l%endif%">
				%ifvar /mode equals('view')%
					%value /currentItem/properties/includeHdrs%
				%else%
							<input name="properties.includeHdrs" value="%value /varSubItem/properties/includeHdrs%" width=30%> yes/no
				%endif%
						</td>
					</tr>

					<tr>
						<td class="oddrow">Email body contains URL encoded input parameters</td>
						<td nowrap class="%ifvar /mode equals('view')%oddrowdata-l%else%oddrow-l%endif%">
				%ifvar /mode equals('view')%
					%value /currentItem/properties/urlEncodedBody%
				%else%
							<input name="properties.urlEncodedBody" value="%value /varSubItem/properties/urlEncodedBody%" width=30%> yes/no
				%endif%
						</td>
					</tr>
				</table>

	%case 'FilePolling'%
			<tr>
				<td class="heading" colspan="4">File Polling Listener Configuration</td>
			</tr>

			<tr>
				<td valign=top>
				<table class="%ifvar /mode equals('view')%tableView%else%tableForm%endif%" width="100%">

					<!- Package Name ->
					<tr><td class="heading" colspan=2>Package</td></tr>
					<tr><td class="evenrow">Package Name</td>
						<td class="%ifvar /mode equals('view')%evenrowdata-l%else%evenrow-l%endif%">
				%ifvar /mode equals('view')%
					%value /currentItem/properties/pkg%
				%else%
							<input name="properties.pkg" value="%value /varSubItem/properties/pkg%" width=30%>
				%endif%
						</td>
					</tr>

					<tr>
						<td class="space" colspan="2">&nbsp;</td>
					</tr>

					<tr><td class="heading" colspan=2>Polling Information</td></tr>
					<!- Monitoring dir ->
					<tr>
						<td class="oddrow">Monitoring Directory</td>
						<td class="%ifvar /mode equals('view')%oddrowdata-l%else%oddrow-l%endif%">
				%ifvar /mode equals('view')%
							%value /currentItem/properties/monitorDir%
				%else%
							<input name="properties.monitorDir" value="%value /varSubItem/properties/monitorDir%" width=30%>
				%endif%
						</td>
					</tr>

					<!- Working Dir ->
					<tr>
						<td class="evenrow">Working Directory</td>
						<td class="%ifvar /mode equals('view')%evenrowdata-l%else%evenrow-l%endif%">
				%ifvar /mode equals('view')%
					%value /currentItem/properties/workDir%
				%else%
							<input name="properties.workDir" value="%value /varSubItem/properties/workDir%" width=30%>
				%endif%
						</td>
					</tr>

					<!- Completion Dir ->
					<tr>
						<td class="oddrow">Completion Directory</td>
						<td class="%ifvar /mode equals('view')%oddrowdata-l%else%oddrow-l%endif%">
				%ifvar /mode equals('view')%
							%value /currentItem/properties/completionDir%
				%else%
							<input name="properties.completionDir" value="%value /varSubItem/properties/completionDir%" width=30%>
				%endif%
						</td>
					</tr>

					<!- Error Dir ->
					<tr>
						<td class="oddrow">Error Directory</td>
						<td class="%ifvar /mode equals('view')%oddrowdata-l%else%oddrow-l%endif%">
				%ifvar /mode equals('view')%
							%value /currentItem/properties/errorDir%
				%else%
							<input name="properties.errorDir" value="%value /varSubItem/properties/errorDir%" width=30%>
				%endif%
						</td>
					</tr>

					<!- File Name Filter ->
					<tr>
						<td class="evenrow">File Name Filter</td>
						<td class="%ifvar /mode equals('view')%evenrowdata-l%else%evenrow-l%endif%">
				%ifvar /mode equals('view')%
							%value /currentItem/properties/fileNameFilter%
				%else%
							<input name="properties.fileNameFilter" value="%value /varSubItem/properties/fileNameFilter%" width=30%>
				%endif%
						</td>
					</tr>

					<!- File Age ->
					<tr>
						<td class="evenrow">File Age (seconds)</td>
						<td class="%ifvar /mode equals('view')%evenrowdata-l%else%evenrow-l%endif%">
				%ifvar /mode equals('view')%
							%value /currentItem/properties/fileAge%
				%else%
							<input name="properties.fileAge" value="%value /varSubItem/properties/fileAge%" width=30%>
				%endif%
						</td>
					</tr>

					<!- Content Type ->
					<tr>
						<td class="evenrow">Content Type</td>
						<td class="%ifvar /mode equals('view')%evenrowdata-l%else%evenrow-l%endif%">
				%ifvar /mode equals('view')%
							%value /currentItem/properties/defaultContentType%
				%else%
							<input name="properties.defaultContentType" value="%value /varSubItem/properties/defaultContentType%" width=30%>
				%endif%
						</td>
					</tr>

					<!- Recursive Polling? ->
					<tr>
						<td class="evenrow">Allow Recursive Polling</td>
						<td nowrap class="%ifvar /mode equals('view')%evenrowdata-l%else%evenrow-l%endif%">
				%ifvar /mode equals('view')%
					%value /currentItem/properties/recursive%
				%else%
							<input name="properties.recursive" value="%value /varSubItem/properties/recursive%" size=12> true/false </input>
				%endif%
						</td>
					</tr>

				</table>
				</td>
				<!-- END OF LEFT TABLE -->

				<!-- RIGHT TABLE -->
				<td valign=top >
				<table class="%ifvar /mode equals('view')%tableView%else%tableForm%endif%" width=100% >

					<tr>
						<td class="heading" colspan=2>Security</td>
					</tr>

					<!- RunasUser ->
					<tr>
						<td class="oddrow">Run services as user</td>
						<td class="%ifvar /mode equals('view')%oddrowdata-l%else%oddrow-l%endif%">
				%ifvar /mode equals('view')%
							%value /currentItem/properties/runUser%
				%else%
							<input name="properties.runUser" value="%value /varSubItem/properties/runUser%" width=30%>
				%endif%
						</td>
					</tr>

					<tr>
						<td class="space" colspan="2">&nbsp;</td>
					</tr>

					<tr>
						<td class="heading" colspan=2>Message Processing</td>
					</tr>

					<!- Processing Service ->
					<tr>
						<td class="oddrow">Processing Service</td>
						<td class="%ifvar /mode equals('view')%oddrowdata-l%else%oddrow-l%endif%">
				%ifvar /mode equals('view')%
							%value /currentItem/properties/processingService%
				%else%
							<input name="properties.processingService" value="%value /varSubItem/properties/processingService%" width=30%>
				%endif%
						</td>
					</tr>

					<!- Cleanup Service ->
					<tr>
						<td class="evenrow">Cleanup Service</td>
						<td class="%ifvar /mode equals('view')%evenrowdata-l%else%evenrow-l%endif%">
				%ifvar /mode equals('view')%
							%value /currentItem/properties/cleanUpService%
				%else%
							<input name="properties.cleanUpService" value="%value /varSubItem/properties/cleanUpService%" width=30%>
				%endif%
						</td>
					</tr>

					<!- File Polling ->
					<tr>
						<td class="evenrow">File Polling Interval (seconds)</td>
						<td class="%ifvar /mode equals('view')%evenrowdata-l%else%evenrow-l%endif%">
				%ifvar /mode equals('view')%
							%value /currentItem/properties/filePollingInterval%
				%else%
							<input name="properties.filePollingInterval" value="%value /varSubItem/properties/filePollingInterval%" width=30%>
				%endif%
						</td>
					</tr>

					<!- Cleanup File Age ->
					<tr>
						<td class="evenrow">Cleanup File Age (days)</td>
						<td class="%ifvar /mode equals('view')%evenrowdata-l%else%evenrow-l%endif%">
				%ifvar /mode equals('view')%
							%value /currentItem/properties/cleanUpFileAge%
				%else%
							<input name="properties.cleanUpFileAge" value="%value /varSubItem/properties/cleanUpFileAge%" width=30%>
				%endif%
						</td>
					</tr>

					<!- Cleanup Interval ->
					<tr>
						<td class="evenrow">Cleanup Interval (hours)</td>
						<td class="%ifvar /mode equals('view')%evenrowdata-l%else%evenrow-l%endif%">
				%ifvar /mode equals('view')%
							%value /currentItem/properties/cleanUpInterval%
				%else%
							<input name="properties.cleanUpInterval" value="%value /varSubItem/properties/cleanUpInterval%" width=30%>
				%endif%
						</td>
					</tr>

					<!- Max Number of Invoke Threads ->
					<tr>
						<td class="evenrow">Maximum Number of Invocation Threads</td>
						<td class="%ifvar /mode equals('view')%evenrowdata-l%else%evenrow-l%endif%">
				%ifvar /mode equals('view')%
							%value /currentItem/properties/maxThreads%
				%else%
							<input name="properties.maxThreads" value="%value /varSubItem/properties/maxThreads%" width=30%>
				%endif%
						</td>
					</tr>

				</table>

	%case 'HTTP'%
			<tr>
				<td class="heading" colspan="2">HTTP Listener Configuration</td>
			</tr>

			<tr><td class="oddrow">Port</td>
				<td class="%ifvar /mode equals('view')%oddrowdata-l%else%oddrow-l%endif%">
			%ifvar /mode equals('view')% %value /currentItem/properties/port%
			%else%
					<input name="properties.port" value="%value /varSubItem/properties/port%">
			%endif%
				</td>
			</tr>

			<tr><td class="evenrow">Package Name</td>
				<td class="%ifvar /mode equals('view')%evenrowdata-l%else%evenrow-l%endif%">
			%ifvar /mode equals('view')%
				%value /currentItem/properties/pkg%
			%else%
					<input name="properties.pkg" value="%value /varSubItem/properties/pkg%">
			%endif%
				</td>
			</tr>

			<tr><td class="oddrow">Bind Address</td>
				<td class="%ifvar /mode equals('view')%oddrowdata-l%else%oddrow-l%endif%">
			%ifvar /mode equals('view')%
				%value /currentItem/properties/bindAddress%
			%else%
					<input name="properties.bindAddress" value="%value /varSubItem/properties/bindAddress%">
			%endif%
				</td>
			</tr>

	%case 'HTTPS'%
			<tr>
				<td class="heading" colspan="2">HTTPS Listener Configuration</td>
			</tr>

			<tr><td class="oddrow">Port</td>
				<td class="%ifvar /mode equals('view')%oddrowdata-l%else%oddrow-l%endif%">
			%ifvar /mode equals('view')% %value /currentItem/properties/port%
			%else%
					<input name="properties.port" value="%value /varSubItem/properties/port%">
			%endif%
				</td>
			</tr>

			<tr><td class="evenrow">Client Authentication</td>
				<td class="%ifvar /mode equals('view')%evenrowdata-l%else%evenrow-l%endif%">
			%ifvar /mode equals('view')%
				%switch /currentItem/properties/clientAuth%
				%case 'none'%
					None
				%case 'request'%
					Request Client Certificates
				%case 'require'%
					Require Client Certificates
				%end%
			%else%
					<SELECT size="1" name="properties.clientAuth">
						<OPTION VALUE=""></OPTION>
						<OPTION %ifvar /varSubItem/properties/clientAuth equals('none')% selected %endif% value="none">None</OPTION>
						<OPTION %ifvar /varSubItem/properties/clientAuth equals('request')% selected %endif% value="request">Request Client Certificates</OPTION>
						<OPTION %ifvar /varSubItem/properties/clientAuth equals('require')% selected %endif% value="require">Require Client Certificates</OPTION>
					</SELECT>
			%endif%
				</td>
			</tr>


			<tr><td class="oddrow">Package Name</td>
				<td class="%ifvar /mode equals('view')%oddrowdata-l%else%oddrow-l%endif%">
			%ifvar /mode equals('view')%
				%value /currentItem/properties/pkg%
			%else%
					<input name="properties.pkg" value="%value /varSubItem/properties/pkg%">
			%endif%
				</td>
			</tr>

			<tr><td class="evenrow">Bind Address</td>
				<td class="%ifvar /mode equals('view')%evenrowdata-l%else%evenrow-l%endif%">
			%ifvar /mode equals('view')%
				%value /currentItem/properties/bindAddress%
			%else%
					<input name="properties.bindAddress" value="%value /varSubItem/properties/bindAddress%">
			%endif%
				</td>
			</tr>

			<tr>
				<td class="heading" colspan="2">Listener Specific Credentials (Optional)</td>
			</tr>

			<tr><td class="oddrow">Server's Certificate</td>
				<td class="%ifvar /mode equals('view')%oddrowdata-l%else%oddrow-l%endif%">
			%ifvar /mode equals('view')% %value /currentItem/properties/certChain[0]%
			%else%
					<input name="properties.signedCert" value="%value /varSubItem/properties/certChain[0]%">
			%endif%
				</td>
			</tr>

			<tr><td class="evenrow">Authority's Certificate</td>
				<td class="%ifvar /mode equals('view')%evenrowdata-l%else%evenrow-l%endif%">
			%ifvar /mode equals('view')%
				%value /currentItem/properties/certChain[1]%
			%else%
					<input name="properties.caCert" value="%value /varSubItem/properties/certChain[1]%">
			%endif%
				</td>
			</tr>


			<tr><td class="oddrow">Private Key</td>
				<td class="%ifvar /mode equals('view')%oddrowdata-l%else%oddrow-l%endif%">
			%ifvar /mode equals('view')%
				%value /currentItem/properties/privKey%
			%else%
					<input name="properties.privKey" value="%value /varSubItem/properties/privKey%">
			%endif%
				</td>
			</tr>

			<tr><td class="evenrow">Trusted Authority Directory</td>
				<td class="%ifvar /mode equals('view')%evenrowdata-l%else%evenrow-l%endif%">
			%ifvar /mode equals('view')%
				%value /currentItem/properties/caDir%
			%else%
					<input name="properties.caDir" value="%value /varSubItem/properties/caDir%">
			%endif%
				</td>
			</tr>

	%case 'FTP'%
			<tr>
				<td class="heading" colspan="2">FTP Listener Configuration</td>
			</tr>

			<tr><td class="oddrow">Port</td>
				<td class="%ifvar /mode equals('view')%oddrowdata-l%else%oddrow-l%endif%">
			%ifvar /mode equals('view')% %value /currentItem/properties/port%
			%else%
					<input name="properties.port" value="%value /varSubItem/properties/port%">
			%endif%
				</td>
			</tr>

			<tr><td class="evenrow">Package Name</td>
				<td class="%ifvar /mode equals('view')%evenrowdata-l%else%evenrow-l%endif%">
			%ifvar /mode equals('view')%
				%value /currentItem/properties/pkg%
			%else%
					<input name="properties.pkg" value="%value /varSubItem/properties/pkg%">
			%endif%
				</td>
			</tr>

			<tr><td class="oddrow">Bind Address</td>
				<td class="%ifvar /mode equals('view')%oddrowdata-l%else%oddrow-l%endif%">
			%ifvar /mode equals('view')%
				%value /currentItem/properties/bindAddress%
			%else%
					<input name="properties.bindAddress" value="%value /varSubItem/properties/bindAddress%">
			%endif%
				</td>
			</tr>

	%case 'FTPS'%
			<tr>
				<td class="heading" colspan="2">FTPS Listener Configuration</td>
			</tr>

			<tr><td class="oddrow">Port</td>
				<td class="%ifvar /mode equals('view')%oddrowdata-l%else%oddrow-l%endif%">
			%ifvar /mode equals('view')% %value /currentItem/properties/port%
			%else%
					<input name="properties.port" value="%value /varSubItem/properties/port%">
			%endif%
				</td>
			</tr>

			<tr><td class="evenrow">Client Authentication</td>
				<td class="%ifvar /mode equals('view')%evenrowdata-l%else%evenrow-l%endif%">
			%ifvar /mode equals('view')%
				%switch /currentItem/properties/clientAuth%
				%case 'none'%
					None
				%case 'request'%
					Request Client Certificates
				%case 'require'%
					Require Client Certificates
				%end%
			%else%
					<SELECT size="1" name="properties.clientAuth">
						<OPTION VALUE=""></OPTION>
						<OPTION %ifvar /varSubItem/properties/clientAuth equals('none')% selected %endif% value="none">None</OPTION>
						<OPTION %ifvar /varSubItem/properties/clientAuth equals('request')% selected %endif% value="request">Request Client Certificates</OPTION>
						<OPTION %ifvar /varSubItem/properties/clientAuth equals('require')% selected %endif% value="require">Require Client Certificates</OPTION>
					</SELECT>
			%endif%
				</td>
			</tr>


			<tr><td class="oddrow">Package Name</td>
				<td class="%ifvar /mode equals('view')%oddrowdata-l%else%oddrow-l%endif%">
			%ifvar /mode equals('view')%
				%value /currentItem/properties/pkg%
			%else%
					<input name="properties.pkg" value="%value /varSubItem/properties/pkg%">
			%endif%
				</td>
			</tr>

			<tr><td class="evenrow">Bind Address</td>
				<td class="%ifvar /mode equals('view')%evenrowdata-l%else%evenrow-l%endif%">
			%ifvar /mode equals('view')%
				%value /currentItem/properties/bindAddress%
			%else%
					<input name="properties.bindAddress" value="%value /varSubItem/properties/bindAddress%">
			%endif%
				</td>
			</tr>

			<tr><td class="oddrow">Secure Clients Only</td>
				<td class="%ifvar /mode equals('view')%oddrowdata-l%else%oddrow-l%endif%">
			%ifvar /mode equals('view')%
				%value /currentItem/properties/secureclients%
			%else%
					<input name="properties.secureclients" value="%value /varSubItem/properties/secureclients%"> (true/false)
			%endif%
				</td>
			</tr>

			<tr>
				<td class="heading" colspan="2">Listener Specific Credentials (Optional)</td>
			</tr>

			<tr><td class="oddrow">Server's Certificate</td>
				<td class="%ifvar /mode equals('view')%oddrowdata-l%else%oddrow-l%endif%">
			%ifvar /mode equals('view')% %value /currentItem/properties/certChain[0]%
			%else%
					<input name="properties.signedCert" value="%value /varSubItem/properties/certChain[0]%">
			%endif%
				</td>
			</tr>

			<tr><td class="evenrow">Authority's Certificate</td>
				<td class="%ifvar /mode equals('view')%evenrowdata-l%else%evenrow-l%endif%">
			%ifvar /mode equals('view')%
				%value /currentItem/properties/certChain[1]%
			%else%
					<input name="properties.caCert" value="%value /varSubItem/properties/certChain[1]%">
			%endif%
				</td>
			</tr>


			<tr><td class="oddrow">Private Key</td>
				<td class="%ifvar /mode equals('view')%oddrowdata-l%else%oddrow-l%endif%">
			%ifvar /mode equals('view')%
				%value /currentItem/properties/privKey%
			%else%
					<input name="properties.privKey" value="%value /varSubItem/properties/privKey%">
			%endif%
				</td>
			</tr>

			<tr><td class="evenrow">Trusted Authority Directory</td>
				<td class="%ifvar /mode equals('view')%evenrowdata-l%else%evenrow-l%endif%">
			%ifvar /mode equals('view')%
				%value /currentItem/properties/caDir%
			%else%
					<input name="properties.caDir" value="%value /varSubItem/properties/caDir%">
			%endif%
				</td>
			</tr>

	%case 'HTTP-Diagnostic'%
			<tr>
				<td class="heading" colspan="2">Diagnostic Listener Configuration</td>
			</tr>

			<tr><td class="oddrow">Port</td>
				<td class="%ifvar /mode equals('view')%oddrowdata-l%else%oddrow-l%endif%">
			%ifvar /mode equals('view')% %value /currentItem/properties/port%
			%else%
					<input name="properties.port" value="%value /varSubItem/properties/port%">
			%endif%
				</td>
			</tr>

			<tr><td class="evenrow">Package Name</td>
				<td class="%ifvar /mode equals('view')%evenrowdata-l%else%evenrow-l%endif%">
			%ifvar /mode equals('view')%
				%value /currentItem/properties/pkg%
			%else%
					<input name="properties.pkg" value="%value /varSubItem/properties/pkg%">
			%endif%
				</td>
			</tr>

			<tr><td class="oddrow">Bind Address</td>
				<td class="%ifvar /mode equals('view')%oddrowdata-l%else%oddrow-l%endif%">
			%ifvar /mode equals('view')%
				%value /currentItem/properties/bindAddress%
			%else%
					<input name="properties.bindAddress" value="%value /varSubItem/properties/bindAddress%">
			%endif%
				</td>
			</tr>

	%endswitch%

			<tr>
				<td class="heading" colspan="2">Service Access Settings</td>
			</tr>

			<tr><td class="evenrow">Access Mode</td>
				<td class="%ifvar /mode equals('view')%evenrowdata-l%else%evenrow-l%endif%">
			%ifvar /mode equals('view')%
				%switch /currentItem/serviceAccessMode%
				%case 'include'%
					Allow by Default 
				%case 'exclude'%
					Deny by Default 
				%end%
			%else%
					<SELECT size="1" name="serviceAccessMode">
						<OPTION selected value=""></OPTION>
						<OPTION %ifvar /varSubItem/serviceAccessMode equals('exclude')% selected %endif% value="exclude">Deny by Default</OPTION>
						<OPTION %ifvar /varSubItem/serviceAccessMode equals('include')% selected %endif% value="include">Allow by Default</OPTION>
					</SELECT>
			%endif%
				</td>
			</tr>

			<tr><td class="oddrow">Folder:Service List%ifvar /mode equals('edit')%<BR>Use ";" to separate entries.%endif%</td>
				<td class="%ifvar /mode equals('view')%oddrowdata-l%else%oddrow-l%endif%">

				%ifvar /mode equals('view')%
					%loop /currentItem/serviceAccessList%
						%value% <BR>
					%endloop%
				%else%
					<input type=text name="serviceAccessList" size=50>
					<script>
					var s = new String();
					%loop /varSubItem/serviceAccessList%
						if (s.length == 0)
							s += "%value%";
						else
							s += ";%value%";
					%endloop%
					document.properties.serviceAccessList.value = s;
					</script>
				%endif%
				</td>
			</tr>

			<tr>
				<td class="heading" colspan="2">IP Access Settings</td>
			</tr>

			<tr><td class="evenrow">Access Type</td>
				<td class="%ifvar /mode equals('view')%evenrowdata-l%else%evenrow-l%endif%">
			%ifvar /mode equals('view')%
				%switch /currentItem/ipAccessMode%
				%case '0'%
					Global
				%case '1'%
					Allow by Default 
				%case '2'%
					Deny by Default 
				%end%
			%else%
					<SELECT size="1" name="ipAccessMode">
						<OPTION selected value=""></OPTION>
						<OPTION %ifvar /varSubItem/ipAccessMode equals('0')% selected %endif% value="0">Global</OPTION>
						<OPTION %ifvar /varSubItem/ipAccessMode equals('1')% selected %endif% value="1">Allow by Default</OPTION>
						<OPTION %ifvar /varSubItem/ipAccessMode equals('2')% selected %endif% value="2">Deny by Default</OPTION>
					</SELECT>
			%endif%
				</td>
			</tr>

			<tr><td class="oddrow">Host List%ifvar /mode equals('edit')%<BR>Use ";" to separate Host entries.%endif%</td>
				<td class="%ifvar /mode equals('view')%oddrowdata-l%else%oddrow-l%endif%">

				%ifvar /mode equals('view')%
					%loop /currentItem/ipAccessList%
						%value% <BR>
					%endloop%
				%else%
					<input type=text name="ipAccessList" size=50>
					<script>
					var s = new String();
					%loop /varSubItem/ipAccessList%
						if (s.length == 0)
							s += "%value%";
						else
							s += ";%value%";
					%endloop%
					document.properties.ipAccessList.value = s;
					</script>
				%endif%
				</td>
			</tr>

			%ifvar /mode equals('edit')%
			<tr>
				<td colspan="1" class="action">
				<input name="actionButton" type="submit" value="Save Substitutions"> </td>
				<td colspan="1" class="action"> 
				<input name="actionButton" type="submit" value="Clear Substitutions"> </td>
			</tr>
			%endif%
		</table>
		</td>
	</TR>
	</FORM>
</TABLE>
%endinvoke%

</BODY>
</HTML>
