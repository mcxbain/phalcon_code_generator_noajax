#!/usr/bin/perl
do "../../config/config.pl";
############# PARAMETER ############################################################
$modul_name = "syslog";
@param_list = ();
####################################################################################
push @param_list, 'syslog_id';
push @param_list, 'syslog_time';
push @param_list, 'syslog_user_id';
push @param_list, 'syslog_message';
####################################################################################
		
		############# GENERATE API #########################################################
MyModule::CreateApiExtend($project_path, $project_name, $modul_name, \@param_list);
MyModule::CreateModelExtend($project_path, $modul_name, \@param_list);
MyModule::CreateControllerExtend($project_path, $modul_name, \@param_list);

############# GENERATE VIEWS #######################################################
MyModule::CreateViewAddExtend($project_path, $modul_name, \@param_list);
MyModule::CreateViewEditExtend($project_path, $modul_name, \@param_list);
MyModule::CreateViewDeleteExtend($project_path, $modul_name, \@param_list);
MyModule::CreateViewListExtend($project_path, $modul_name, \@param_list);
MyModule::CreateViewShowExtend($project_path, $modul_name, \@param_list);