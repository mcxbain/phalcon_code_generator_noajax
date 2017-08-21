package ViewEdit;

sub CreateViewEdit
{
################################################################################################
##################################### MODUL SETUP ##############################################
################################################################################################
## Retrieve String
my $output_file = shift;

## Retrieve String
my $modul_name = shift;

## Retrieve list reference 
my $param_list = shift;

## De-reference the list's scalar 
my @param_list = @{$param_list};

## Retrieve String
my $ajax_flag = shift;

################################################################################################
##################################### SETTINGS #################################################
################################################################################################
$modul_name_upper = MyModule::UpperCaseAll($modul_name);
open (MYFILE, ">$output_file");

################################################################################################
##################################### BEGIN ####################################################
################################################################################################
print MYFILE "<?php\n";
print MYFILE "echo '<div id=\"DefaultDiv\">';\n";
print MYFILE "echo '<form action=\"'.\$this->url->get().'${modul_name}/editsave/'.\$data_${modul_name}['${modul_name}_id'].'\" method=\"post\">';\n";
print MYFILE "\n";

@param_list2 = MyModule::RemoveElemetsFromArray3($modul_name, \@param_list);

foreach my $param (@param_list2)
{
	$paramupper = MyModule::UpperCaseAll($param);
	$paramspace = MyModule::UpperCaseAllSpace($param);
	$paramspacelast = MyModule::UpperCaseAllSpaceCut($param);

	print MYFILE "//${paramspace}\n";
	print MYFILE "echo '<div class=\"Label\">${paramspace}';\n";
	print MYFILE "if(!isset(\$data_${modul_name}['${param}'])){\$data_${modul_name}['${param}']='';}\n";
	print MYFILE "if(isset(\$data_${modul_name}['${param}_false'])){echo '<font color=\"red\"> *${paramspacelast}</font>';}\n";
	print MYFILE "echo '</div>';\n";
	print MYFILE "echo '<input name=\"${param}\" type=\"text\" size=\"50\" value=\"'.\$data_${modul_name}['${param}'].'\" /> ';\n";
	print MYFILE "echo '<div class=\"LabelSpace\"></div>';\n";
	print MYFILE "\n";
}

print MYFILE "echo '<br>';\n";
print MYFILE "echo '<input type=\"submit\" name=\"submit\" value=\"Save\">';\n";
print MYFILE "echo '&nbsp;&nbsp;';\n";
print MYFILE "echo '<input type=\"submit\" name=\"cancel\" value=\"Cancel\">';\n";
print MYFILE "echo '</form>';\n";
print MYFILE "echo '</div>';\n";

close (MYFILE);

}
1;







