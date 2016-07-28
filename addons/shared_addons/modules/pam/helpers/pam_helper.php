<?php
if (!function_exists('bayar')) {
    function bayar($bln_sebelum=0,$bulan_current=0,$jenis='normal',$id_pembayaran=0,$harus_bayar=-1) {
		$pemakaian=$bulan_current-$bln_sebelum;

		switch($jenis){
			case 'normal':
			
				if($bln_sebelum==0 && $bulan_current==0){
					$bayar=0;
				}elseif($bln_sebelum==0 && $bulan_current!=0){
					// if(($pemakaian-10)<=5){
						// $bayar=15000;
					// }else{
						$bayar=((($pemakaian)-10)*2000)+15000;//echo '((('.$pemakaian.')-10)*2000)+15000===';
						if($bayar<15000){$bayar=15000;}
					// }
				}elseif($pemakaian<=5){
					$bayar=15000;
				}else{
					$bayar=((($pemakaian)-5)*2000)+15000;//echo '((('.$pemakaian.')-5)*2000)+15000===';
				}
			break;
			case 'umum':
			 $bayar=($bulan_current-$bln_sebelum)*2000;
			break;
			case 'gratis':
			 $bayar=0;
			break;
		}
		if($id_pembayaran!=0 && $harus_bayar!=-1){
			
			ci()->db->query('UPDATE default_pembayaran SET harus_bayar='.$bayar.' WHERE id='.$id_pembayaran.'');
		}
		return $bayar;
    }
}
if (!function_exists('Terbilang')) {
    function Terbilang($x)
		{
		  $abil = array("", "Satu", "Dua", "Tiga", "Empat", "Lima", "Enam", "Tujuh", "Delapan", "Sembilan", "Sepuluh", "Sebelas");
		  if ($x < 12)
			return " " . $abil[$x];
		  elseif ($x < 20)
			return Terbilang($x - 10) . "Belas";
		  elseif ($x < 100)
			return Terbilang($x / 10) . " Puluh" . Terbilang($x % 10);
		  elseif ($x < 200)
			return " seratus" . Terbilang($x - 100);
		  elseif ($x < 1000)
			return Terbilang($x / 100) . " Ratus" . Terbilang($x % 100);
		  elseif ($x < 2000)
			return " seribu" . Terbilang($x - 1000);
		  elseif ($x < 1000000)
			return Terbilang($x / 1000) . " Ribu" . Terbilang($x % 1000);
		  elseif ($x < 1000000000)
			return Terbilang($x / 1000000) . " Juta" . Terbilang($x % 1000000);
		}
}
?>