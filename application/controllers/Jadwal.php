<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Jadwal extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		if (empty($this->session->username)) {
			redirect('auth/login');
		}
	}

	public function index()
	{
		$data_get = $this->jadwal_model->get_list();
		$data = array(
			'info' => $data_get,
			'activeMenu' => 'jadwal',
            'title' => 'Jadwal'
        );
		$this->slice->view('pages.jadwal.index', $data);
	}

	public function create()
	{
		$data = array(
            'title' => 'Tambah Jadwal Baru'
        );
		$this->slice->view('pages.jadwal.form', $data);
	}

	public function store()
	{
		$this->form_validation->set_rules('IdRute', 'Rute', 'required');
		$this->form_validation->set_rules('PlatNomor', 'Plat Nomor (Bis)', 'required');
		$this->form_validation->set_rules('Waktu', 'Waktu Keberangkatan', 'required');

		if($this->form_validation->run() === FALSE) {
			$this->session->set_flashdata('error', validation_errors());
			redirect('jadwal/create');
		} else {
			$this->jadwal_model->store();
			$this->session->set_flashdata('success', 'Jadwal baru telah ditambahkan');
			redirect('jadwal');
		}
	}
	
	public function edit($id) {
		$data_get = $this->jadwal_model->get_data($id);
		if (empty($data_get)) {
			redirect('jadwal');
		}
		$data = array(
			'info' => $data_get,
            'title' => 'Ubah Jadwal #'.$id
        );
		$this->slice->view('pages.jadwal.form', $data);
	}

	public function update($id)
	{
		$this->form_validation->set_rules('IdRute', 'Rute', 'required');
		$this->form_validation->set_rules('PlatNomor', 'Plat Nomor (Bis)', 'required');
		$this->form_validation->set_rules('Waktu', 'Waktu Keberangkatan', 'required');

		if($this->form_validation->run() === FALSE) {
			$this->session->set_flashdata('error', validation_errors());
			redirect('jadwal/edit/'.$id);
		} else {
			$this->jadwal_model->update($id);
			$this->session->set_flashdata('success', 'Jadwal #'.$id.' telah diperbaharui');
			redirect('jadwal');
		}
	}

	public function destroy($id)
	{
		$this->jadwal_model->destroy($id);
		$this->session->set_flashdata('success', 'Jadwal #'.$id.' telah terhapus');
		redirect('jadwal');
	}
}
