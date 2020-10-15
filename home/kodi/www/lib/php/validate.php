<?php
	// must parse password from file
	$passwd='HIDDENPASSWD';

	function validate()
	{
		$return=0;
		if(isset($_GET['admin']))
			($GET['admin'] == $passwd) ? $return=1 : $return=0;
		return $return;
	}
?>