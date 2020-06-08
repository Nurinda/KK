<?php 

class AdminModel extends CI_Model{
	function tampil_keluarga(){
		return $this->db->get('keluarga');
    }
    
    function tampil_warga(){
		return $this->db->get('warga');
    }
    
    function tampil_kk(){
		return $this->db->get('warga');
    }
    
    function tampil_lengkap(){
        return $this->db->query('select *,(year(curdate()) - year(warga.tanggal_lahir)) usia
        from kk
        join keluarga
        on kk.id_keluarga = keluarga.id
        left join warga
        on kk.id_warga = warga.nik');
    }
    
    function jumlah_admin(){
        return $this->db->count_all_results('admin');
    }
    function jumlah_warga(){
        return $this->db->count_all_results('warga');
    }
    function jumlah_keluarga(){       

        $query = $this->db->query('select kk.id_keluarga
        from kk
        left join keluarga
        on kk.id_keluarga = keluarga.id
        group by kk.id_keluarga');

        return $query->num_rows();

        // return $this->db->count_all_results('keluarga');
    }
}