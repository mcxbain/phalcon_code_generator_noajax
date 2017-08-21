#!/usr/bin/perl
do "../../config/config.pl";
############# PARAMETER ############################################################
$modul_name = "user";
@param_list = ();
####################################################################################
push @param_list, 'user_id';
push @param_list, 'user_time';
push @param_list, 'user_name';
push @param_list, 'user_password';
push @param_list, 'user_hash';
push @param_list, 'user_mail';
push @param_list, 'user_role';
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