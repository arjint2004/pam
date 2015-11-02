<?php
if (!function_exists('bayar')) {
    function bayar($bln_sebelum=0,$bulan_current=0,$jenis='normal') {
		$pemakaian=$bulan_current-$bln_sebelum;
		echo $pemakaian;die();
		switch($jenis){
			case 'normal':
				if($bln_sebelum==0){
					$bayar=((($pemakaian)-10)*2000)+15000;
				}elseif($pemakaian<=5){
					$bayar=15000;
				}else{
					$bayar=((($pemakaian)-5)*2000)+15000;
				}
			break;
			case 'umum':
			 $bayar=($bulan_current-$bln_sebelum)*2000;
			break;
		}
		
		return $bayar;
    }
}
?>