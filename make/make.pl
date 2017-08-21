#!/usr/bin/perl
do "../config/config.pl";
@modul_list = GetModulList::GetModulList("${generator_path}modul/");

############# Delete Directorys #####################################
print "deleting directorys\n";
MyModule::DeleteDirectory("${data_path}");
MyModule::DeleteDirectory("${project_path}");

############# Create Directorys ####################################
print "creating directorys\n";
MyModule::CreateDirectory("${project_path}");
MyModule::CreateDirectory("${project_path}app/");
MyModule::CreateDirectory("${project_path}app/api/");
MyModule::CreateDirectory("${project_path}app/config/");
MyModule::CreateDirectory("${project_path}app/controller/");
MyModule::CreateDirectory("${project_path}app/model/");
MyModule::CreateDirectory("${project_path}app/plugin/");
MyModule::CreateDirectory("${project_path}app/view/");
MyModule::CreateDirectory("${project_path}app/view/auth");
MyModule::CreateDirectory("${project_path}public/");
MyModule::CreateDirectory("${project_path}public/css");
MyModule::CreateDirectory("${project_path}public/img");

MyModule::CreateDirectory("${data_path}");
MyModule::CreateDirectory("${data_path}/session");
system("chmod 777 ${data_path}/session");

############# Create Files #########################################
print "creating files\n";
MakeEclipse::MakeProject("${project_path}.project", $project_path);
MakeHtaccess::MakeHtaccessRoot("${project_path}.htaccess");
MakeConfig::MakeConfig("${project_path}app/config/config.ini", $project_path, $project_url, $data_path, $data_url, $database_host, $database_username, $database_password, $database_name);
MakeIndex::MakeIndex("${project_path}public/index.php");
MakeHtaccess::MakeHtaccessPublic("${project_path}public/.htaccess");
MakeTabComponent::MakeTabComponent("${project_path}app/plugin/TabComponent.php", \@modul_list);
MakeAuthDispatcher::MakeAuthDispatcher("${project_path}app/plugin/AuthDispatcher.php");
MakeAuthModel::MakeAuthModel("${project_path}app/model/AuthModel.php");
MakeAuthController::MakeAuthController("${project_path}app/controller/AuthController.php");
MakeAuthTemplate::MakeAuthTemplate("${project_path}app/view/auth.phtml");
MakeAuthLoginView::MakeAuthLoginView("${project_path}app/view/auth/login.phtml");
MakeMainController::MakeMainController("${project_path}app/controller/MainController.php", \@modul_list);
MakeMainTemplate::MakeMainTemplate("${project_path}app/view/center.phtml");
MakeMainCss::MakeMainCss("${project_path}public/css/center.css");
MakeAuthCss::MakeAuthCss("${project_path}public/css/auth.css");
MakeLogo::MakeLogo("${project_path}public/img/logo.jpg");


############# Create Modules #######################################
print "creating modules\n";
$file_path_sql = "${project_path}app/api/database.sql";

foreach my $modul_name (@modul_list)
{
	$rundir = "${generator_path}modul/${modul_name}/${modul_name}.pl";
	do "${rundir}";
	
	$table_name = "${project_name}_${modul_name}";
	GenerateSql::CreateSql($file_path_sql, $modul_name, $table_name, \@param_list);
}


print "success\n";









