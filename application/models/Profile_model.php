<?php
class Profile_model extends CI_Model {
    
    public function __construct()
    {
        $this->load->database();
    }
    public function __allProfiles()
    {
        $query = $this->db->get('profile');
        return $query->result_array();
    }
     public function __addProfile()
    {
        $query = $this->db->get('');
    }
}