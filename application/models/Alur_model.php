<?php

class Alur_model extends CI_Model {

	public function __construct()
	{
		$this->load->database();
	}
	
	public function store_pemesan()
	{
		$data = array(
			'NoIdentitas' => $this->input->post('Noidentitas'),
			'NamaPemesan' => $this->input->post('NamaPemesan'),
			'Umur' => $this->input->post('Umur'),
			'JenisKelamin' => $this->input->post('JenisKelamin'),
			'NoTelepon' => $this->input->post('NoTelepon')
		);
		return $this->db->insert('pemesan', $data);
	}

	public function store_pemesanan()
	{
		$data = array(
			'NoIdentitas' => $this->input->post('NoIdentitas'),
			'IdJadwal' => $this->input->post('IdJadwal'),
			'IdAdmin' => $this->input->post('JenisKelamin'),
			'JumlahPenumpang' => $this->input->post('JumlahPenumpang'),
			'TanggalPesan' => $this->input->post('TanggalPesan'),
			'TanggalBerangkat' => $this->input->post('TanggalBerangkat')
		);
		$this->db->insert('pemesanan', $data);
		$insert_id = $this->db->insert_id();
		return $insert_id;
	}

	public function store_pemesanan_kursi()
	{
		$data = array(
			'IdPemesanan' => $this->input->post('IdPemesanan'),
			'IdKursi' => $this->input->post('IdKursi')
		);
		$this->db->insert('pemesanan_kursi', $data);
	}

	public function store_pembayaran()
	{
		$data = array(
			'IdPemesanan' => $this->input->post('IdPemesanan'),
			'TotalBayar' => $this->input->post('TotalBayar'),
			'Status' => $this->input->post('Status')
		);
		return $this->db->insert('pembayaran', $data);
	}
}
