<?php

class Pemesanan_model extends CI_Model {

	public function __construct()
	{
		$this->load->database();
	}

	public function get_list($search = FALSE)
	{
		if ($search === FALSE) {
			$query = $this->db->get('pemesanan');
			return $query->result();
		}
	}

	public function get_data($info)
	{
		$query = $this->db->get_where('pemesanan', array('IdPemesanan' => $info));
		return $query->row();
	}

	public function store()
	{
		$data = array(
			'NoIdentitas' => $this->input->post('NoIdentitas'),
			'IdJadwal' => $this->input->post('IdJadwal'),
			'IdAdmin' => $this->input->post('JenisKelamin'),
			'JumlahPenumpang' => $this->input->post('JumlahPenumpang'),
			'TanggalPesan' => $this->input->post('TanggalPesan'),
			'TanggalBerangkat' => $this->input->post('TanggalBerangkat')
		);
		return $this->db->insert('pemesanan', $data);
	}

	public function update($id)
	{
		$data = array(
			'NoIdentitas' => $this->input->post('NoIdentitas'),
			'IdJadwal' => $this->input->post('IdJadwal'),
			'IdAdmin' => $this->input->post('JenisKelamin'),
			'JumlahPenumpang' => $this->input->post('JumlahPenumpang'),
			'TanggalPesan' => $this->input->post('TanggalPesan'),
			'TanggalBerangkat' => $this->input->post('TanggalBerangkat')
		);
		$this->db->where('IdPemesanan', $id);
		return $this->db->update('pemesanan', $data);
	}

	public function destroy($id)
	{
		$this->db->where('IdPemesanan', $id);
		$this->db->delete('pemesanan');
		return true;
	}

}
