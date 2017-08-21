package ViewShow;

sub CreateViewShow
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

################################################################################################
##################################### SETTINGS #################################################
################################################################################################
$modul_name_upper = MyModule::UpperCaseAll($modul_name);
$modul_name_upper_space = MyModule::UpperCaseAllSpace($modul_name);
open (MYFILE, ">$output_file");

################################################################################################
##################################### BEGIN ####################################################
################################################################################################
print MYFILE "<?php\n";
print MYFILE "echo '<div id=\"DefaultDiv\">';\n";
print MYFILE "echo '<form action=\"'.\$this->url->get().'${modul_name}/add\" method =\"post\">';\n";
print MYFILE "echo '<input type=\"submit\" name=\"submit\" value=\"Add ${modul_name_upper_space}\">';\n";
print MYFILE "echo '</form>';\n";
print MYFILE "echo '</div>';\n\n";
print MYFILE "echo '<div class=\"LabelSpace\"></div>';\n\n";

##PAGES BEGIN
print MYFILE "echo '<div id=\"DefaultDiv\">';\n";
print MYFILE "\$this->partial('${modul_name}/list', array('data_${modul_name}_list' => \$data_${modul_name}_list, 'page_current' => \$page_current, 'page_count' => \$page_count));\n";
print MYFILE "echo '</div>';\n";
##PAGES END

close (MYFILE);
}
1;







