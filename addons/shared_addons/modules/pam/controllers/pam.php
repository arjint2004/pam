<?php defined('BASEPATH') or exit('No direct script access allowed');

class Pam extends Public_Controller
{

	public function __construct()
	{
		parent::__construct();

	}

	public function index()
	{
		redirect('admin/pam/cari');
	}
}
