<?php

class Pembayaran_model extends CI_Model {

	public function __construct()
	{
		$this->load->database();
	}

	public function get_list($search = FALSE)
	{
		if ($search === FALSE) {
			$query = $this->db->get('pembayaran');
			return $query->result();
		}
	}

	public function get_data($info)
	{
		$query = $this->db->get_where('pembayaran', array('IdPemesanan' => $info));
		return $query->row();
	}

	public function store()
	{
		$data = array(
			'IdPemesanan' => $this->input->post('IdPemesanan'),
			'TotalBayar' => $this->input->post('TotalBayar'),
			'Status' => $this->input->post('Status')
		);
		return $this->db->insert('pembayaran', $data);
	}

	public function update($id)
	{
		$data = array(
			'IdPemesanan' => $this->input->post('IdPemesanan'),
			'TotalBayar' => $this->input->post('TotalBayar'),
			'Status' => $this->input->post('Status')
		);
		$this->db->where('IdPemesanan', $id);
		return $this->db->update('pembayaran', $data);
	}

	public function destroy($id)
	{
		$this->db->where('IdPemesanan', $id);
		$this->db->delete('pembayaran');
		return true;
	}

}
