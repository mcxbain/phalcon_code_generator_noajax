package MakeIndex;

sub MakeIndex
{

my $output_file = shift;

open (MYFILE, ">$output_file");

print MYFILE "<?php\n";
print MYFILE "ini_set('display_errors', 1);\n";
print MYFILE "error_reporting(E_ALL & ~E_DEPRECATED & ~E_STRICT);\n\n";

print MYFILE "\$config = new Phalcon\\Config\\Adapter\\Ini('../app/config/config.ini');\n";
print MYFILE "\$application_data_dir = \$config->application->application_data_dir;\n";
print MYFILE "\$session_dir = ''.\$application_data_dir.'session';\n";
print MYFILE "session_save_path(\$session_dir);\n\n";

print MYFILE "class Application extends Phalcon\\Mvc\\Application\n";
print MYFILE "{\n\n";

print MYFILE "	public function main()\n";
print MYFILE "	{\n\n";
			
print MYFILE "		//Load DI\n";
print MYFILE "		\$di = new Phalcon\\DI\\FactoryDefault();\n\n";

print MYFILE "		//Load Config\n";
print MYFILE "		\$config = new Phalcon\\Config\\Adapter\\Ini('../app/config/config.ini');\n";
print MYFILE "		\$di->set('config', \$config, true);\n\n";


print MYFILE "		//Register Loader\n";
print MYFILE "		\$controller_dir = '../app/controller/';\n";
print MYFILE "		\$model_dir = '../app/model/';\n";
print MYFILE "		\$view_dir = '../app/view/';\n";
print MYFILE "		\$plugin_dir = '../app/plugin/';\n";
print MYFILE "		\$lib_dir = '../app/lib/';\n";
print MYFILE "		\$register_dir[0] = \$controller_dir;\n";
print MYFILE "		\$register_dir[1] = \$model_dir;\n";
print MYFILE "		\$register_dir[2] = \$view_dir;\n";
print MYFILE "		\$register_dir[3] = \$plugin_dir;\n";
print MYFILE "		\$loader = new Phalcon\\Loader();\n";
print MYFILE "		\$loader->registerDirs(\$register_dir);\n";
print MYFILE "		\$loader->register();\n\n";

print MYFILE "		//Register Views\n";
print MYFILE "		\$view = new Phalcon\\Mvc\\View();\n";
print MYFILE "		\$view_dir = \$view->setViewsDir(\$view_dir);\n";
print MYFILE "		\$view->setMainView('center');\n";
print MYFILE "		\$di->set('view', \$view);\n\n";

print MYFILE "		//Register Router\n";
print MYFILE "		\$router = new Phalcon\\Mvc\\Router();\n";
print MYFILE "		\$router->setDefaultController('main');\n";
print MYFILE "		\$router->setDefaultAction('show');\n";
print MYFILE "		\$di->set('router', \$router);\n\n";

print MYFILE "		//Register BaseUrl\n";
print MYFILE "		\$url = new Phalcon\\Mvc\\Url();\n";
print MYFILE "		\$url_set = \$url->setBaseUri(\$config->application->application_base_url);\n";
print MYFILE "		\$di->set('url', \$url_set);\n\n";

print MYFILE "		//Register Security Adapter\n";
print MYFILE "		\$security = new Phalcon\\Security();\n";
print MYFILE "		\$security->setWorkFactor(12);\n";
print MYFILE "		\$di->set('security', \$security, true);\n\n";
		 
print MYFILE "		//Register Session Adapter\n";
print MYFILE "		\$session = new Phalcon\\Session\\Adapter\\Files();\n";
print MYFILE "		\$session->start();\n";
print MYFILE "		\$di->set('session', \$session, true);\n\n";

print MYFILE "		//Custom AuthDispatcher\n";
print MYFILE "		\$dispatcher = new Phalcon\\Mvc\\Dispatcher();\n";
print MYFILE "		\$EventManager = \$di->getShared('eventsManager');\n";
print MYFILE "		\$AuthDispatcher = new AuthDispatcher();\n";
print MYFILE "		\$EventManager->attach('dispatch', \$AuthDispatcher);\n";
print MYFILE "		\$dispatcher->setEventsManager(\$EventManager);\n";
print MYFILE "		\$di->set('dispatcher', \$dispatcher);\n\n";

print MYFILE "		//Custom TabComponent\n";
print MYFILE "		\$TabComponent = new TabComponent();\n";
print MYFILE "		\$di->set('TabComponent', \$TabComponent);\n\n";

print MYFILE "		\$this->setDI(\$di);\n\n";

print MYFILE "		echo \$this->handle()->getContent();\n\n";

print MYFILE "	}\n\n";

print MYFILE "}\n\n";

print MYFILE "\$Application = new Application();\n";
print MYFILE "\$Application->main();";

close (MYFILE);

}


1;







