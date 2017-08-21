package Model;

sub CreateModel
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
##################################### CLASS BEGIN ##############################################
################################################################################################
print MYFILE "<?php\n";
print MYFILE "include_once('../app/api/${modul_name}/${modul_name}_api.php');\n";
print MYFILE "class ${modul_name_upper}Model extends Phalcon\\Mvc\\Model\n";
print MYFILE "{\n";
print MYFILE "\n";


################################################################################################
##################################### GET DATA #################################################
################################################################################################
print MYFILE "public function Get${modul_name_upper}(\$${modul_name}_id)\n";
print MYFILE "{\n";
print MYFILE "\$${modul_name_upper}Api = new ${modul_name_upper}Api();\n";
print MYFILE "if(\$${modul_name_upper}Api->Check${modul_name_upper}ID(\$${modul_name}_id))\n";
print MYFILE "{\n";
print MYFILE "\$data['${modul_name}_id'] = \$${modul_name}_id;\n";


@param_list2 = MyModule::RemoveElemetsFromArray1($modul_name, \@param_list);

foreach my $param (@param_list2)
{
	$paramupper = MyModule::UpperCaseAll($param);
	print MYFILE "\$data['${param}'] = \$${modul_name_upper}Api->Get${paramupper}(\$${modul_name}_id);\n";
}

print MYFILE "\$data['${modul_name}_user_name'] = AuthModel::GetUserNameFromUserId(\$data['${modul_name}_user_id']);\n";

print MYFILE "return \$data;\n";
print MYFILE "}else{return false;}\n";
print MYFILE "}\n";
print MYFILE "\n";


################################################################################################
##################################### GET DATA LIST ############################################
################################################################################################
print MYFILE "public function Get${modul_name_upper}List()\n";
print MYFILE "{\n";
print MYFILE "\$${modul_name_upper}Api = new ${modul_name_upper}Api();\n";
print MYFILE "\$idlist = \$${modul_name_upper}Api->Get${modul_name_upper}IdList();\n";
print MYFILE "if(\$idlist){foreach(\$idlist as \$${modul_name}_id){\$data[] = ${modul_name_upper}Model::Get${modul_name_upper}(\$${modul_name}_id);}\n";
print MYFILE "if(\$data){return \$data;}else{return false;}}else{return false;}\n";
print MYFILE "}\n";
print MYFILE "\n";


################################################################################################
##################################### GET DATA LIST LIMIT ######################################
################################################################################################
print MYFILE "public function Get${modul_name_upper}ListLimit(\$begin, \$number_of_entrys)\n";
print MYFILE "{\n";
print MYFILE "\$${modul_name_upper}Api = new ${modul_name_upper}Api();\n";
print MYFILE "\$idlist = \$${modul_name_upper}Api->Get${modul_name_upper}IdListOrderBy('${modul_name}_id', 'DESC');\n";
print MYFILE "\$idlist2 = array_slice(\$idlist,\$begin,\$number_of_entrys);\n";
print MYFILE "if(\$idlist2){foreach(\$idlist2 as \$${modul_name}_id){\$data[] = ${modul_name_upper}Model::Get${modul_name_upper}(\$${modul_name}_id);}\n";
print MYFILE "if(\$data){return \$data;}else{return false;}}else{return false;}\n";
print MYFILE "}\n";
print MYFILE "\n";


print MYFILE "public function Get${modul_name_upper}PageCount(\$entrys_per_page)\n";
print MYFILE "{\n";
print MYFILE "\$${modul_name_upper}Api = new ${modul_name_upper}Api();\n";
print MYFILE "\$idlist = \$${modul_name_upper}Api->Get${modul_name_upper}IdListOrderBy('${modul_name}_id', 'DESC');\n";
print MYFILE "\$count = ceil(count(\$idlist) / \$entrys_per_page);\n";
print MYFILE "if(\$count){return \$count;}else{return false;}\n";
print MYFILE "}\n";
print MYFILE "\n";

################################################################################################
##################################### ADD DATA #################################################
################################################################################################
print MYFILE "public function Add${modul_name_upper}(\$data_${modul_name})\n";
print MYFILE "{\n";
print MYFILE "\$${modul_name_upper}Api = new ${modul_name_upper}Api();\n";
print MYFILE "\$${modul_name}_id = \$${modul_name_upper}Api->Add${modul_name_upper}();\n";

print MYFILE "\$user_id = AuthModel::GetCurrentUserId();\n";
print MYFILE "\$${modul_name_upper}Api->Set${modul_name_upper}UserId(\$${modul_name}_id, \$user_id);\n";

@param_list2 = MyModule::RemoveElemetsFromArray3($modul_name, \@param_list);

foreach my $param (@param_list2)
{
	$paramupper = MyModule::UpperCaseAll($param);
	print MYFILE "\$${modul_name_upper}Api->Set${paramupper}(\$${modul_name}_id, \$data_${modul_name}['${param}']);\n";
}

print MYFILE "if(\$${modul_name}_id){return \$${modul_name}_id;}else{return false;}\n";
print MYFILE "}\n";
print MYFILE "\n";


################################################################################################
##################################### UPDATE DATA ##############################################
################################################################################################
print MYFILE "public function Update${modul_name_upper}(\$${modul_name}_id, \$data_${modul_name})\n";
print MYFILE "{\n";
print MYFILE "\$${modul_name_upper}Api = new ${modul_name_upper}Api();\n";

@param_list2 = MyModule::RemoveElemetsFromArray3($modul_name, \@param_list);

foreach my $param (@param_list2)
{
	$paramupper = MyModule::UpperCaseAll($param);
	print MYFILE "\$${modul_name_upper}Api->Set${paramupper}(\$${modul_name}_id, \$data_${modul_name}['${param}']);\n";
}

print MYFILE "}\n";
print MYFILE "\n";


################################################################################################
##################################### DELETE DATA ##############################################
################################################################################################
print MYFILE "public function Delete${modul_name_upper}(\$${modul_name}_id)\n";
print MYFILE "{\n";
print MYFILE "\$${modul_name_upper}Api = new ${modul_name_upper}Api();\n";
print MYFILE "\$check = \$${modul_name_upper}Api->Delete${modul_name_upper}(\$${modul_name}_id);\n";
print MYFILE "if(\$check){return true;}else{return false;}\n";
print MYFILE "}\n";
print MYFILE "\n";


################################################################################################
##################################### CHECK DATA ###############################################
################################################################################################
print MYFILE "public function Check${modul_name_upper}Id(\$string)\n";
print MYFILE "{\n";
print MYFILE "\$${modul_name_upper}Api = new ${modul_name_upper}Api();\n";
print MYFILE "if(\$${modul_name_upper}Api->Check${modul_name_upper}ID(\$string)){return true;}else{return false;}\n";
print MYFILE "}\n";
print MYFILE "\n";

@param_list2 = MyModule::RemoveElemetsFromArray3($modul_name, \@param_list);

foreach my $param (@param_list2)
{
	$paramupper = MyModule::UpperCaseAll($param);
	print MYFILE "public function Check${paramupper}(\$string)\n";
	print MYFILE "{\n";
	print MYFILE "if(empty(\$string)){return false;}else{return true;}\n";
	print MYFILE "}\n";
	print MYFILE "\n";
}


################################################################################################
##################################### CLASS END ################################################
################################################################################################
print MYFILE "\n";
print MYFILE "}//end class\n";

close (MYFILE);

}
1;

