<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Frameset//EN">
<html>
<head>
  <meta http-equiv="Pragma" content="no-cache">
  <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
  <meta http-equiv="Expires" content="-1">
  <title>webMethods Deployer</title>
  <link rel="stylesheet" type="text/css" href="/WmDeployer/deployerlayout.css"></link>
</head>

<!-- <FRAMESET ID="topset" rows="40,*">
	<FRAME name="topbar" src="top.dsp" scrolling="no"
		frameborder="no" noresize MARGINHEIGHT="0" MARGINWIDTH="0">


	<FRAMESET ID="bottomset" cols=120,*>

		<FRAME name="menu" src="menu.dsp" marginwidth="0" marginheight="0" noresize scrolling="no">

		<FRAME name="rightFrame" marginWidth=0 marginHeight=0 noResize scrolling=yes
			borderColor=#758EBD src="%ifvar url%%value url%%endif%">
  </FRAMESET>

  <noframes>
   	<p>This page requires frames, but your browser does not support them.</p>
  </noframes>

</FRAMESET>  -->

 <div height="20%">
 	<iframe class="top" src="top.dsp"></iframe>
 </div>
 <div class="bottom">
    <iframe class="menuframe" name="menu" src="menu.dsp" scrolling="yes" seamless="seamless"></iframe>
    <iframe class="contentframe" name="body" src="%ifvar url%%value url%%endif%"></iframe>
 </div>


</html>
