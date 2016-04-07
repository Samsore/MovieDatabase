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
    public function get_actor($search_term='default'){

        $this->db->select('movieid');
        $this->db->from('movie');
        $this->db->Where('name', $search_term);
        // Execute the query.
        $query = $this->db->get();
        foreach ($query->result_array() as $actor_val){
            $movie_id_val = $actor_val['movieid'];
        }

        $this->db->select('lname, fname');
        $this->db->from('movie');
        $this->db->join('actor_movie', 'movie.movieid = actor_movie.movieid','inner');
        $this->db->join('actor', 'actor_movie.actorid = actor.actorid', 'inner');
        $this->db->Where('movie.movieid', $movie_id_val);
        // Execute the query.
        $query = $this->db->get();
        return $query->result_array();
    }
}