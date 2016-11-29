<html>

	<head>
		<title>Calendar Picker</title>
		<link rel="stylesheet" type="text/css" href="	webMethods.css">
		<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
		<SCRIPT src="webMethods.js"></SCRIPT>
		<style>
			.scrollbutton  
			{ 
				font-size: 70%; 
				letter-spacing: 2px; 
				font-weight: bold; 
				background-color:#E0E0C0; 
				color:#000000; 
				width:30%; 
			}
		</style>
		<script language="JavaScript1.2">

			var today = (new Date()).getDate();

			function setDate( date )
			{
				var m = new Number('%value -htmlcode month%') + 1;
				if( m < 10 ) {
					m = "0" + m;
				}
				if( date < 10 ) {
					date = "0" + date;
				}
				document.calForm.dateSelected.value = "%value -htmlcode year%-" + m + "-"+date+" 00:00:00";
			}

			function submitCal( whichEnd )
			{
				var theField = null;
				theField = opener.document.logform.date;
				theField.value = trimDate( document.calForm.dateSelected.value );
				window.close();
			}

			function trimDate( date )
			{
				if( date.lastIndexOf(":") > 0 )
				{
					date = date.substring( 0, (date.lastIndexOf(":")+3) );
				}
				if( date.indexOf(" " ) != 0 )
				{
					return date;
				} else {
					while( date.indexOf(" ") == 0 ) {
						date = date.substring( 1, date.lastIndexOf(":")+3 );
					}
					return date;
				}	
			}

			function monthBack() 
			{
				var pMonth = new Number('%value -htmlcode month%') - 1;
				var pYear = new Number('%value -htmlcode year%');
				if( pMonth == -1 ) {
					pMonth = 11; 
					pYear = pYear - 1;
				}
				//alert( "roll back to month = " + pMonth );

		        if(is_csrf_guard_enabled && needToInsertToken) {
		            document.location.replace( "calendar.dsp?year="+pYear+"&month="+pMonth+"&which=%value -htmlcode which%&"+_csrfTokenNm_+"="+ _csrfTokenVal_);
		         } else {
		            document.location.replace( "calendar.dsp?year="+pYear+"&month="+pMonth+"&which=%value -htmlcode which%" );
		         }
			}

			function monthForward() 
			{
				var nMonth = new Number('%value -htmlcode month%') + 1;
				var nYear = new Number('%value -htmlcode year%');
				if( nMonth == 12 ) {
					nMonth = 0;  
					nYear = nYear + 1;
				}
				//alert( "roll forward to next month = " + nMonth + " and year = " + nYear );
				
		        if(is_csrf_guard_enabled && needToInsertToken) {
		            document.location.replace( "calendar.dsp?year="+nYear+"&month="+nMonth+"&which=%value -htmlcode which%&"+_csrfTokenNm_+"="+_csrfTokenVal_);
		         } else {
		            document.location.replace( "calendar.dsp?year="+nYear+"&month="+nMonth+"&which=%value -htmlcode which%" );
		         }
				
			}
			function yearBack() 
			{
				var pYear = new Number('%value -htmlcode year%') - 1;
				
		        if(is_csrf_guard_enabled && needToInsertToken) {
		            document.location.replace( "calendar.dsp?year=" + pYear + "&month=%value -htmlcode month%&which=%value -htmlcode which%&"+_csrfTokenNm_+"="+_csrfTokenVal_);
		         } else {
		            document.location.replace( "calendar.dsp?year=" + pYear + "&month=%value -htmlcode month%&which=%value -htmlcode which%" );
		         }				
			}

			function yearForward() 
			{
				var nYear = new Number('%value -htmlcode year%') + 1;
				
		        if(is_csrf_guard_enabled && needToInsertToken) {
		        	document.location.replace( "calendar.dsp?year=" + nYear + "&month=%value -htmlcode month%&which=%value -htmlcode which%&"+_csrfTokenNm_+"="+_csrfTokenVal_);
		         } else {
		            document.location.replace( "calendar.dsp?year=" + nYear + "&month=%value -htmlcode month%&which=%value -htmlcode which%" );
		         }
				
			}

			function readDate( whichEnd )
			{
				var d = null;
				d = opener.document.logform.date.value;
				document.calForm.dateSelected.value = d;
			}
		</script> 
	</head>

	
	%invoke wm.server.query:getCalendar%
	
	
	
	<body onload="javascript:readDate('%value -htmlcode /which%');">
		<table width=100% >

			<tr>
				<td>
					<form name="scrollForm" method="post">
					<table class="tableView">
						<tr>
							<td colspan="7">
								<table width="100%" align="center" border="0" cellspacing="0" cellpadding="0" bgcolor="#000000" >
									<tr>
										<td align="center">
											<input class="scrollbutton" type="button" name="prevMonth" value="<<" onClick="monthBack();">
										</td>
										<td align="center">
											<font><b>%value -htmlcode monthName%</b></font>
										</td>
										<td align="center">
											<input class="scrollbutton" type="button" name="nextMonth" value=">>" onClick="monthForward();">
										</td>
										<td align="center">
											&nbsp;&nbsp;
										</td>
										<td align="center">
											<input type="button" name="prevYear" value="<<" class="scrollbutton" onClick="yearBack();">
										</td>
										<td align="center">
											<font><b>%value -htmlcode year%</b></font>
										</td>
										<td align="center">
											<input type="button" name="nextYear" value=">>" class="scrollbutton" onClick="yearForward();">
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</form>
					<form name="calForm" action="svc_queryframe.dsp" metHod="post">
						<tr>
							%scope calendarRec%
							%loop weekdays%
							<td class="oddcol">%value -htmlcode weekdays%
							</td>
							%endloop weekdays%
						</tr>
						%loop weeks%
						<tr>
							%loop dates%
							<td class="evencol"><a href="javascript:setDate( %value -htmlcode dates% );">%value -htmlcode dates%</a>
							</td>
							%endloop dates%
						</tr>
						%endloop weeks%
						<tr class="oddrow">
							<td colspan="7" align="center">
								&nbsp;&nbsp;%value -htmlcode /which% <input type="text" name="dateSelected" size="19">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="button" name="set" value="Set" onClick="submitCal('%value -htmlcode /which%');">
							</td>
						</tr>
					</table>
					</form>
				</td>
			</tr>

		</table>
	
	</body>
	%endinvoke%
</html>
