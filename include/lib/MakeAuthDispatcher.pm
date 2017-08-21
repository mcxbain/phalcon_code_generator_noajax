package MakeAuthDispatcher;

sub MakeAuthDispatcher
{
my $output_file = shift;
open (MYFILE, ">$output_file");

print MYFILE "<?php\n";
print MYFILE "use Phalcon\\Events\\Event;\n";
print MYFILE "use Phalcon\\Mvc\\User\\Plugin;\n";
print MYFILE "use Phalcon\\Mvc\\Dispatcher;\n";
print MYFILE "use Phalcon\\Acl;\n\n";

print MYFILE "class AuthDispatcher extends Plugin\n";
print MYFILE "{\n\n";

print MYFILE "	public function beforeExecuteRoute(Event \$event, Dispatcher \$dispatcher)\n";
print MYFILE "	{\n\n";

print MYFILE "		if(AuthModel::CheckDispatcherSession())\n";
print MYFILE "		{\n";
print MYFILE "			//SESSION REGISTERD EVERYTHING OK\n";	
print MYFILE "		}\n";
print MYFILE "		else\n";
print MYFILE "		{\n";

print MYFILE "			if(\$dispatcher->getControllerName() == 'auth')\n";
print MYFILE "			{\n";
print MYFILE "			//AUTH CONTROLLER IS ALLOWED WITHOUT SESSION EVERYTHING OK\n";
print MYFILE "			}\n";
print MYFILE "			else \n";
print MYFILE "			{\n";
print MYFILE "			//NO SESSION REGISTERD REDIRECT TO LOGIN\n";
print MYFILE "			\$this->response->redirect(\"auth/login\");\n";
print MYFILE "			}\n";

print MYFILE "		}\n\n";


print MYFILE "	}\n\n";

print MYFILE "	public function beforeNotFoundAction(Event \$event, Dispatcher \$dispatcher)\n";
print MYFILE "	{\n";
print MYFILE "		echo 'Action Dosent Exist';\n";
print MYFILE "		exit;\n";
print MYFILE "	}\n\n";

print MYFILE "	public function beforeException(Event \$event, Dispatcher \$dispatcher)\n";
print MYFILE "	{\n";
print MYFILE "		echo 'Controller Dosent Exist';\n";
print MYFILE "		exit;\n\n";
			
print MYFILE "	}\n\n";

print MYFILE "}//end class\n";


close (MYFILE);

}


1;







