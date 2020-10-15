<?php
	// Bridge: Main <-> Common library <-> System shell

	function smb_res()
	{
		$end='';
		foreach(preg_split("/[\s]+/", shell_exec('./bin/smb.sh')) as $line)
			$end.='<li>' . $line . '</li>';
		return $end;
	}
	function kodi_run()
	{
		if(shell_exec('./bin/kodi.sh run') == 'true')
			return 1;
		return 0;
	}
	function kodi_time()
	{
		if(kodi_run())
			$kodi_time=shell_exec('./bin/kodi.sh time');
		else
			$kodi_time='nie działa';
		return $kodi_time;
	}
	function admin_session()
	{
		if(shell_exec('./bin/admin-session.sh') == 'true')
			return 1;
		return 0;
	}

	$os= '<b>' . shell_exec('./bin/os.sh issue') . '</b> ' . shell_exec('./bin/os.sh codename') . ' v' . shell_exec('./bin/os.sh version');
	$hostname=shell_exec('./bin/hostname.sh');
	$user=shell_exec('./bin/whoami.sh');
	$last_upgrade=shell_exec('./bin/upgrade.sh info');
	$last_backup=shell_exec('./bin/backup.sh info');
	$uptime=shell_exec('./bin/uptime.sh');
	$ssh=shell_exec('./bin/ssh.sh');
	$vnc=shell_exec('./bin/vnc.sh');
	$df_libs=shell_exec('./bin/df.sh libs');
	$df_root=shell_exec('./bin/df.sh root');
	$kodi_version=shell_exec('./bin/kodi.sh version');
?>