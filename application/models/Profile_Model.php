<?php
class Profil_Model extends CI_Model
{

        public function __construct()
        {
                $this->load->database();
        }

       
        public function get_profile()
        {
                
                $query = $this->db->query('SELECT * FROM "profile"');
                return $query->result_array();
                
        }
}
