package GetModulList;

sub GetModulList
{
	my $dir = shift;
	
	####################SCAN DIR FOLDER
	@file_array = ();
	
	opendir(DIR, $dir) or die $!;
	
	while(my $file = readdir DIR) 
	{
		$check = "true";
		if($file =~ /^[.]/){$check="false";}
		if($file =~ /[.]/){$check="false";}
	
		if($check eq "true")
		{
		push(@file_array, $file);
		}
		
	}
	
	closedir DIR;
	
	return @file_array;	
	
}


1;





