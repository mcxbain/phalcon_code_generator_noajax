package GenerateSqlInsert;

sub CreateSqlInsert
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



#############remove first elemetn of array BEGIN
$offset = 0;  # first element
$length = 1;
splice(@param_list, $offset, $length);
#############remove first elemetn of array END

open (MYFILE, ">>$output_file");

print MYFILE "<?php\n\n";

############print the params BEGIN

foreach my $param (@param_list)
{
print MYFILE "\$${param}='testing';\n";
}
print MYFILE "\n\n";

############print the params END


print MYFILE "mysql_query(\"INSERT INTO ${table_name} (";

###FIRST
my $counter = 1;
my $arrSize = scalar @param_list;

foreach my $param (@param_list)
{
print MYFILE "${param}";

	if($arrSize > $counter)
	{
	print MYFILE ", ";	
	}

$counter++;

}
print MYFILE ") \n";

###SECOND
print MYFILE "VALUES (";

my $counter = 1;
my $arrSize = scalar @param_list;

foreach my $param (@param_list)
{
	
print MYFILE "'\$${param}'";

	if($arrSize > $counter)
	{
	print MYFILE ", ";	
	}

$counter++;

}

print MYFILE ")\");";




print MYFILE "\n";
print MYFILE "\n";

close (MYFILE);

}


1;





