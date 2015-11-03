<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Admin extends Admin_Controller {

	/**
	 * The current active section
	 *
	 * @var string
	 */
	protected $section = 'pam';

	public function __construct()
	{
		parent::__construct();

		// load classes, libs, language
		//$this->lang->load('pam');
		//$this->load->library('form_validation');
		$this->load->helper('pam');
		$this->load->model(array('pams_m', 'files/file_folders_m',));

		// set validation rules
		//$this->form_validation->set_rules($this->pams_m->_validation_rules);

		// template settings
		//$this->template->title($this->module_details['name']);
	}


	public function cari()
	{
		if(isset($_POST['tahun']) && isset($_POST['alamat']) && isset($_POST['nama']) && isset($_POST['cari'])){
			$pelanggan=$this->pams_m->get_pelanggan_cari($_POST['tahun'],$_POST['alamat'],$_POST['nama']);
		}else{
			$pelanggan=array();
		}
		//pr($baca_meter_sebelumnya);die(); 
		// set template vars and build
		$this->template
			->set('settings', $this->pams_m->get_settings())
			->set('pelanggan', $pelanggan)
			->build('admin/cari');		
	}
	public function pelanggan()
	{
		$this->template->build('admin/pelanggan');	
	}
	public function rekaptunggakan()
	{
		
		$this->template->build('admin/rekaptunggakan');	
	}
	public function pembukuan()
	{	
		
		$rekening=$this->db->query("SELECT * FROM default_pnama_rekening ")->result_array();
		if(isset($_POST['bulan']) && isset($_POST['tahun'])){
			$neraca=$this->db->query("SELECT n.*,r.nama FROM default_pneraca n JOIN default_pnama_rekening r ON n.kode_rek=r.id WHERE month(n.tanggal)='".$_POST['bulan']."' AND year(n.tanggal)='".$_POST['tahun']."' ORDER BY n.tanggal ASC")->result_array();
		}else{
			$neraca=$this->db->query("SELECT n.*,r.nama FROM default_pneraca n JOIN default_pnama_rekening r ON n.kode_rek=r.id WHERE month(n.tanggal)='".date('m')."' AND year(n.tanggal)='".date('Y')."' ORDER BY n.tanggal ASC")->result_array();
		}
		$this->template
			->set('neraca', $neraca)
			->build('admin/pembukuan');			 
	}
	public function print_transaksi($file='')
	{ 
		exec('lp '.base64_decode($file).'');
		redirect('admin/pam/pembukuan');
	}
	public function tambah_transaksi()
	{
		$rekening=$this->db->query("SELECT * FROM default_pnama_rekening ")->result_array();
		foreach($rekening as $dtrk){
			$rekening2[$dtrk['id']]=$dtrk;
		}
		$rekening=$rekening2;unset($rekening2);

		if(isset($_POST['simpan'])){
			//pr($_POST);die();
			$posisid=0;
			$posisik=0;
			$poiu='';
			foreach($_POST['keterangan'] as $idx=>$dataket){
				if($_POST['nominal'][$idx]!=0 || $_POST['nominal'][$idx]!=''){
					if($_POST['posisi'][$idx]=='debit'){
						$posisid=$_POST['nominal'][$idx];
						$jn='PEMASUKAN';
						$diterima_dari=$_POST['penyetor'][$idx];
					}else{$posisid=0;}
					if($_POST['posisi'][$idx]=='kredit'){
						$posisik=$_POST['nominal'][$idx];
						$jn='PENGELUARAN';
						$diterima_dari='SPAMDES TIRTO ROSO';
					}else{$posisik=0;}
					$jumlah=$posisik+$posisid;
					$tanggal=date("d-F-Y", mktime(0, 0, 0, date('m')  ,date('d') , date('Y')));
					//if(isset($_POST['print']) AND $_POST['print'][$idx]==1){					
		$tempprint='-----------------------------------------------------------------------
BUKTI '.$jn.' SPAMDES TIRTO ROSO
-----------------------------------------------------------------------
Nomor			:'.$_POST['kode_rek'][$idx].'_'.$rekening[$_POST['kode_rek'][$idx]]['nama'].'
Diterima Dari		:'.$diterima_dari.'
Jumlah        		:'.$jumlah.'
Terbilang 		: '.Terbilang($_POST['nominal'][$idx]).' Rupiah
Untuk Pembayaran 	: '.$_POST['keterangan'][$idx].' 
Tanggal 		: '.$tanggal.'
-----------------------------------------------------------------------';		
						$pathkwitansi='/home/pi/trunk/kwitansi/'.$tanggal.'_kwitansi_'.str_replace(' ','_',$rekening[$_POST['kode_rek'][$idx]]['nama']).'.txt';
						file_put_contents($pathkwitansi,$tempprint);
						//$poiu .='exec("lp '.$pathkwitansi.'",$out'.$idx.'); ';
					//}	
					
					$datainsert=array(
										'tanggal'=>$_POST['tanggal'][$idx],
										'kode_rek'=>$_POST['kode_rek'][$idx],
										'keterangan'=>$_POST['keterangan'][$idx],
										'debit'=>$posisid,
										'kredit'=>$posisik,
										'file'=>$pathkwitansi,
					);
					$this->db->insert('default_pneraca',$datainsert);
				}
				
			}
				//eval($poiu);
				//echo $poiu;

		}
		
		$this->template
			->set('rekening', $rekening)
			->build('admin/tambah_transaksi');			 
	}
	public function printkwitansi($id_pelanggan=0,$bulan=0,$tahun=0,$nomark=0)
	{ 

		$pelanggan=$this->pams_m->get_pelanggan_by_id($id_pelanggan);
		$baca_meter_current=$this->pams_m->baca_meter_current($bulan,$tahun,$id_pelanggan);
		$baca_meter_sebelumnya=$this->pams_m->baca_meter_sebelumnya($bulan,$tahun,$id_pelanggan);

		$bulan_currents=explode('-',$baca_meter_current[$id_pelanggan]['bulan']);
		$bulan_sebelumnya=explode('-',$baca_meter_sebelumnya[$id_pelanggan]['bulan']);

		$pemakaian=$baca_meter_current[$id_pelanggan]['baca_meter']-$baca_meter_sebelumnya[$id_pelanggan]['baca_meter'];
		$bayars=bayar($baca_meter_sebelumnya[$id_pelanggan]['baca_meter'],$baca_meter_current[$id_pelanggan]['baca_meter'],$pelanggan[0]['jenis']);	
		$bulanbayar=strtoupper(date("F", mktime(0, 0, 0, $bulan_currents[1]  ,$bulan_currents[2] , $bulan_currents[0])));
		$tahunbayar=date("Y", mktime(0, 0, 0, $bulan_currents[1]  ,$bulan_currents[2] , $bulan_currents[0]));
		$dikurang=5;
		if($baca_meter_sebelumnya[$id_pelanggan]['baca_meter']==0 && $baca_meter_current[$id_pelanggan]['baca_meter']!=0){$dikurang=10;}else{$dikurang=5;}
		$tempprint='-----------------------------------------------------------------------
BUKTI PEMBAYARAN UNTUK BULAN '.$bulanbayar.' TAHUN '.$tahunbayar.' SPAMDES TIRTO ROSO
-----------------------------------------------------------------------
Nomor			:GP_'.$pelanggan[0]['alamat'].'_%s
Nama pelanggan		:%s
Alamat        		:Gamplong %s

Pemakaian			Bulan %s %s m3
				Bulan %s   %s m3
				____________________ _	
				Pemakaian        %s m3
				 
Rumus			: ((%s-'.$dikurang.')*2000)+15000 = %s	 
Jumlah dibayar		: %s
Terbilang 		: %s
Admin			: Asbin Arjinto S.Kom
Tanggal 		: %s
-----------------------------------------------------------------------';

		$nomor=$pelanggan[0]['nomor'];
		$nama=$pelanggan[0]['nama'];
		$alamat=$pelanggan[0]['alamat'];
		$bulan_current=date("F", mktime(0, 0, 0, $bulan_currents[1]  ,$bulan_currents[2] , $bulan_currents[0]));
		$baca_meter_currentt=$baca_meter_current[$id_pelanggan]['baca_meter'];
		$bulan_sebelum=date("F", mktime(0, 0, 0, $bulan_sebelumnya[1]  ,$bulan_sebelumnya[2] , $bulan_sebelumnya[0]));
		$baca_meter_sebelum=$baca_meter_sebelumnya[$id_pelanggan]['baca_meter'];
		$pemakaian=$pemakaian;
		$jml_bayar= 'Rp. ' . number_format( $bayars, 0 , '' , '.' ) . ',-';
		$terbilang=Terbilang($bayars).'Rupiah';
		$tanggal=date("d-F-Y", mktime(0, 0, 0, date('m')  ,date('d') , date('Y')));
		$tempprint2=sprintf($tempprint,$nomor,$nama,$alamat,$bulan_current,$baca_meter_currentt,$bulan_sebelum,$baca_meter_sebelum,$pemakaian,$pemakaian,$jml_bayar,$jml_bayar,$terbilang,$tanggal);
		
		$datainsert=array(
				'status'=>1
				);
		if($nomark==0){
			$this->db->where('id',$baca_meter_current[$id_pelanggan]['id']);
			$this->db->update('default_pembayaran',$datainsert);		
		//echo $this->db->last_query();
		}
		$pathkwitansi='/home/pi/trunk/kwitansi/kwitansi_GP_'.$alamat.'_'.$nomor.'_'.$bulanbayar.'_'.$tahunbayar.'.txt';
		file_put_contents($pathkwitansi,$tempprint2);
		exec("lp ".$pathkwitansi."");
		//echo "lp ".$pathkwitansi."";
		//exec("lp /home/pi/trunk/kwitansi/kwitansi2.txt");
		//echo $tempprint2;
		//die(); 
		redirect('admin/pam/cari');
	}
	public function inputdata()
	{   
		
		if(isset($_POST['bulan']) && isset($_POST['tahun'])){
			$pelanggan=$this->pams_m->get_pelanggan($_POST['bulan'],$_POST['tahun']);
			$baca_meter_current=$this->pams_m->baca_meter_current($_POST['bulan'],$_POST['tahun']);
			$baca_meter_sebelumnya=$this->pams_m->baca_meter_sebelumnya($_POST['bulan'],$_POST['tahun']);
			$bulan_sebelum=date("M", mktime(0, 0, 0, $_POST['bulan']-1, 10));
			$bulan=date("M", mktime(0, 0, 0, $_POST['bulan'], 10));
			
			$bulan_sebelum_a=date("Y-m-d", mktime(0, 0, 0, $_POST['bulan']-1  ,1 , $_POST['tahun']));
			$bulan_a=date("Y-m-d", mktime(0, 0, 0, $_POST['bulan']  ,1 , $_POST['tahun']));	
			
			$bln=date("m", mktime(0, 0, 0, $_POST['bulan']  ,1 , $_POST['tahun']));		
			$thn=date("Y", mktime(0, 0, 0, $_POST['bulan']  ,1 , $_POST['tahun']));		
		}else{
			$pelanggan=$this->pams_m->get_pelanggan();
			$baca_meter_current=$this->pams_m->baca_meter_current();
			$baca_meter_sebelumnya=$this->pams_m->baca_meter_sebelumnya();
			$bulan_sebelum=date("M", mktime(0, 0, 0, date('m')-2, 10));
			$bulan=date("M", mktime(0, 0, 0, date('m')-1, 10));
			
			$bulan_sebelum_a=date("Y-m-d", mktime(0, 0, 0, date('m')-2  ,1 , date('Y')));
			$bulan_a=date("Y-m-d", mktime(0, 0, 0, date('m')-1  ,1 , date('Y')));
			
			$bln=date("m", mktime(0, 0, 0, date('m')-1  ,1 , date('Y')));
			$thn=date("Y", mktime(0, 0, 0, date('m')-1  ,1 , date('Y')));
		}
		//simpan data
		if(isset($_POST['simpan']) && $_POST['simpan']=='save'){
			
			
			foreach($_POST['pemakaian'][$_POST['bulaninput']] as $id_pelanggan=>$baca_meter){

				if(!isset($baca_meter_current[$id_pelanggan]['baca_meter'])){
					$datainsert=array(
									'id_pelanggan'=>$id_pelanggan,
									'bulan'=>$_POST['bulaninput'],
									'baca_meter'=>(int)$baca_meter,
									'harus_bayar'=>0,
									'dibayar'=>0,
									'selisih'=>0,
									'tanggal'=>date('Y-m-d H:i:s'),
									'status'=>0,
					);
					$this->db->insert('default_pembayaran',$datainsert);
				}else{
				$datainsert=array(
								'baca_meter'=>$baca_meter
								);
					$this->db->where('id',$baca_meter_current[$id_pelanggan]['id']);
					$this->db->update('default_pembayaran',$datainsert);
				}
				//pr($baca_meter_current[$id_pelanggan]['baca_meter']);
				//pr($baca_meter_current);die();
				//echo $this->db->last_query().'<br />';
			}
		}
		//pr($baca_meter_sebelumnya);die(); 
		// set template vars and build
		$this->template
			->set('settings', $this->pams_m->get_settings())
			->set('baca_meter_current', $baca_meter_current)
			->set('baca_meter_sebelumnya', $baca_meter_sebelumnya)
			->set('pelanggan', $pelanggan)
			->set('bulan_sebelum', $bulan_sebelum)
			->set('bulan', $bulan)
			->set('bulan_sebelum_a', $bulan_sebelum_a)
			->set('bulan_a', $bulan_a)
			->set('bln', $bln)
			->set('thn', $thn)
			->build('admin/inputdata');	
	}
	public function statistic()
	{
		$this->template->build('admin/statistic');	
	}
	public function index()
	{
		// if val is run
		if ($this->form_validation->run())
		{
			// get posted vars
			$id = $this->input->post('id');
			$props = array(
				'jquery'	=> $this->input->post('jquery'),
				'folder_id' => $this->input->post('folder_id'),
			);

			if ($id = $this->pams_m->update($id, $props))
			{
				$this->session->set_flashdata('success', 'Settings updated.');
			}
			else
			{
				$this->session->set_flashdata('error', 'Settings updated failed.');
			}

			redirect('admin/pam');
		}

		// loop through each validation rule
		foreach ($this->pams_m->_validation_rules as $rule)
		{
			$this->pams_m->{$rule['field']} = set_value($rule['field']);
		}

		// get folders for dropdown
		$folders = $this->file_folders_m->get_all();
		foreach($folders as $folder)
		{
			$select_folders[$folder->id] = $folder->name;
		}

		// set template vars and build
		$this->template
			->set('settings', $this->pams_m->get_settings())
			->set('folders', $select_folders)
			->build('admin/index');
	}
}