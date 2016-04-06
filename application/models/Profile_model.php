<?php
class Profil_model extends CI_Model {

        public function __construct()
        {
                $this->load->database();
        }
        public function get_profile($slug = FALSE)
        {
        if ($slug === FALSE)
        {
                $query = $this->db->query('SELECT * FROM "profile"');
                return $query->result_array();
        }

        $query = $this->db->get_where('profile', array('slug' => $slug));
        return $query->row_array();
        }
        public function set_profile()
        {
            $this->load->helper('url');

            $slug = url_title($this->input->post('title'), 'dash', TRUE);

            $data = array(
                'title' => $this->input->post('title'),
                'slug' => $slug,
                'text' => $this->input->post('text')
            );

            return $this->db->insert('profile', $data);
        }
        public function rand_profile(){
                $query = $this->db->query('SELECT * FROM profile ORDER BY RANDOM() LIMIT 1');
                return $query->result_array();
        }
}