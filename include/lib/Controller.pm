package Controller;

sub CreateController
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
print MYFILE "class ${modul_name_upper}Controller extends Phalcon\\Mvc\\Controller\n";
print MYFILE "{\n";
print MYFILE "\n";

print MYFILE "public function initialize()\n";
print MYFILE "{\n";
print MYFILE "//initialize\n";
print MYFILE "}\n";
print MYFILE "\n";

################################################################################################
##################################### ACTION INDEX #############################################
################################################################################################
print MYFILE "public function indexAction()\n";
print MYFILE "{\n";
print MYFILE "//index\n";
print MYFILE "}\n";
print MYFILE "\n";


################################################################################################
##################################### ACTION SHOW LIMIT ########################################
################################################################################################
print MYFILE "public function showAction()\n";
print MYFILE "{\n";

print MYFILE "\$page = \$this->dispatcher->getParam(0);\n";
print MYFILE "if(isset(\$page)){\$page = \$page;}else{\$page='1'; \$start = '0';}\n\n";

print MYFILE "\$limit = '25';\n";
print MYFILE "\$start = (\$limit*\$page)-\$limit;\n\n";
		
print MYFILE "\$data_${modul_name}_list = ${modul_name_upper}Model::Get${modul_name_upper}ListLimit(\$start, \$limit);\n";
print MYFILE "\$page_count = ${modul_name_upper}Model::Get${modul_name_upper}PageCount(\$limit);\n\n";
		
print MYFILE "\$this->view->setParamToView('page_current', \$page);\n";
print MYFILE "\$this->view->setParamToView('page_count', \$page_count);\n\n";
		
print MYFILE "\$this->view->setParamToView('data_${modul_name}_list', \$data_${modul_name}_list);\n";
print MYFILE "\$this->view->pick('${modul_name}/show');\n";

print MYFILE "}\n";
print MYFILE "\n";


################################################################################################
##################################### ACTION ADD ###############################################
################################################################################################
print MYFILE "public function addAction()\n";
print MYFILE "{\n";
print MYFILE "\$this->view->pick('${modul_name}/add');\n";
print MYFILE "}\n";
print MYFILE "\n";

################################################################################################
##################################### ACTION ADD SAVE ##########################################
################################################################################################
print MYFILE "public function addsaveAction()\n";
print MYFILE "{\n";
print MYFILE "if(\$this->request->getPost('submit'))\n";
print MYFILE "{\n";
print MYFILE "\$data_${modul_name} = \$this->request->getPost();\n";
print MYFILE "\n";
print MYFILE "\$check = true;\n";


@param_list2 = MyModule::RemoveElemetsFromArray3($modul_name, \@param_list);

foreach my $param (@param_list2)
{
	$paramupper = MyModule::UpperCaseAll($param);
	print MYFILE "if(!${modul_name_upper}Model::Check${paramupper}(\$data_${modul_name}['${param}'])){\$data_${modul_name}['${param}_false']=1;\$check=false;}";
	print MYFILE "\n";
}


print MYFILE "\n";
print MYFILE "if(\$check)\n";
print MYFILE "{\n";
print MYFILE "${modul_name_upper}Model::Add${modul_name_upper}(\$data_${modul_name});\n";
print MYFILE "\$this->response->redirect('/${modul_name}/show');\n";
print MYFILE "}\n";
print MYFILE "else\n";
print MYFILE "{\n";
print MYFILE "\$this->view->setParamToView('data_${modul_name}', \$data_${modul_name});\n";
print MYFILE "\$this->view->pick('${modul_name}/add');\n";
print MYFILE "}\n";

print MYFILE "}\n";
print MYFILE "else\n";
print MYFILE "{\n";
print MYFILE "\$this->response->redirect('/${modul_name}/show');\n";
print MYFILE "}\n";
print MYFILE "}\n";
print MYFILE "\n";


################################################################################################
##################################### ACTION DELETE ############################################
################################################################################################
print MYFILE "public function deleteAction()\n";
print MYFILE "{\n";
print MYFILE "\$${modul_name}_id = \$this->dispatcher->getParam(0);\n";
print MYFILE "\$data_${modul_name} = ${modul_name_upper}Model::Get${modul_name_upper}(\$${modul_name}_id);\n";
print MYFILE "\$this->view->setParamToView('data_${modul_name}', \$data_${modul_name});\n";
print MYFILE "\$this->view->pick('${modul_name}/delete');\n";
print MYFILE "\n";
print MYFILE "}\n";
print MYFILE "\n";

################################################################################################
##################################### ACTION DELETE SAVE #######################################
################################################################################################
print MYFILE "public function deletesaveAction()\n";
print MYFILE "{\n";
print MYFILE "if(\$this->request->getPost('submit'))\n";
print MYFILE "{\n";
print MYFILE "\$${modul_name}_id = \$this->dispatcher->getParam(0);\n";
print MYFILE "\n";
print MYFILE "\$check = true;\n";
print MYFILE "if(!${modul_name_upper}Model::Check${modul_name_upper}Id(\$${modul_name}_id)){\$check=false;}\n";
print MYFILE "\n";
print MYFILE "if(\$check)\n";
print MYFILE "{\n";
print MYFILE "${modul_name_upper}Model::Delete${modul_name_upper}(\$${modul_name}_id);\n";
print MYFILE "\$this->response->redirect('/${modul_name}/show');\n";
print MYFILE "}\n";
print MYFILE "else\n";
print MYFILE "{\n";
print MYFILE "\$this->view->setParamToView('text', '${modul_name_upper} ID Invalid');\n";
print MYFILE "\$this->view->pick('default/fail');\n";
print MYFILE "}\n";
print MYFILE "}\n";
print MYFILE "else\n";
print MYFILE "{\n";
print MYFILE "\$this->response->redirect('/${modul_name}/show');\n";
print MYFILE "}\n";
print MYFILE "}\n";
print MYFILE "\n";


################################################################################################
##################################### ACTION EDIT ##############################################
################################################################################################
print MYFILE "public function editAction()\n";
print MYFILE "{\n";
print MYFILE "\$${modul_name}_id = \$this->dispatcher->getParam(0);\n";
print MYFILE "\$data_${modul_name} = ${modul_name_upper}Model::Get${modul_name_upper}(\$${modul_name}_id);\n";
print MYFILE "\$this->view->setParamToView('data_${modul_name}', \$data_${modul_name});\n";
print MYFILE "\$this->view->pick('${modul_name}/edit');\n";
print MYFILE "}\n";
print MYFILE "\n";

################################################################################################
##################################### ACTION EDIT SAVE #########################################
################################################################################################
print MYFILE "public function editsaveAction()\n";
print MYFILE "{\n";
print MYFILE "if(\$this->request->getPost('submit'))\n";
print MYFILE "{\n";
print MYFILE "\$${modul_name}_id = \$this->dispatcher->getParam(0);\n";
print MYFILE "\$data_${modul_name} = \$this->request->getPost();\n";
print MYFILE "\$data_${modul_name}['${modul_name}_id'] = \$${modul_name}_id;\n";
print MYFILE "\n";
print MYFILE "\$check = true;\n";

@param_list2 = MyModule::RemoveElemetsFromArray3($modul_name, \@param_list);

foreach my $param (@param_list2)
{
	$paramupper = MyModule::UpperCaseAll($param);
	print MYFILE "if(!${modul_name_upper}Model::Check${paramupper}(\$data_${modul_name}['${param}'])){\$data_${modul_name}['${param}_false']=1;\$check=false;}";
	print MYFILE "\n";
}

print MYFILE "\n";
print MYFILE "if(\$check)\n";
print MYFILE "{\n";
print MYFILE "${modul_name_upper}Model::Update${modul_name_upper}(\$${modul_name}_id, \$data_${modul_name});\n";
print MYFILE "\$this->response->redirect('/${modul_name}/show');\n";
print MYFILE "}\n";
print MYFILE "else\n";
print MYFILE "{\n";
print MYFILE "\$data_${modul_name}_list = ${modul_name_upper}Model::Get${modul_name_upper}List();\n";
print MYFILE "\$this->view->setParamToView('data_${modul_name}_list', \$data_${modul_name}_list);\n";
print MYFILE "\$this->view->setParamToView('data_${modul_name}', \$data_${modul_name});\n";
print MYFILE "\$this->view->pick('${modul_name}/edit');\n";
print MYFILE "}\n";
print MYFILE "}\n";
print MYFILE "else\n";
print MYFILE "{\n";
print MYFILE "\$this->response->redirect('/${modul_name}/show');\n";
print MYFILE "}\n";
print MYFILE "}\n";
print MYFILE "\n";

################################################################################################
##################################### CLASS END ################################################
################################################################################################
print MYFILE "\n";
print MYFILE "}//end class\n";

close (MYFILE);

}
1;

