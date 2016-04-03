<?php
class Movie_Model extends CI_Model {

        public function __construct()
        {
                $this->load->database();
        }
        public function get_actor()
        {
                $query = $this->db->query('SELECT * FROM "actor"');
                return $query->result_array();
        }
}