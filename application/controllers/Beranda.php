<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Beranda extends CI_Controller {
	
	public function __construct()
	{
		parent::__construct();
		if (empty($this->session->username)) {
			redirect('auth/login');
		}
	}

	public function index()
	{
		$data = array(
			'activeMenu' => 'beranda',
            'title' => 'Beranda'
        );
		$this->slice->view('pages.beranda', $data);
	}
}
