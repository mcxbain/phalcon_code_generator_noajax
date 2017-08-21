package MakeAuthTemplate;

sub MakeAuthTemplate
{
my $output_file = shift;
open (MYFILE, ">$output_file");

print MYFILE "<?php\n";
print MYFILE "echo \$this->tag->setDoctype(\\Phalcon\\Tag::HTML401_STRICT);\n";
print MYFILE "echo \$this->tag->getDoctype();\n\n";

print MYFILE "echo '<HTML>';\n";
print MYFILE "echo \"\\n\";\n";
print MYFILE "echo '<HEAD>';\n";
print MYFILE "echo \$this->tag->getTitle();\n";
print MYFILE "echo '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />';\n";
print MYFILE "echo \"\\n\";\n";
print MYFILE "echo '<meta http-equiv=\"content-language\" content=\"de\" />';\n";
print MYFILE "echo \"\\n\";\n";
print MYFILE "echo '<link rel=\"stylesheet\" href=\"'.\$this->url->get('public/css/auth.css').'\" type=\"text/css\">';\n";
print MYFILE "echo \"\\n\";\n";
print MYFILE "echo '</HEAD>';\n";
print MYFILE "echo \"\\n\";\n";
print MYFILE "echo '<BODY>';\n";
print MYFILE "echo \"\\n\";\n";
print MYFILE "echo '<div id=\"login_box\">';\n";
print MYFILE "echo \"\\n\";\n";
print MYFILE "echo \$this->getContent();\n";
print MYFILE "echo \"\\n\";\n";
print MYFILE "echo'</div>';\n";
print MYFILE "echo \"\\n\";\n";
print MYFILE "echo'</BODY>';\n";
print MYFILE "echo \"\\n\";\n";
print MYFILE "echo'</HTML>';\n";


close (MYFILE);

}


1;







