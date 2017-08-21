package GenerateSql;

sub CreateSql
{
## Retrieve String
my $output_file = shift;

## Retrieve String
my $modul_name = shift;

## Retrieve String
my $table_name = shift;

## Retrieve list reference 
my $param_list = shift;

## De-reference the list's scalar 
my @param_list = @{$param_list};

open (MYFILE, ">>$output_file");

print MYFILE "CREATE TABLE IF NOT EXISTS ${table_name} (\n";
foreach my $param (@param_list)
{
$string = "${modul_name}_id";
if($param =~ /^$string/ ){print MYFILE "${param} INT NOT NULL AUTO_INCREMENT ,\n";}else{print MYFILE "${param} MEDIUMTEXT NOT NULL ,\n";}
}
print MYFILE "PRIMARY KEY (${modul_name}_id)) ENGINE=MYISAM AUTO_INCREMENT=100000;\n";
print MYFILE "\n";
print MYFILE "\n";

close (MYFILE);

}


1;





