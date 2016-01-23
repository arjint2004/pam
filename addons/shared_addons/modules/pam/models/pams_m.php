<?php defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * Pams Model
 * 
 * @author Michael Giuliana
 */
class Pams_m extends MY_Model
{
	/**
	 * Array that contains the validation rules.
	 *
	 * @access	public
	 * @var		array
	 */
	public $_validation_rules = array(
		array(
			'field' => 'jquery',
			'label' => 'jQuery',
			'rules' => 'trim|required|numeric'
		),
		array(
			'field' => 'folder_id',
			'label' => 'Folder',
			'rules' => 'trim|required|numeric'
		),
	);

	public function get_pelanggan_by_id($id=0)
	{
		$query=$this->db->query("SELECT * FROM default_pelanggan WHERE id=".$id."");
		//echo $this->db->last_query();
		return $query->result_array();
	}
	public function get_pelanggan_cari($tahun=0,$alamat='',$nama='')
	{
		if($alamat=='semua'){
		$query=$this->db->query("SELECT a.*,b.id as id_pemb,b.id_pelanggan,b.bulan,b.baca_meter,b.harus_bayar,b.dibayar,b.selisih,b.tanggal,b.status, (SELECT baca_meter FROM default_pembayaran WHERE id_pelanggan=a.id AND month(bulan)=month(b.bulan)-1 AND year(b.bulan)=".$tahun.") as baca_s FROM default_pelanggan a JOIN default_pembayaran b ON a.id=b.id_pelanggan WHERE year(b.bulan)=?  AND a.nama LIKE '%".$nama."%'",array($tahun));		
		}else{
		$query=$this->db->query("SELECT a.*,b.id as id_pemb,b.id_pelanggan,b.bulan,b.baca_meter,b.harus_bayar,b.dibayar,b.selisih,b.tanggal,b.status, (SELECT baca_meter FROM default_pembayaran WHERE id_pelanggan=a.id AND month(bulan)=month(b.bulan)-1 AND year(b.bulan)=".$tahun." AND a.alamat=".$alamat.") as baca_s FROM default_pelanggan a JOIN default_pembayaran b ON a.id=b.id_pelanggan WHERE year(b.bulan)=? AND a.alamat=? AND a.nama LIKE '%".$nama."%'",array($tahun,$alamat));		
		}
		//echo $this->db->last_query(); die();
		return $query->result_array();
	}
	public function get_pelanggan()
	{
		$query=$this->db->query("SELECT * FROM default_pelanggan ORDER BY alamat,id");
		//echo $this->db->last_query(); 
		return $query->result_array();
	}
	public function get_pembayaranMenunggak($mulai_bulan=9)
	{
		$mulai_bulan=$mulai_bulan-1;
		
		$bulan=$this->db->query("SELECT b.bulan FROM default_pelanggan l JOIN default_pembayaran b ON l.id=b.id_pelanggan WHERE b.status=0 AND month(b.bulan)>".$mulai_bulan." GROUP BY b.bulan order by b.id_pelanggan")->result_array();
		$tunggakan=$this->db->query("SELECT l.nama,l.alamat,l.nomor,b.* FROM default_pelanggan l JOIN default_pembayaran b ON l.id=b.id_pelanggan WHERE  month(b.bulan)>".$mulai_bulan." order by b.id_pelanggan")->result_array();
		
		foreach($tunggakan as $key=>$datapelanggan){
			$tunggakan2[$datapelanggan['id_pelanggan']]['nama']=$datapelanggan['nama'];
			$tunggakan2[$datapelanggan['id_pelanggan']]['id_pelanggan']=$datapelanggan['id_pelanggan'];
			$tunggakan2[$datapelanggan['id_pelanggan']]['alamat']=$datapelanggan['alamat'];
			$tunggakan2[$datapelanggan['id_pelanggan']]['bulan'][$datapelanggan['bulan']]=$datapelanggan;
		}
		unset($tunggakan);

		return $tunggakan2;
		//echo $this->db->last_query();
		
	}
	public function baca_meter_current($bulan=0,$tahun=0,$id_pelanggan=0)
	{
		if($id_pelanggan!=0){$cnd=' AND b.id_pelanggan='.$id_pelanggan.'';}else{$cnd='';}
		$out2=array();
		if($bulan==0){$bulan=date("m", mktime(0, 0, 0, date('m')-1  ,1 , date('Y')));}else{$bulan=date("m", mktime(0, 0, 0, $bulan  ,1 , $tahun));} 
		if($tahun==0){$tahun=date("Y", mktime(0, 0, 0, date('m')-1  ,1 , date('Y')));}else{$tahun=date("Y", mktime(0, 0, 0, $bulan  ,1 , $tahun));}
		$query=$this->db->query("SELECT b.id,b.id_pelanggan,b.bulan,b.baca_meter,b.harus_bayar,b.dibayar,b.selisih,b.tanggal,b.status FROM default_pembayaran b  WHERE month(b.bulan)=? AND year(b.bulan)=? ".$cnd."",array($bulan,$tahun));
		//echo $this->db->last_query();
		$out=$query->result_array();
		foreach($out as $cx=>$dataout){
			$out2[$dataout['id_pelanggan']]=$dataout;
		}
		unset($out);
		return $out2;
	}
	public function baca_meter_sebelumnya($bulan=0,$tahun=0,$id_pelanggan=0)
	{
		if($id_pelanggan!=0){$cnd=' AND b.id_pelanggan='.$id_pelanggan.'';}else{$cnd='';}
		$out2=array();
		if($bulan==0){$bulan=date("m", mktime(0, 0, 0, date('m')-2  ,1 , date('Y')));}else{$bulan=date("m", mktime(0, 0, 0, $bulan-1  ,1 , $tahun));} 
		if($tahun==0){$tahun=date("Y", mktime(0, 0, 0, date('m')-2  ,1 , date('Y')));}else{$tahun=date("Y", mktime(0, 0, 0, $bulan-1  ,1 , $tahun));}
		$query=$this->db->query("SELECT b.id_pelanggan,b.bulan,b.baca_meter,b.harus_bayar,b.dibayar,b.selisih,b.tanggal,b.status FROM default_pembayaran b  WHERE month(b.bulan)=? AND year(b.bulan)=? ".$cnd."",array($bulan,$tahun));
		//echo $this->db->last_query();
		$out=$query->result_array();
		foreach($out as $cx=>$dataout){
			$out2[$dataout['id_pelanggan']]=$dataout;
		}
		//pr($_POST);
		unset($out);//die();
		return $out2;
	}
	/**
	 * Get Pam Module settings.
	 * 
	 * Takes the work out of grabbing the settings whenever
	 * we need them. Will also return a single value if
	 * needed.
	 * 
	 * @param str $field The settings field to retrieve.
	 * @return array / str
	 */
	public function get_settings($field = null)
	{
		// return value of a single setting
		if($field)
		{
			$settings = parent::get_all();
			$settings = $settings[0];
			$result = (property_exists($settings, $field)) ? $settings->{$field} : 'Invalid field.';
		}
		// return all settings
		else
		{
			$settings = parent::get_all();
			$result = $settings[0];
		}

		return $result;
	}
	
	
	public function update_iuran($bulan=0,$tahun=0)
	{
		$bulanx=date("m", mktime(0, 0, 0, $bulan-1  ,1 , $tahun));
		//ambil data pelanggan
		$pelanggan=$this->get_pelanggan();
		$baca_meter_current=$this->baca_meter_current($bulanx,$tahun);
		$baca_meter_sebelumnya=$this->baca_meter_sebelumnya($bulanx,$tahun);
		
		foreach ($pelanggan as $datapelanggan) { 
			
			//jumlah semua pembayaran masuk
			if($baca_meter_current[$datapelanggan['id']]['status']==1){ 
				$bayar=bayar(@$baca_meter_sebelumnya[$datapelanggan['id']]['baca_meter'],@$baca_meter_current[$datapelanggan['id']]['baca_meter'],$datapelanggan['jenis']);
				$totalb=$totalb+$bayar;
				// echo $bayar.'<br />';
			}
		}
		 
		//cek data apakah sudah ada
		
		$tgl=date("Y-m-d", mktime(0, 0, 0, $bulan  ,1 , $tahun));
		$cekPemb=$this->db->query('SELECT * FROM default_pneraca WHERE kode_rek=11 AND tanggal="'.$tgl.'"')->result_array();
		pr($bulan);
		pr($tahun);
		pr($totalb);
		pr($cekPemb);
		 echo $this->db->last_query();
		$bulanup=date("F Y", mktime(0, 0, 0, $bulan-1  ,1 , $tahun));
		if(empty($cekPemb)){
			//insert
			$datainsert=array(
						'tanggal' => $tgl,
						'kode_rek' => 11,
						'keterangan' => 'Iuran Pelanggan Untuk  '.$bulanup.'',
						'debit' => (int)$totalb,
						'kredit' => 0,
						'file' =>''
			);
			$this->db->insert('default_pneraca',$datainsert);
		}else{
			//update
			$this->db->where('id',$cekPemb[0]['id']);
			$datainsert=array(
						'tanggal' => $tgl,
						'kode_rek' => 11,
						'keterangan' => 'Iuran Pelanggan Untuk  '.$bulanup.'',
						'debit' => (int)$totalb,
						'kredit' => 0,
						'file' =>''
			);
			$this->db->update('default_pneraca',$datainsert);
			
		}
		 echo $this->db->last_query();
		//inputkan ke table neraca di posisi bulan berikutnya
		
		
	}
}