<HTML><HEAD>
<TITLE>Add Project</TITLE>
<META http-equiv="Pragma" content="no-cache">
<META http-equiv="Content-Type" content="text/html; charset=UTF-8">
<META http-equiv="Expires" content="-1">
<SCRIPT src="webMethods.js"></SCRIPT>
<LINK href="webMethods.css" type="text/css" rel="stylesheet">
<BODY>
<SCRIPT language=JavaScript>
function onUpdate() {
	
	var n_pwdValue = document.updatePassStoreForm.newPWDValue.value;
		
	if ( trim(n_pwdValue) == "" ) {
		alert("New Password is required.");
		return false;
	}
	startProgressBar('Updating Password Store Entry %value -htmlcode pwdHandle%');
	return true;
}
</SCRIPT>

<TABLE width="100%">
	<TR>
		<TD class="menusection-Deployer" colspan="3">Update Password Store Entry</TD>
	</TR>
</TABLE>

<TABLE width="100%">
  <TBODY>
    <TR>
      <TD><IMG height="10" src="images/blank.gif" width="10"></TD>
    </TR>
    <TR>
      <TD><IMG height="0" src="images/blank.gif" width="10"></TD>
      <TD valign="top">
        <TABLE class="tableForm">
          <TBODY>
            <TR>
              <TD class="heading" colspan="2">Update Password Store Entry</TD>
            </TR>
            <FORM name="updatePassStoreForm" target="treeFrame" action=passstore-main.dsp method=post>
            	<INPUT type="hidden" VALUE="update" name="action">
            	<INPUT type="hidden" VALUE="%value pwdHandle%" name="pwdHandle">
            	<TR>
              		<TD class="oddrow">Password Handle</TD>
              		<TD class="oddrow-l">%value pwdHandle%</TD>
            	</TR>
            	<TR>
              		<TD class="evenrow">* New Password</TD>
              		<TD class="evenrow-l"><INPUT type="password" name="newPWDValue" size="28" maxlength="32"></TD>
            	</TR>            
            	<TR>
              		<TD class="subheading" colspan="2">Required fields are indicated by *</TD>
            	</TR>
            	<TR>
              		<TD class="action" colspan="2">
					<INPUT onclick="return onUpdate();" type="submit" VALUE="Update" name="submit">
					</TD>
            	</TR>
    		</FORM>
          </TBODY>
        </TABLE>
      </TD>
    </TR>
  </TBODY>
</TABLE>

<script>
	document.updatePassStoreForm.pwdHandle.focus();
</script>

</BODY>
</HTML>