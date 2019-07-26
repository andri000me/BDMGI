<?php

class Pemesanan_kursi_model extends CI_Model {

	public function __construct()
	{
		$this->load->database();
	}

	public function get_list($search = FALSE)
	{
		if ($search === FALSE) {
			$query = $this->db->get('pemesanan_kursi');
			return $query->result();
		}
	}

	public function get_data($info)
	{
		$query = $this->db->get_where('pemesanan_kursi', array('IdPemesananKursi' => $info));
		return $query->row();
	}

	public function store()
	{
		$data = array(
			'IdPemesanan' => $this->input->post('IdPemesanan'),
			'IdKursi' => $this->input->post('IdKursi')
		);
		return $this->db->insert('pemesanan_kursi', $data);
	}

	public function update($id)
	{
		$data = array(
			'IdPemesanan' => $this->input->post('IdPemesanan'),
			'IdKursi' => $this->input->post('IdKursi')
		);
		$this->db->where('IdPemesananKursi', $id);
		return $this->db->update('pemesanan_kursi', $data);
	}

	public function destroy($id)
	{
		$this->db->where('IdPemesananKursi', $id);
		$this->db->delete('pemesanan_kursi');
		return true;
	}

}
