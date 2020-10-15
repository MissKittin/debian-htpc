<?php
	// System admin bridge: Main <-> Library <- system admin support library <-> System Shell

	//upgrade
	$upgrade_result='';
	if(isset($_POST['upgrade']))
	{
		$upgrade_result=shell_exec('./bin/upgrade.sh do');
	}

	//backup
	$backup_result='';
	if(isset($_POST['backup']))
	{
		$backup_result=shell_exec('./bin/backup.sh do');
	}

	//halt
	if(isset($_POST['close']))
	{
		$info='';
		$exit=1;

		if($_POST['close'] == 'Zamknij')
			$info='Zamknij';
		elseif($_POST['close'] == 'Uruchom ponownie')
			$info='Uruchom ponownie';
		else
			$info='Uśpij';

		$page='
			<!DOCTYPE html>
			<html lang="pl">
				<head>
					<title>Home theater PC</title>
					<meta charset="utf-8">
					<link rel="shortcut icon" type="image/icon" href="img/favicon.ico">
					<link rel="stylesheet" type="text/css" href="lib/css/style.css">
				</head>
				<body>
					<div>
						<h2><img src="img/info-icon.png" alt="info">' . $info . '</h2>
					</div>';
			if($info != 'Zamknij' && $info != 'Uśpij')
				$page.='<div>
						<form>
							<input type="submit" onClick="javascript:location.reload();" value="Wróć">
						</form>
					</div>';
			$page.='</body>
			</html>
		';

		if($_POST['close'] == 'Zamknij')
		{
			shell_exec('/sbin/halt');
			exit($page);
		}
		elseif($_POST['close'] == 'Uruchom ponownie')
		{
			shell_exec('/sbin/reboot');
			exit($page);
		}
		else
		{
			shell_exec('./bin/s2ram');
			exit($page);
		}
	}
?>