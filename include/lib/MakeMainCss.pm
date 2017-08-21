package MakeMainCss;

sub MakeMainCss
{
my $output_file = shift;

open (MYFILE, ">$output_file");
print MYFILE "/*******************************************************\n";
print MYFILE "CENTER CSS\n";
print MYFILE "*******************************************************/\n";

my $message = <<'END_MESSAGE';
body {
	text-align: center; /* Zentrierung IE */
	background: none repeat scroll 0 0 #eee;
	font-family: arial, helvetica, sans-serif;
	font-size: 10pt;
	color: #000;
	margin: 0;
	padding: 0;
}

#logo {
	border: 1px solid #AAA;
	background: none repeat scroll 0 0 #FAFAFA;
	text-align: left; /* Inhalt wieder links */
	margin: 0 auto; /* Zentrierung mitte */
	width: 1100px;
	padding-left: 10px;
	padding-right: 10px;
	padding-top: 10px;
	padding-bottom: 8px;
	border-bottom: 0px solid #AAA;

}

#content {
	border-bottom: 1px solid #AAA;
	border-left: 1px solid #AAA;
	border-right: 1px solid #AAA;
	background: none repeat scroll 0 0 #FAFAFA;
	text-align: left; /* Inhalt wieder links */
	margin: 0 auto; /* Zentrierung mitte */
	width: 1100px;
	padding-bottom: 100%;
	padding-left: 10px;
	padding-right: 10px;
	padding-top: 25px;
}


#logout {
	text-align: right;
	padding-left: 25px;
	display: inline;
	float: right;
	margin-right: 15px;
}

/*******************************************************
Styles for the Custom section
*******************************************************/

.CustomButton {
	-moz-user-select: none;
	background-color: rgba(0, 0, 0, 0.02);
	border: medium none;
	border-radius: 3px;
	box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.25) inset;
	box-sizing: content-box;
	color: #555;
	cursor: pointer;
	display: inline-block;
	font-family: inherit;
	font-size: 0.95em;
	font-weight: normal;
	height: 22px;
	line-height: 22px;
	padding: 2px 11px;
	transition: opacity 0.1s ease 0s, background-color 0.1s ease 0s,
		box-shadow 0.1s ease 0s, color 0.1s ease 0s, background 0.1s ease 0s;
	vertical-align: bottom;
	text-decoration: none;
}

.CustomLink {
	color: #01a4ec;
	text-decoration: none;
}

a {
	color: #01a4ec;
	text-decoration: none;
}

.LabelSpace {
	padding-top: 8px;
}

input {
	border: 1px solid #AAAAAA;
	padding: 2px;
}

select {
	border: 1px solid #AAAAAA;
	padding: 2px;
}

.Label {
	padding-bottom: 2px;
}

textarea {
	border: 1px solid #AAAAAA;
	padding: 2px;
}

.input_red {
	border: 1px solid #FF0000;
	padding: 2px;
}


/*******************************************************
Styles for the Menu section
*******************************************************/

#menu { /*border: 1px solid #AAA;*/
	/*border-bottom: 0px solid #AAA;*/
	/*background: none repeat scroll 0 0 #499abc;*/
	text-align: left; /* Inhalt wieder links */
	margin: 0 auto; /* Zentrierung mitte */
	width: 1100px;
	padding-bottom: 6px;
	padding-left: 10px;
	padding-right: 10px;
	padding-top: 10px;
	height: 20px;
	background: #dbdbdb none repeat scroll 0 0;
	border-bottom: 1px solid #AAA;
	border-top: 1px solid #AAA;
	border-right: 1px solid #AAA;
	border-left: 1px solid #AAA;
	z-index: 200;
}

#menu_button {
	float: left;
	display: inline;
}

a.menu_button {
	float: left;
	display: inline;
	color: #000;
	font-size: 25px;
}

#menu ul {
	list-style-type: none;
	padding: 0;
	margin: 0;
}

#menu li {
	display: inline;
}

#menu li a {
	border-right: 1px solid black;
    display: inline;
    padding: 0 15px;
    color:#666666;
    font-size: 13px;
}

#menu li a:hover {
	border-right: 1px solid black;
    display: inline;
    padding: 0 15px;
}

#menu li.selected a {
	border-right: 1px solid black;
    display: inline;
    padding: 0 15px;
    color:#000;
}

#logout {
	text-align: right;
	padding-left: 25px;
	display: inline;
	float: right;
	margin-right: 15px;
}



/*******************************************************
Styles for the Table section
*******************************************************/

table.DefaultListTable 
{
	font-family: arial, helvetica, sans-serif;
	font-weight: normal;
	font-size: 12px;
	color: #333333;
	border-width: 1px;
	border-color: #666666;
	border-collapse: collapse;
}

table.DefaultListTable  th 
{
	border-width: 1px;
	padding: 5px;
	border-style: solid;
	border-color: #666666;
	background-color: #dedede;
	white-space:nowrap;
}

table.DefaultListTable  td 
{
	border-width: 1px;
	padding: 4px;
	border-style: solid;
	border-color: #666666;	 
}


END_MESSAGE

print MYFILE "${message}";




close (MYFILE);

}


1;







