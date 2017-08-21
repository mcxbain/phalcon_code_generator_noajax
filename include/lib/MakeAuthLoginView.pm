package MakeAuthLoginView;

sub MakeAuthLoginView
{
my $output_file = shift;
open (MYFILE, ">$output_file");

print MYFILE "<?php\n";
print MYFILE "echo '<img src=\"'.\$this->url->get().'public/img/logo.jpg\" alt=\"Authentication\">';\n";
print MYFILE "echo '<form action=\"'.\$this->url->get().'auth/check\" method =\"post\">';\n";
print MYFILE "echo '<fieldset>';\n";
print MYFILE "echo '<input size=\"20\" name=\"username\" id=\"username\" value=\"\" type=\"text\" />';\n";
print MYFILE "echo '<input size=\"20\" name=\"password\" id=\"password\" value=\"\" type=\"password\" />';\n";
print MYFILE "echo '</fieldset>';\n";
print MYFILE "echo '<input type=\"hidden\" name=\"'.\$this->security->getTokenKey().'\" value=\"'.\$this->security->getToken().'\" />';\n";
print MYFILE "echo '<input class=\"submit\" value=\"Login\" type=\"submit\" />';\n";
print MYFILE "echo '</form>';\n";

close (MYFILE);

}


1;







