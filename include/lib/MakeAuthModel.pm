package MakeAuthModel;

sub MakeAuthModel
{
my $output_file = shift;
open (MYFILE, ">$output_file");

print MYFILE "<?php\n";
print MYFILE "include_once('../app/api/user/user_api.php');\n\n";

print MYFILE "class AuthModel extends Phalcon\\Mvc\\Model\n";
print MYFILE "{\n\n";

print MYFILE "	public function CheckLogin(\$username, \$password)\n";
print MYFILE "	{\n";
print MYFILE "		\$UserApi= new UserApi();\n";
print MYFILE "		\$user_id = \$UserApi->GetUserIdWhere('user_name', \$username);\n";

print MYFILE "		if(\$user_id)\n";
print MYFILE "		{\n";
print MYFILE "			\$db_password = \$UserApi->GetUserPassword(\$user_id);\n";
print MYFILE "			if(\$db_password==md5(\$password))\n";
print MYFILE "			{\n";
print MYFILE "				\$user_hash = \$UserApi->GetUserHash(\$user_id);\n";
print MYFILE "				\$this->session->set('auth', \$user_hash);\n";
print MYFILE "				return true;\n\n";

print MYFILE "			}\n";
print MYFILE "			else\n";
print MYFILE "			{\n";
print MYFILE "				return false;\n";
print MYFILE "			}\n";
print MYFILE "		}\n";
print MYFILE "		else\n";
print MYFILE "		{\n";
print MYFILE "			return false;\n";
print MYFILE "		}\n";
print MYFILE "	}\n\n";

print MYFILE "	public function CheckDispatcherSession()\n";
print MYFILE "	{\n";
print MYFILE "		\$UserApi= new UserApi();\n";
print MYFILE "		\$user_hash = \$this->session->get('auth');\n";
print MYFILE "		\$result = \$UserApi->GetUserIdWhere('user_hash', \$user_hash);\n";
print MYFILE "		if(\$result){return true;}else{return false;}\n";
print MYFILE "	}\n\n";

print MYFILE "	public function GetCurrentUserId()\n";
print MYFILE "	{\n";
print MYFILE "		\$UserApi= new UserApi();\n";
print MYFILE "		\$user_hash = \$this->session->get('auth');\n";
print MYFILE "		\$user_id = \$UserApi->GetUserIdWhere('user_hash', \$user_hash);\n";
print MYFILE "		if(\$user_id){return \$user_id;}else{return false;}\n";
print MYFILE "	}\n\n";

print MYFILE "	public function GetUserNameFromUserId(\$user_id)\n";
print MYFILE "	{\n";
print MYFILE "		\$UserApi= new UserApi();\n";
print MYFILE "		\$user_name = \$UserApi->GetUserName(\$user_id);\n";
print MYFILE "		if(\$user_name){return \$user_name;}else{return false;}\n";
print MYFILE "	}\n\n";

print MYFILE "}//end class\n";


close (MYFILE);

}


1;







