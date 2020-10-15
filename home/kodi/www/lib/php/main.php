<?php
	include('lib/php/library.php');
?>
<!DOCTYPE html>
<html lang="pl">
	<head>
		<title>Home theater PC</title>
		<meta charset="utf-8">
		<link rel="shortcut icon" type="image/icon" href="img/favicon.ico">
		<link rel="stylesheet" type="text/css" href="lib/css/style.css">
		<script type="text/javascript" src="lib/js/script.js"></script>
		<script type="text/javascript">
			function gotokodi(where)
			{
				window.location = "http://" + window.location.hostname + ":" + kodiport + where;
			}
		</script>
	</head>
	<body>
		<div id="header" class="center-div">
			<img src="img/kodi-logo.png" alt="kodi"><!-- 50x50 -->
			<img src="img/debian-logo.png" alt="debian"><!-- 146x50 -->
			<img src="img/gnu-logo.png" alt="gnu"><!-- 51x50 -->
			<span style="font-size: 50px;">/</span>
			<img src="img/tux.png" alt="tux"><!-- 42x50 -->
			<span style="font-size: 50px;">&&</span>
			<img src="img/xp-game-logo.png" alt="xp">
		</div>
		<div id="body" class="center-div">
			<?php
				if(validate())
					if(kodi_run())
						echo '
							<p class="button">
								<a href="javascript:gotokodi(\'\')">Zdalne sterowanie &rarr;</a>
								<a href="javascript:gotokodi(\'/addons\')">Interfejsy &rarr;</a>
							</p>
						';
				if(admin_session())
					echo '<p id="message"><img src="img/info-icon.png" alt="info"> Trwa sesja administracyjna</p>';
			?>
			<p>System <?php echo $os ?><!-- (<?php echo $user; ?>@<?php echo $hostname; ?>)--></p>
			<div>
				<form action="." method="post">
					Ostatni update: <?php echo $last_upgrade; ?>
					<input type="submit" name="upgrade" value="Aktualizuj">
					<?php echo $upgrade_result; ?>
				</form>
				<form action="." method="post">
					Ostatnia kopia: <?php echo $last_backup; ?>
					<input type="submit" name="backup" value="Wykonaj kopię zapasową profilu">
					<?php echo $backup_result; ?>
				</form>
			</div>
			<br>
			<div>
				<form action="." method="post">
					Uptime: <?php echo $uptime; ?>
					<?php
						if(validate())
							echo '
								<input type="submit" name="close" value="Zamknij">
								<input type="submit" name="close" value="Uruchom ponownie">
								<input type="submit" name="close" value="Uśpij">
							';
					?>
				</form>
			</div>
			<p>Secure SHell: <?php echo $ssh; ?></p>
			<p>VNC: <?php echo $vnc; ?></p>
			<div class="border">
				<p>Udziały samby:</p>
				<ol>
					<?php echo smb_res(); ?>
				</ol>
			</div>
			<div id="disks" class="border">
				<p>Wolne miejsce w bibliotekach</p>
				<ul>
					<?php echo $df_libs; ?>
				</ul>
				<p>Miejsce dla systemu <img src="img/debian-icon.png" alt="debian icon"> <?php echo $df_root; ?></p>
			</div>
		</div>
		<div id="footer" class="center-div">
			Kodi <?php echo $kodi_version; ?> wystartowano: <?php echo kodi_time(); ?>
		</div>
	</body>
</html>