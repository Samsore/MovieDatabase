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
    public function get_results($search_term='default'){
        // Use the Active Record class for safer queries.
        $this->db->select('*');
        $this->db->from('movie');
        $this->db->like('name', $search_term);
        // Execute the query.
        $query = $this->db->get();

        // Return the results.
        return $query->result_array();
    }

}