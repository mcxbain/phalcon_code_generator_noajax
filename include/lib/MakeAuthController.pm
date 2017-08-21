package MakeAuthController;

sub MakeAuthController
{
my $output_file = shift;
open (MYFILE, ">$output_file");

print MYFILE "<?php\n";
print MYFILE "class AuthController extends Phalcon\\Mvc\\Controller\n";
print MYFILE "{\n";
print MYFILE "	public function initialize()\n";
print MYFILE "	{\n";
print MYFILE "		\$this->tag->setTitle(\"Authentication\");\n";
print MYFILE "	}\n\n";

print MYFILE "	public function indexAction()\n";
print MYFILE "	{\n";
print MYFILE "		\$this->response->redirect(\"auth/login\");\n";
print MYFILE "	}\n\n";

print MYFILE "	public function loginAction()\n";
print MYFILE "	{\n";
print MYFILE "		\$this->view->setMainView('auth');\n";
print MYFILE "	}\n\n";

print MYFILE "	public function checkAction()\n";
print MYFILE "	{\n\n";

print MYFILE "		if(\$this->request->isPost())\n";
print MYFILE "		{\n\n";

print MYFILE "			if(\$this->security->checkToken())\n";
print MYFILE "			{\n";
print MYFILE "				\$username = \$this->request->getPost('username');\n";
print MYFILE "				\$password = \$this->request->getPost('password');\n";

print MYFILE "				if(AuthModel::CheckLogin(\$username, \$password))\n";
print MYFILE "				{\n";
print MYFILE "					\$data_log['log_user_id'] = AuthModel::GetCurrentUserId();\n";
print MYFILE "					\$data_log['log_level'] = 'INFO';\n";
print MYFILE "					\$data_log['log_text'] = 'Login';\n";
print MYFILE "					LogModel::AddLog(\$data_log);\n";
print MYFILE "					\$this->response->redirect(\"main/show\");\n";
print MYFILE "				}\n";
print MYFILE "				else\n";
print MYFILE "				{\n";
print MYFILE "					\$this->response->redirect(\"auth/login\");\n";
print MYFILE "				}\n\n";

print MYFILE "			}\n";
print MYFILE "			else\n";
print MYFILE "			{\n";
print MYFILE "				\$this->response->redirect(\"auth/login\");\n";
print MYFILE "			}\n\n";

print MYFILE "		}\n";
print MYFILE "		else\n";
print MYFILE "		{\n";
print MYFILE "			\$this->response->redirect(\"auth/login\");\n";
print MYFILE "		}\n\n";
		 
print MYFILE "	}\n\n";

print MYFILE "	public function logoutAction()\n";
print MYFILE "	{\n";
print MYFILE "		\$data_log['log_user_id'] = AuthModel::GetCurrentUserId();\n";
print MYFILE "		\$data_log['log_level'] = 'INFO';\n";
print MYFILE "		\$data_log['log_text'] = 'Logout';\n";
print MYFILE "		LogModel::AddLog(\$data_log);\n";
print MYFILE "		\$this->session->destroy();\n";
print MYFILE "		\$this->response->redirect(\"auth/login\");\n";
print MYFILE "	}\n\n";


print MYFILE "}//end class\n";



close (MYFILE);

}


1;







