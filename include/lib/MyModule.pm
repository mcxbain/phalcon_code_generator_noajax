package MyModule;

sub UpperCaseAll
{
	## Retrieve String
	my $string = shift; 

	## Manipulate String
	@splitt_words = ();
	@new_array = ();
	@splitt_words = split /_/, $string;
	foreach my $row23 (@splitt_words){push(@new_array, ucfirst($row23));}
	$new_string = join('', @new_array);

	## Return String
	return $new_string;
}

sub UpperCaseAllSpace
{
	## Retrieve String
	my $string = shift; 

	## Manipulate String
	@splitt_words = ();
	@new_array = ();
	@splitt_words = split /_/, $string;
	foreach my $row23 (@splitt_words){push(@new_array, ucfirst($row23));}
	$new_string = join(' ', @new_array);

	## Return String
	return $new_string;
}

sub UpperCaseAllSpaceCut
{
	## Retrieve String
	my $string = shift; 

	## Manipulate String
	@splitt_words = ();
	@new_array = ();
	@splitt_words = split /_/, $string;
	foreach my $row23 (@splitt_words){push(@new_array, ucfirst($row23));}
	shift @new_array;
	$new_string = join(' ', @new_array);

	## Return String
	return $new_string;
}



sub RemoveElemetsFromArray1
{

	## Retrieve String
	my $string = shift; 

    	## Retrieve list reference 
    	my $refList = shift;

   	## De-reference the list's scalar 
    	my @list = @{$refList};

	## Built new Array
	@new_array = ();

	foreach my $row (@list)
	{
	$check = "true";

	$string_id = "${string}_id";

	if($row  =~ /^$string_id/ ){$check="false";}

		if($check eq "true")
		{
		push(@new_array, $row);
		}
	}

	return @new_array;
}

sub RemoveElemetsFromArray3
{

	## Retrieve String
	my $string = shift; 

    	## Retrieve list reference 
    	my $refList = shift;

   	## De-reference the list's scalar 
    	my @list = @{$refList};

	## Built new Array
	@new_array = ();

	foreach my $row (@list)
	{
	$check = "true";

	$string_id = "${string}_id";
	$string_time = "${string}_time";
	$string_user_id = "${string}_user_id";

	if($row  =~ /^$string_id/ ){$check="false";}
	if($row  =~ /^$string_time/ ){$check="false";}
	if($row  =~ /^$string_user_id/ ){$check="false";}

		if($check eq "true")
		{
		push(@new_array, $row);
		}
	}

	return @new_array;

}

sub CreateOutput
{
	## Retrieve String
	my $string = shift; 
	
	## Open Output
	open (STDOUT, '>', "$string");
}

sub CreateDirectory
{
	## Retrieve String
	my $string = shift; 

	## Manipulate String
	unless (-d $string){mkdir($string)}
}

sub DeleteDirectory
{
	## Retrieve String
	my $string = shift; 

	## Manipulate String
	if (-d "${string}") 
	{
	$delete_folder = "rm -r -f ${string}";
    system($delete_folder);
	}
}

sub DeleteFile
{
	## Retrieve String
	my $string = shift; 

	unlink $string;
}

sub CreateApiDirectory
{
	## Retrieve String
	my $project_path = shift; 

	## Retrieve String
	my $modul_name = shift;
	
	$api_dir = "${project_path}app/api/${modul_name}";
	MyModule::CreateDirectory($api_dir);
}

sub CreateViewDirectory
{
	## Retrieve String
	my $project_path = shift; 

	## Retrieve String
	my $modul_name = shift;
	
	$api_dir = "${project_path}app/view/${modul_name}";
	MyModule::CreateDirectory($api_dir);
}


################################################################################################
##################################### CREATE EXTEND ############################################
################################################################################################

sub CreateApiExtend
{
	## Retrieve String
	my $project_path = shift; 
	
	## Retrieve String
	my $project_name = shift; 

	## Retrieve String
	my $modul_name = shift;

	## Retrieve list reference 
	my $param_list = shift;

	## De-reference the list's scalar 
	my @param_list = @{$param_list};

	MyModule::CreateApiDirectory($project_path, $modul_name);
	$table_name = "${project_name}_${modul_name}";
	$output_file = "${project_path}app/api/${modul_name}/${modul_name}_api.php";
	Api::CreateApi($output_file, $modul_name, $table_name, \@param_list);

}

sub CreateModelExtend
{
	## Retrieve String
	my $project_path = shift; 

	## Retrieve String
	my $modul_name = shift;

	## Retrieve list reference 
	my $param_list = shift;

	## De-reference the list's scalar 
	my @param_list = @{$param_list};

	$modul_name_upper = MyModule::UpperCaseAll($modul_name);
	$output_file = "${project_path}app/model/${modul_name_upper}Model.php";
	Model::CreateModel($output_file, $modul_name, \@param_list);

}


sub CreateControllerExtend
{
	## Retrieve String
	my $project_path = shift; 

	## Retrieve String
	my $modul_name = shift;

	## Retrieve list reference 
	my $param_list = shift;

	## De-reference the list's scalar 
	my @param_list = @{$param_list};

	$modul_name_upper = MyModule::UpperCaseAll($modul_name);
	$output_file = "${project_path}app/controller/${modul_name_upper}Controller.php";
	Controller::CreateController($output_file, $modul_name, \@param_list);

}

sub CreateViewAddExtend
{
	## Retrieve String
	my $project_path = shift; 

	## Retrieve String
	my $modul_name = shift;

	## Retrieve list reference 
	my $param_list = shift;

	## De-reference the list's scalar 
	my @param_list = @{$param_list};

	MyModule::CreateViewDirectory($project_path, $modul_name);
	$output_file = "${project_path}app/view/${modul_name}/add.phtml";
	ViewAdd::CreateViewAdd($output_file, $modul_name, \@param_list);

}

sub CreateViewEditExtend
{
	## Retrieve String
	my $project_path = shift; 

	## Retrieve String
	my $modul_name = shift;

	## Retrieve list reference 
	my $param_list = shift;

	## De-reference the list's scalar 
	my @param_list = @{$param_list};

	MyModule::CreateViewDirectory($project_path, $modul_name);
	$output_file = "${project_path}app/view/${modul_name}/edit.phtml";
	ViewEdit::CreateViewEdit($output_file, $modul_name, \@param_list);

}

sub CreateViewDeleteExtend
{
	## Retrieve String
	my $project_path = shift; 

	## Retrieve String
	my $modul_name = shift;

	## Retrieve list reference 
	my $param_list = shift;

	## De-reference the list's scalar 
	my @param_list = @{$param_list};

	MyModule::CreateViewDirectory($project_path, $modul_name);
	$output_file = "${project_path}app/view/${modul_name}/delete.phtml";
	ViewDelete::CreateViewDelete($output_file, $modul_name, \@param_list);

}

sub CreateViewListExtend
{
	## Retrieve String
	my $project_path = shift; 

	## Retrieve String
	my $modul_name = shift;

	## Retrieve list reference 
	my $param_list = shift;

	## De-reference the list's scalar 
	my @param_list = @{$param_list};

	MyModule::CreateViewDirectory($project_path, $modul_name);
	$output_file = "${project_path}app/view/${modul_name}/list.phtml";
	ViewList::CreateViewList($output_file, $modul_name, \@param_list);

}


sub CreateViewShowExtend
{
	## Retrieve String
	my $project_path = shift; 

	## Retrieve String
	my $modul_name = shift;

	## Retrieve list reference 
	my $param_list = shift;

	## De-reference the list's scalar 
	my @param_list = @{$param_list};


	MyModule::CreateViewDirectory($project_path, $modul_name);
	$output_file = "${project_path}app/view/${modul_name}/show.phtml";
	ViewShow::CreateViewShow($output_file, $modul_name, \@param_list);

}



sub CreateCssExtend
{
	## Retrieve String
	my $project_path = shift; 

	## Retrieve String
	my $modul_name = shift;

	## Retrieve list reference 
	my $param_list = shift;

	## De-reference the list's scalar 
	my @param_list = @{$param_list};

	$css_dir = "${project_path}public/css/modul";
	MyModule::CreateDirectory($css_dir);
	$modul_name_upper = UpperCaseAll($modul_name);
	$output_file = "${project_path}public/css/modul/${modul_name_upper}Controller.css";
	GenerateCss::CreateCss($output_file, $modul_name, \@param_list);
	

}


sub CreateSqlInsertExtend
{
	## Retrieve String
	my $project_path = shift; 
	
	## Retrieve String
	my $project_name = shift; 

	## Retrieve String
	my $modul_name = shift;

	## Retrieve list reference 
	my $param_list = shift;

	## De-reference the list's scalar 
	my @param_list = @{$param_list};

	$table_name = "${project_name}_${modul_name}";
	$output_file = "${project_path}app/api/${modul_name}/${modul_name}_insert.php";
	GenerateSqlInsert::CreateSqlInsert($output_file, $modul_name, $table_name, \@param_list);
	

}


################################################################################################
##################################### EXTEND END ###############################################
################################################################################################


1;
