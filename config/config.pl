#!/usr/bin/perl
BEGIN 
{
#Generator Path
$generator_path ="/home/mcxbain/workspace/timeservergen/generator/";

#Project Path
$project_path ="/home/mcxbain/workspace/timeservergen/output/";
$project_url ="http://localhost/workspace/timeservergen/output/";
$project_name = "timeserver";

#Data Path
$data_path ="/home/mcxbain/workspace/timeservergen/timeserverdata/";
$data_url ="http://localhost/workspace/timeservergen/timeserverdata/";

#Database
$database_host = "localhost";
$database_username = "root";
$database_password = "secret";
$database_name = "rma";

}

use lib "${generator_path}include/lib/";

#Generator Libarys
require MyModule;
require GetModulList;

#Dynamic File Modules
require Api;
require Model;
require Controller;
require ViewAdd;
require ViewEdit;
require ViewDelete;
require ViewList;
require ViewShow;
require GenerateSql;
require GenerateSqlInsert;

#Static File Modules
require MakeEclipse;
require MakeHtaccess;
require MakeConfig;
require MakeIndex;
require MakeTabComponent;
require MakeMainController;
require MakeMainTemplate;
require MakeMainCss;
require MakeAuthModel;
require MakeAuthController;
require MakeAuthTemplate;
require MakeAuthDispatcher;
require MakeAuthLoginView;
require MakeAuthCss;
require MakeLogo;
