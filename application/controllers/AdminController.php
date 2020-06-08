<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class AdminController extends CI_Controller {

    function __construct(){
		parent::__construct();		
		$this->load->model('AdminModel');
        $this->load->helper('url');
	}

	public function home()
	{
        $data['warga'] = $this->AdminModel->tampil_warga()->result();
        $data['lengkap'] = $this->AdminModel->tampil_lengkap()->result();
        $data['JumlahAdmin'] = $this->AdminModel->jumlah_admin();
        $data['JumlahWarga'] = $this->AdminModel->jumlah_warga();
        $data['jumlahKeluarga'] = $this->AdminModel->jumlah_keluarga();
        $this->load->view('home',$data);
    }

    public function warga()
	{
        $data['warga'] = $this->AdminModel->tampil_warga()->result();
        $data['lengkap'] = $this->AdminModel->tampil_lengkap()->result();
        $data['JumlahAdmin'] = $this->AdminModel->jumlah_admin();
        $data['JumlahWarga'] = $this->AdminModel->jumlah_warga();
        $data['jumlahKeluarga'] = $this->AdminModel->jumlah_keluarga();
        $this->load->view('warga',$data);
    }
    
    
}
