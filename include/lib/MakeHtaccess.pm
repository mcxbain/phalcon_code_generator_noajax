package MakeHtaccess;

sub MakeHtaccessRoot
{
my $output_file = shift;
open (MYFILE, ">$output_file");

print MYFILE "<IfModule mod_rewrite.c>\n";
print MYFILE "	RewriteEngine on\n";
print MYFILE "	RewriteRule  ^\$ public/    [L]\n";
print MYFILE "	RewriteRule  (.*) public/\$1 [L]\n";
print MYFILE "</IfModule>";
close (MYFILE);

}

sub MakeHtaccessPublic
{
my $output_file = shift;
open (MYFILE, ">$output_file");

print MYFILE "AddDefaultCharset UTF-8\n\n";
print MYFILE "<IfModule mod_rewrite.c>\n";
print MYFILE "    RewriteEngine On\n";
print MYFILE "    RewriteCond %{REQUEST_FILENAME} !-d\n";
print MYFILE "    RewriteCond %{REQUEST_FILENAME} !-f\n";
print MYFILE "    RewriteRule ^(.*)\$ index.php?_url=/\$1 [QSA,L]\n";
print MYFILE "</IfModule>\n";

close (MYFILE);
}

1;







