<?php
class Home_model extends CI_Model {

        public function __construct()
        {
                $this->load->database();
        }

        public function rand_movie(){
                $query = $this->db->query("SELECT * FROM movie WHERE released > '2016-01-01' ORDER BY RANDOM() LIMIT 3 ");
                return $query->result_array();
        }

}