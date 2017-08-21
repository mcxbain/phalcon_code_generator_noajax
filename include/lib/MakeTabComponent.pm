package MakeTabComponent;

sub MakeTabComponent
{
################################################################################################
##################################### MODUL SETUP ##############################################
################################################################################################

## Retrieve String
my $output_file = shift;

## Retrieve list reference 
my $modul_list = shift;

## De-reference the list's scalar 
my @modul_list = @{$modul_list};

################################################################################################
##################################### SETTINGS #################################################
################################################################################################
open (MYFILE, ">>$output_file");


################################################################################################
##################################### BEGIN ####################################################
################################################################################################
print MYFILE "<?php\n";
print MYFILE "use Phalcon\\Mvc\\User\\Plugin;\n";
print MYFILE "use Phalcon\\Mvc\\Dispatcher;\n\n";

print MYFILE "class TabComponent extends Plugin\n";
print MYFILE "{\n\n";

################################################################################################
##################################### GetMenu ##################################################
################################################################################################
print MYFILE "	public function GetMenu()\n";
print MYFILE "	{\n\n";
print MYFILE "		\$controller = \$this->dispatcher->getControllerName();\n\n";

foreach my $modul_name (@modul_list)
{
print MYFILE "		\$selector_${modul_name} = '';\n";
}
print MYFILE "		\$selector_logout = '';\n\n";


foreach my $modul_name (@modul_list)
{
print MYFILE "		if(\$controller == '${modul_name}'){\$selector_${modul_name} = 'class=\"selected\"';}\n";
}
print MYFILE "		if(\$controller == 'auth'){\$selector_logout = 'class=\"selected\"';}\n\n";


foreach my $modul_name (@modul_list)
{
$modul_name_upper = MyModule::UpperCaseAll($modul_name);
print MYFILE "		echo '<li '.\$selector_${modul_name}.'><a href=\"'.\$this->url->get().'${modul_name}/show\">${modul_name_upper} Show</a></li>';\n";
}

print MYFILE "		echo '<div id=\"logout\"><a href=\"'.\$this->url->get().'auth/logout\" style=\"color:#666666\">Logout</a></div>';\n";


print MYFILE "	}\n\n";
print MYFILE "}//end class\n";

close (MYFILE);

}


1;







