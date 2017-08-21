package MakeMainTemplate;

sub MakeMainTemplate
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
print MYFILE "echo \"\\n\";\n\n";

print MYFILE "//CSS\n";
print MYFILE "echo \"\\n\";\n";
print MYFILE "echo '<link rel=\"stylesheet\" href=\"'.\$this->url->get('public/css/center.css').'\" type=\"text/css\">';\n";
print MYFILE "echo \"\\n\";\n\n";

print MYFILE "//HTML BEGIN\n";
print MYFILE "echo '</HEAD>';\n";
print MYFILE "echo \"\\n\";\n";
print MYFILE "echo '<BODY>';\n";
print MYFILE "echo \"\\n\";\n\n";

print MYFILE "//LOGO\n";
print MYFILE "echo '<div id=\"logo\">';\n";
print MYFILE "echo '<img src=\"'.\$this->url->get('public/img/logo.jpg').'\">';\n";
print MYFILE "echo '</div>';\n\n";

print MYFILE "//MENU\n";
print MYFILE "echo '<div id=\"menu\">';\n";
print MYFILE "echo \$this->TabComponent->GetMenu();\n";
print MYFILE "echo '</div>';\n\n";

print MYFILE "//CONTENT\n";
print MYFILE "echo '<div id=\"content\">';\n";
print MYFILE "echo \$this->getContent();\n";
print MYFILE "echo'</div>';\n\n";

print MYFILE "//HTML END\n";
print MYFILE "echo \"\\n\";\n";
print MYFILE "echo'</BODY>';\n";
print MYFILE "echo \"\\n\";\n";
print MYFILE "echo'</HTML>';";

close (MYFILE);

}


1;







