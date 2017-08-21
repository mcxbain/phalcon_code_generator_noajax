package Api;

sub CreateApi
{
################################################################################################
##################################### MODUL SETUP ##############################################
################################################################################################
## Retrieve String
my $output_file = shift;

## Retrieve String
my $modul_name = shift;

## Retrieve String
my $table_name = shift;

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
print MYFILE "class ${modul_name_upper}Api{\n\n";

print MYFILE "public function __construct(){\n";
print MYFILE "\$config = new Phalcon\\Config\\Adapter\\Ini(\"../app/config/config.ini\");\n";
print MYFILE "\$database_host=\$config->database->database_host;\n";
print MYFILE "\$database_username=\$config->database->database_username;\n";
print MYFILE "\$database_password=\$config->database->database_password;\n";
print MYFILE "\$database_name=\$config->database->database_name;\n";
print MYFILE "\$connect=mysql_connect(\$database_host, \$database_username, \$database_password);\n";
print MYFILE "mysql_select_db(\$database_name, \$connect);\n";
print MYFILE "}\n\n";

print MYFILE "public function Check${modul_name_upper}ID(\$${modul_name}_id){\n";
print MYFILE "if(ctype_digit(\$${modul_name}_id)){\n";
print MYFILE "\$query = mysql_query(\"SELECT ${modul_name}_id FROM ${table_name} WHERE ${modul_name}_id='\".\$${modul_name}_id.\"'\");\n";
print MYFILE "if(mysql_num_rows(\$query) > 0){return true;}else{return false;}\n";
print MYFILE "}else{return false;}\n";
print MYFILE "}\n\n";

print MYFILE "public function Check${modul_name_upper}Input(\$string){\n";
print MYFILE "\$string_escape = mysql_real_escape_string(\$string);\n";
print MYFILE "return \$string_escape;\n";
print MYFILE "}\n\n";

print MYFILE "private function Get${modul_name_upper}Field(\$${modul_name}_id, \$field){\n";
print MYFILE "if(\$this->Check${modul_name_upper}ID(\$${modul_name}_id)){\n";
print MYFILE "\$field = \$this->Check${modul_name_upper}Input(\$field);\n";
print MYFILE "\$query = mysql_query(\"SELECT \$field FROM ${table_name} WHERE ${modul_name}_id='\".\$${modul_name}_id.\"'\");\n";
print MYFILE "if(mysql_num_rows(\$query) > 0){while(\$row = mysql_fetch_array(\$query, MYSQL_ASSOC)){\$string=\$row[\$field];}}\n";
print MYFILE "if(\$string){return \$string;}else{return false;}\n";
print MYFILE "}else{return false;}\n";
print MYFILE "}\n\n";

print MYFILE "private function Set${modul_name_upper}Field(\$${modul_name}_id, \$field, \$value){\n";
print MYFILE "if(\$this->Check${modul_name_upper}ID(\$${modul_name}_id)){\n";
print MYFILE "\$field = \$this->Check${modul_name_upper}Input(\$field);\n";
print MYFILE "\$value = \$this->Check${modul_name_upper}Input(\$value);\n";
print MYFILE "\$query = mysql_query(\"UPDATE ${table_name} SET \$field='\".\$value.\"' WHERE ${modul_name}_id='\".\$${modul_name}_id.\"'\");\n";
print MYFILE "if(\$query){return true;}else{return false;}\n";
print MYFILE "}else{return false;}\n";
print MYFILE "}\n\n";


################################################################################################
##################################### GETTA SETTA ##############################################
################################################################################################

@param_list2 = MyModule::RemoveElemetsFromArray1($modul_name, \@param_list);

foreach my $param (@param_list2)
{
	$paramupper = MyModule::UpperCaseAll($param);
	print MYFILE "public function Get${paramupper}(\$${modul_name}_id){\n";
	print MYFILE "\$result=\$this->Get${modul_name_upper}Field(\$${modul_name}_id, '${param}');\n";
	print MYFILE "if(\$result){return \$result;}else{return false;}\n";
	print MYFILE "}\n\n";
}

foreach my $param (@param_list2)
{
	$paramupper = MyModule::UpperCaseAll($param);
	print MYFILE "public function Set${paramupper}(\$${modul_name}_id, \$${param}){\n";
	print MYFILE "\$check=\$this->Set${modul_name_upper}Field(\$${modul_name}_id, '${param}', \$${param});\n";
	print MYFILE "if(\$check){return true;}else{return false;}\n";
	print MYFILE "}\n\n";
}

################################################################################################
##################################### ADD DELETE ###############################################
################################################################################################
print MYFILE "public function Add${modul_name_upper}(){\n";
print MYFILE "\$check = mysql_query(\"INSERT INTO ${table_name} VALUES ()\");\n";
print MYFILE "\$${modul_name}_id = mysql_insert_id();\n";
print MYFILE "\$${modul_name}_time = time();\n";
print MYFILE "\$this->Set${modul_name_upper}Time(\$${modul_name}_id, \$${modul_name}_time);\n";
print MYFILE "if(\$${modul_name}_id){return \$${modul_name}_id;}else{return false;}\n";
print MYFILE "}\n\n";

print MYFILE "public function Delete${modul_name_upper}(\$${modul_name}_id){\n";
print MYFILE "if(\$this->Check${modul_name_upper}Id(\$${modul_name}_id)){\n";
print MYFILE "\$query = mysql_query(\"DELETE FROM ${table_name} WHERE ${modul_name}_id='\".\$${modul_name}_id.\"'\");\n";
print MYFILE "if(\$query){return true;}else{return false;}\n";
print MYFILE "}else{return false;}\n";
print MYFILE "}\n\n";

################################################################################################
##################################### GET ID ###################################################
################################################################################################
print MYFILE "public function Get${modul_name_upper}IdWhere(\$field, \$var){\n";
print MYFILE "\$query = mysql_query(\"SELECT ${modul_name}_id FROM ${table_name} WHERE \$field='\".\$var.\"'\");\n";
print MYFILE "if(mysql_num_rows(\$query) > 0){while(\$row = mysql_fetch_array(\$query, MYSQL_ASSOC)){\$result = \$row['${modul_name}_id'];}\n";
print MYFILE "if(\$result){return \$result;}else{return false;}}else{return false;}\n";
print MYFILE "}\n\n";

print MYFILE "public function Get${modul_name_upper}IdWhereAndWhere(\$field1, \$var1, \$field2, \$var2){\n";
print MYFILE "\$query = mysql_query(\"SELECT ${modul_name}_id FROM ${table_name} WHERE \$field1='\".\$var1.\"' AND \$field2='\".\$var2.\"'\");\n";
print MYFILE "if(mysql_num_rows(\$query) > 0){while(\$row = mysql_fetch_array(\$query, MYSQL_ASSOC)){\$result = \$row['${modul_name}_id'];}\n";
print MYFILE "if(\$result){return \$result;}else{return false;}}else{return false;}\n";
print MYFILE "}\n\n";

print MYFILE "public function Get${modul_name_upper}IdWhereOrderBy(\$field1, \$var1, \$field2, \$var2){\n";
print MYFILE "\$query = mysql_query(\"SELECT ${modul_name}_id FROM ${table_name} WHERE \$field1='\".\$var1.\"' ORDER BY \$field2 \$var2\");\n";
print MYFILE "if(mysql_num_rows(\$query) > 0){while(\$row = mysql_fetch_array(\$query, MYSQL_ASSOC)){\$result = \$row['${modul_name}_id'];}\n";
print MYFILE "if(\$result){return \$result;}else{return false;}}else{return false;}\n";
print MYFILE "}\n\n";

################################################################################################
##################################### GET ID LIST ##############################################
################################################################################################
print MYFILE "public function Get${modul_name_upper}IdList(){\n";
print MYFILE "\$query = mysql_query(\"SELECT ${modul_name}_id FROM ${table_name} ORDER BY ${modul_name}_id DESC\");\n";
print MYFILE "if(mysql_num_rows(\$query) > 0){while(\$row = mysql_fetch_array(\$query, MYSQL_ASSOC)){\$data[]=\$row['${modul_name}_id'];}\n";
print MYFILE "if(\$data){return \$data;}else{return false;}\n";
print MYFILE "}else{return false;}\n";
print MYFILE "}\n\n";

print MYFILE "public function Get${modul_name_upper}IdListWhere(\$field, \$var){\n";
print MYFILE "\$query = mysql_query(\"SELECT ${modul_name}_id FROM ${table_name} WHERE \$field='\".\$var.\"'\");\n";
print MYFILE "if(mysql_num_rows(\$query) > 0){while(\$row = mysql_fetch_array(\$query, MYSQL_ASSOC)){\$data[]=\$row['${modul_name}_id'];}\n";
print MYFILE "if(\$data){return \$data;}else{return false;}}else{return false;}\n";
print MYFILE "}\n\n";

print MYFILE "public function Get${modul_name_upper}IdListWhereAndWhere(\$field1, \$var1, \$field2, \$var2){\n";
print MYFILE "\$query = mysql_query(\"SELECT ${modul_name}_id FROM ${table_name} WHERE \$field1='\".\$var1.\"' AND \$field2='\".\$var2.\"'\");\n";
print MYFILE "if(mysql_num_rows(\$query) > 0){while(\$row = mysql_fetch_array(\$query, MYSQL_ASSOC)){\$data[]=\$row['${modul_name}_id'];}\n";
print MYFILE "if(\$data){return \$data;}else{return false;}}else{return false;}\n";
print MYFILE "}\n\n";

print MYFILE "public function Get${modul_name_upper}IdListOrderBy(\$field, \$order){\n";
print MYFILE "\$query = mysql_query(\"SELECT ${modul_name}_id FROM ${table_name} ORDER BY \$field \$order\");\n";
print MYFILE "if(mysql_num_rows(\$query) > 0){while(\$row = mysql_fetch_array(\$query, MYSQL_ASSOC)){\$data[]=\$row['${modul_name}_id'];}\n";
print MYFILE "if(\$data){return \$data;}else{return false;}}else{return false;}\n";
print MYFILE "}\n\n";

print MYFILE "public function Get${modul_name_upper}IdListWhereOrderBy(\$field1, \$var1, \$field2, \$var2){\n";
print MYFILE "\$query = mysql_query(\"SELECT ${modul_name}_id FROM ${table_name} WHERE \$field1='\".\$var1.\"' ORDER BY \$field2 \$var2\");\n";
print MYFILE "if(mysql_num_rows(\$query) > 0){while(\$row = mysql_fetch_array(\$query, MYSQL_ASSOC)){\$data[]=\$row['${modul_name}_id'];}\n";
print MYFILE "if(\$data){return \$data;}else{return false;}}else{return false;}\n";
print MYFILE "}\n\n";

################################################################################################
##################################### SPECIAL ##################################################
################################################################################################
print MYFILE "public function Check${modul_name_upper}Field(\$field, \$var){\n";
print MYFILE "\$query = mysql_query(\"SELECT \$field FROM ${table_name} WHERE \$field='\".\$var.\"'\");\n";
print MYFILE "if(mysql_num_rows(\$query) > 0){return true;}else{return false;}\n";
print MYFILE "}\n\n";

print MYFILE "public function Execute${modul_name_upper}Query(\$sql_query){\n";
print MYFILE "\$query = mysql_query(\$sql_query);\n";
print MYFILE "if(mysql_num_rows(\$query) > 0){while(\$row = mysql_fetch_array(\$query, MYSQL_ASSOC)){\$result[] = \$row;}\n";
print MYFILE "if(\$result){return \$result;}else{return false;}}else{return false;}\n";
print MYFILE "}\n\n";

print MYFILE "}//end class\n\n";

################################################################################################
##################################### CREATE TABLE  ############################################
################################################################################################
print MYFILE "/*\n";
print MYFILE "CREATE TABLE IF NOT EXISTS ${table_name} (\n";
foreach my $param (@param_list)
{
$string = "${modul_name}_id";
if($param =~ /^$string$/ ){print MYFILE "${param} INT NOT NULL AUTO_INCREMENT ,\n";}else{print MYFILE "${param} MEDIUMTEXT NOT NULL ,\n";}
}
print MYFILE "PRIMARY KEY (${modul_name}_id)) ENGINE=MYISAM AUTO_INCREMENT=100000;\n";
print MYFILE "*/\n";
print MYFILE "\n";

}
1;





