package ViewList;

sub CreateViewList
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
open (MYFILE, ">$output_file");

################################################################################################
##################################### BEGIN ####################################################
################################################################################################
print MYFILE "<?php\n";
print MYFILE "echo '<div id=\"DefaultDiv\">';\n";
print MYFILE "if(empty(\$data_${modul_name}_list)){echo '${modul_name_upper} List Empty';}else{\n";
print MYFILE "\n";
print MYFILE "echo '<table class=\"DefaultListTable\">';\n";
print MYFILE "echo '<thead>';\n";
print MYFILE "echo '<tr>';\n";

##ERSETZUNG BEGIN 
@new_array = ();
foreach my $param (@param_list)
{
	
	$string_user_id = "${modul_name}_user_id";
	if($param  =~ /^$string_user_id/ )
	{
	$param = "${modul_name}_user_name";	
	}
	
	push(@new_array, $param);
	
}
##ERSETZUNG END 


foreach my $param (@new_array)
{
	$paramspace = MyModule::UpperCaseAllSpace($param);
	print MYFILE "echo '<th>${paramspace}</th>';\n";
}

print MYFILE "echo '<th>Action</th>';\n";
print MYFILE "echo '<th>Action</th>';\n";
print MYFILE "echo '</tr>';\n";
print MYFILE "echo '</thead>';\n";
print MYFILE "echo '<tbody>';\n";
print MYFILE "\n";

print MYFILE "foreach(\$data_${modul_name}_list AS \$row)\n";
print MYFILE "{\n";

print MYFILE "\$row['${modul_name}_time'] = date(\"Y.m.d H:i\", \$row['${modul_name}_time']);\n";
print MYFILE "echo '<tr>';\n";

foreach my $param (@new_array)
{
	print MYFILE "echo '<td>'.\$row['${param}'].'</td>';\n";
}


print MYFILE "echo '<td><a href=\"'.\$this->url->get().'${modul_name}/edit/'.\$row['${modul_name}_id'].'\">Edit</a></td>';\n";
print MYFILE "echo '<td><a href=\"'.\$this->url->get().'${modul_name}/delete/'.\$row['${modul_name}_id'].'\">Delete</a></td>';\n";


print MYFILE "echo '</tr>';\n";
print MYFILE "}\n";
print MYFILE "\n";
print MYFILE "echo '</tbody>';\n";
print MYFILE "echo '</table>';\n";

##PAGES BEGIN
print MYFILE "\n";
print MYFILE "//PAGES BEGIN\n";
print MYFILE "if(isset(\$page_count))\n";
print MYFILE "{\n";
print MYFILE "echo 'Page: ';\n";
print MYFILE "\$page_count = \$page_count+1;\n";
print MYFILE "for (\$i = 1; \$i < \$page_count; \$i++) {\n";
print MYFILE "if(\$page_current == \$i){echo ''.\$i.' ';}\n";
print MYFILE "else{echo '<a href=\"'.\$this->url->get().'${modul_name}/show/'.\$i.'\">'.\$i.'</a> ';}\n";
print MYFILE "}\n";
print MYFILE "}\n";
print MYFILE "//PAGES END\n";
print MYFILE "\n";
##PAGES END


print MYFILE "}\n";
print MYFILE "\n";
print MYFILE "echo '</div>';\n";

close (MYFILE);

}
1;







