package MakeEclipse;

sub MakeProject
{
## Retrieve String
my $output_file = shift;

## Retrieve String
my $project_path = shift;

my @parts = split('/', $project_path);
$project_folder_name = $parts[-1];


open (MYFILE, ">$output_file");

print MYFILE "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n";
print MYFILE "<projectDescription>\n";
print MYFILE "	<name>${project_folder_name}</name>\n";
print MYFILE "	<comment></comment>\n";
print MYFILE "	<projects>\n";
print MYFILE "	</projects>\n";
print MYFILE "	<buildSpec>\n";
print MYFILE "		<buildCommand>\n";
print MYFILE "			<name>org.eclipse.wst.validation.validationbuilder</name>\n";
print MYFILE "			<arguments>\n";
print MYFILE "			</arguments>\n";
print MYFILE "		</buildCommand>\n";
print MYFILE "		<buildCommand>\n";
print MYFILE "			<name>org.eclipse.dltk.core.scriptbuilder</name>\n";
print MYFILE "			<arguments>\n";
print MYFILE "			</arguments>\n";
print MYFILE "		</buildCommand>\n";
print MYFILE "	</buildSpec>\n";
print MYFILE "	<natures>\n";
print MYFILE "		<nature>org.eclipse.php.core.PHPNature</nature>\n";
print MYFILE "	</natures>\n";
print MYFILE "</projectDescription>\n";

close (MYFILE);

}

1;







