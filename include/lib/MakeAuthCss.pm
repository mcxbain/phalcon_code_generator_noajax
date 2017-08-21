package MakeAuthCss;

sub MakeAuthCss
{
my $output_file = shift;
open (MYFILE, ">$output_file");

print MYFILE "/*******************************************************\n";
print MYFILE "AUTH CSS\n";
print MYFILE "*******************************************************/\n";
print MYFILE "* {\n";
print MYFILE "	box-sizing: border-box;\n";
print MYFILE "	position: relative;\n";
print MYFILE "	-moz-box-sizing: border-box;\n";
print MYFILE "	-webkit-box-sizing: border-box;\n";
print MYFILE "}\n";

print MYFILE "*:focus {\n";
print MYFILE "	outline-color: rgb(207, 16, 118);\n";
print MYFILE "	outline-style: auto;\n";
print MYFILE "	outline-width: 5px;\n";
print MYFILE "	z-index: 1000;\n";
print MYFILE "}\n";

print MYFILE ":-webkit-input-placeholder {\n";
print MYFILE "	color: #888;\n";
print MYFILE "	font-style: italic;\n";
print MYFILE "}\n";

print MYFILE ":-moz-placeholder {\n";
print MYFILE "	color: #888;\n";
print MYFILE "	font-style: italic;\n";
print MYFILE "}\n";

print MYFILE "html {\n";
print MYFILE "	height: 100%;\n";
print MYFILE "	font-size: 100%;\n";
print MYFILE "	overflow-y: scroll;\n";
print MYFILE "	-webkit-text-size-adjust: 100%;\n";
print MYFILE "	-ms-text-size-adjust: 100%;\n";
print MYFILE "}\n";

print MYFILE "body {\n";
print MYFILE "	-webkit-font-smoothing: antialiased;\n";
print MYFILE "	background-color: #fff;\n";
print MYFILE "	font-size: 16px;\n";
print MYFILE "	font-smoothing: antialiased;\n";
print MYFILE "	height: 100%;\n";
print MYFILE "	line-height: 1.5em;\n";
print MYFILE "	margin: 0;\n";
print MYFILE "	text-align: center;\n";
print MYFILE "}\n";

print MYFILE "body,input {\n";
print MYFILE "	font-family: helvetica, arial, sans-serif;\n";
print MYFILE "	font-size: 100%/1.5;\n";
print MYFILE "	color: #000;\n";
print MYFILE "}\n";

print MYFILE "input[type=reset],input[type=submit],input[type=button] {\n";
print MYFILE "	display: inline-block;\n";
print MYFILE "	-webkit-tap-highlight-color: rgba(0, 0, 0, 0);\n";
print MYFILE "	-moz-tap-highlight-color: rgba(0, 0, 0, 0);\n";
print MYFILE "	-o-tap-highlight-color: rgba(0, 0, 0, 0);\n";
print MYFILE "	tap-highlight-color: rgba(0, 0, 0, 0);\n";
print MYFILE "}\n";

print MYFILE "#login_box {\n";
print MYFILE "	border: 1px solid #000000;\n";
print MYFILE "	border-right: 1px solid #000000;\n";
print MYFILE "	border-bottom: 1px solid #000000;\n";
print MYFILE "	background: #fff;\n";
print MYFILE "	width: 400px;\n";
print MYFILE "	margin: 10% auto 0 auto;\n";
print MYFILE "	padding: 1em;\n";
print MYFILE "	text-align: center;\n";
print MYFILE "}\n";

print MYFILE "h1 {\n";
print MYFILE "	margin: 0;\n";
print MYFILE "}\n";

print MYFILE "#logo a {\n";
print MYFILE "	display: block;\n";
print MYFILE "	width: 180px;\n";
print MYFILE "	height: 72px;\n";
print MYFILE "	text-decoration: none;\n";
print MYFILE "	text-indent: -9999px;\n";
print MYFILE "	background: url(login-logo.png);\n";
print MYFILE "	margin: 0 auto 1em auto;\n";
print MYFILE "}\n";

print MYFILE "h3 {\n";
print MYFILE "	margin: 1em 0;\n";
print MYFILE "	text-align: center;\n";
print MYFILE "	font-size: 0.8em;\n";
print MYFILE "	font-weight: normal;\n";
print MYFILE "	color: #d00;\n";
print MYFILE "}\n";

print MYFILE "form {\n";
print MYFILE "	width: 220px;\n";
print MYFILE "	margin: 0 auto;\n";
print MYFILE "	overflow: hidden;\n";
print MYFILE "}\n";

print MYFILE "fieldset {\n";
print MYFILE "	border: none;\n";
print MYFILE "	margin: 0;\n";
print MYFILE "	padding: 0;\n";
print MYFILE "}\n";

print MYFILE "fieldset input {\n";
print MYFILE "	display: block;\n";
print MYFILE "	width: 100%;\n";
print MYFILE "	margin-bottom: 1em;\n";
print MYFILE "	border: 1px solid #ccc;\n";
print MYFILE "	background: #fff;\n";
print MYFILE "	padding: 2px;\n";
print MYFILE "}\n";

print MYFILE "input.submit {\n";
print MYFILE "	display: inline-block;\n";
print MYFILE "	float: right;\n";
print MYFILE "	margin: 0;\n";
print MYFILE "	height: 24px;\n";
print MYFILE "	line-height: 24px;\n";
print MYFILE "	font-weight: bold;\n";
print MYFILE "	border: 1px solid #666666;\n";
print MYFILE "	padding: 0 12px;\n";
print MYFILE "	color: #3333;\n";
print MYFILE "}\n";

print MYFILE "#copyRights {\n";
print MYFILE "	font-size: 0.7em;\n";
print MYFILE "	color: #888;\n";
print MYFILE "	padding: 1em;\n";
print MYFILE "	text-align: center;\n";
print MYFILE "}\n";

print MYFILE "#copyRights a {\n";
print MYFILE "	color: #888;\n";
print MYFILE "}\n";





close (MYFILE);

}


1;







