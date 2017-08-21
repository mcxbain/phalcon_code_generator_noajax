package MakeMainController;

sub MakeMainController
{
## Retrieve output_file 
my $output_file = shift;

## Retrieve list reference 
my $modul_list = shift;

## De-reference the list's scalar 
my @modul_list = @{$modul_list};


open (MYFILE, ">$output_file");

print MYFILE "<?php\n";
print MYFILE "class MainController extends Phalcon\\Mvc\\Controller\n";
print MYFILE "{\n\n";

print MYFILE "	public function initialize()\n";
print MYFILE "	{\n";
print MYFILE "		//initialize\n";
print MYFILE "	}\n\n";

print MYFILE "	public function indexAction()\n";
print MYFILE "	{\n";
print MYFILE "		//Redirect\n";
print MYFILE "	}\n\n";

print MYFILE "	public function showAction()\n";
print MYFILE "	{\n";
print MYFILE "		//Redirect\n";
print MYFILE "		\$this->response->redirect(\"${modul_list[0]}/show\");\n";


print MYFILE "	}\n\n\n";

print MYFILE "}//end class\n";

close (MYFILE);

}


1;







