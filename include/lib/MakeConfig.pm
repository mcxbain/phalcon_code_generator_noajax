package MakeConfig;

sub MakeConfig
{
## Retrieve String
my $output_file = shift;

## Retrieve String
my $project_path = shift;

## Retrieve String
my $project_url = shift;

## Retrieve String
my $data_path = shift;

## Retrieve String
my $data_url = shift;

## Retrieve String
my $database_host = shift;

## Retrieve String
my $database_username = shift;

## Retrieve String
my $database_password = shift;

## Retrieve String
my $database_name = shift;


open (MYFILE, ">$output_file");

print MYFILE "[application]\n";
print MYFILE "application_base_url = \"${project_url}\"\n";
print MYFILE "application_base_dir = \"${project_path}\"\n";
print MYFILE "application_data_url = \"${data_url}\"\n";
print MYFILE "application_data_dir = \"${data_path}\"\n\n";

print MYFILE "[database]\n";
print MYFILE "database_adapter = \"Mysql\"\n";
print MYFILE "database_host = \"${database_host}\"\n";
print MYFILE "database_username = \"${database_username}\"\n";
print MYFILE "database_password = \"${database_password}\"\n";
print MYFILE "database_name = \"${database_name}\"\n";

close (MYFILE);

}

1;







