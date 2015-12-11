<?php defined('BASEPATH') or exit('No direct script access allowed');

/**
 * Pam Module
 *
 * @author Michael Giuliana
 */
class Module_Pam extends Module {

	public $version = '1.1.0';

	public function info()
	{
		return array(
			'name' => array(
				'en' => 'Pam',
				'fr' => 'Pam',
			),
			'description' => array(
				'en' => 'Software administrasi SPAMDES TIRTO ROSO GAMPLONG.',
				'fr' => 'Software administrasi SPAMDES TIRTO ROSO GAMPLONG.',
			),
			'frontend' => false,
			'backend'  => true,
			'skip_xss' => false,
			'menu'	  => 'content',

			'roles' => array(),

			'sections' => array(
				/*'pelanggan' => array(
					'name' => 'Pelanggan',
					'uri' => 'admin/pam/pelanggan',
				),
				'Statistic' => array(
					'name' => 'Statistic',
					'uri' => 'admin/pam/statistic',
				),
				'rekaptunggakan' => array(
					'name' => 'Rekaptunggakan',
					'uri' => 'admin/pam/rekaptunggakan',
				),*/
				'pembukuan' => array(
					'name' => 'Pembukuan',
					'uri' => 'admin/pam/pembukuan',
				),
				'inputdata' => array(
					'name' => 'Inputdata',
					'uri' => 'admin/pam/inputdata',
				),
				'lihatdata' => array(
					'name' => 'Lihat_Data',
					'uri' => 'admin/pam/lihat_data',
				),
				'cari' => array(
					'name' => 'Cari',
					'uri' => 'admin/pam/cari',
				),
				'tambah_transaksi' => array(
					'name' => 'Tambah_transaksi',
					'uri' => 'admin/pam/tambah_transaksi',
				),
				'tunggakan' => array(
					'name' => 'Tunggakan',
					'uri' => 'admin/pam/tunggakan',
				),
				'laporan_tunggakan' => array(
					'name' => 'Laporan_Tunggakan',
					'uri' => 'admin/pam/laporan_tunggakan',
				),
			),
		);
	}


	public function install()
	{
		$this->dbforge->drop_table('pam');

		// Define tables
		$tables = array(
			'pam' => array(
				'id' => array('type' => 'INT', 'constraint' => 11, 'auto_increment' => true, 'primary' => true,),
				'folder_id' => array('type' => 'INT', 'constraint' => 11, 'default' => 0),
				'jquery' => array('type' => 'INT', 'constraint' => 11, 'default' => 0),
			),
		);

		// Install Tables
		if ( ! $this->install_tables($tables))
		{
			return false;
		}


		$default_folder = array(
			'id'			=> null,
			'parent_id'		=> 0,
			'slug'			=> 'pam-module',
			'name'			=> 'Pam Module',
			'location'		=> 'local',
			'date_added'	=> now(),
			);


		/**
		 * Default file folder
		 */
		$query = $this->db->get_where('file_folders', array('name' => 'Pam Module'));
		$folder_exists = $query->row();
		if($folder_exists)
		{
			$folder_id = $folder_exists->id;
		}
		else
		{
			$this->db->insert('file_folders', $default_folder);
			$folder_id = $this->db->insert_id();
		}

		

		$default_settings = array(
			'id'		 => 1,
			'folder_id'  => $folder_id,
			'jquery' 	 => 0,
		);

		// Insert config
		if ( ! $this->db->insert('pam', $default_settings))
		{
			return false;
		}

		return true;
	}


	public function uninstall()
	{
		$this->dbforge->drop_table('pam', true);
		return true;
	}


	public function upgrade($old_version)
	{
		// Upgrade Logic
		return true;
	}
}