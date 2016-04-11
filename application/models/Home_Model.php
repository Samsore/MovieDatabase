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

        // $searchable = array('actor','director','profile');
        // foreach ($searchable as $person){
        //     $this->db->select('*');
        //     $this->db->from($person);
                
        //     $this->db->like('fname', $search_term);
        //     $this->db->or_like('lname', $search_term);
        //     // $this->db->or_like($person.'ID', $search_term);
        //     // $this->db->or_like('dateBirth', $search_term);
        //     // Execute the query.
        //     $query = $this->db->get();  
        // }

        // Return the results.
        return $query->result_array();
    }
    // MOVIE DETAIL PAGE SPECIFIC :::::A:::::
    public function get_actor($search_term='default'){

        $this->db->select('movieid');
        $this->db->from('movie');
        $this->db->Where('name', $search_term);
        // Execute the query.
        $query = $this->db->get();
        $arrayQuery = $query->result_array();
        foreach ($arrayQuery as $actor_val){
            $movieid = $actor_val['movieid'];
        }

        $this->db->select('lname, fname');
        $this->db->from('movie');
        $this->db->join('actor_movie', 'movie.movieid = actor_movie.movieid','inner');
        $this->db->join('actor', 'actor_movie.actorid = actor.actorid', 'inner');
        $this->db->Where('movie.movieid', $movieid);
        // Execute the query.
        $query = $this->db->get();
        return $query->result_array();
    }
     public function get_director($search_term='default'){

        $this->db->select('movieid');
        $this->db->from('movie');
        $this->db->Where('name', $search_term);
        // Execute the query.
        $query = $this->db->get();
        foreach ($query->result_array() as $actor_val){
            $search_term = $actor_val['movieid'];
        }

        $this->db->select('lname, fname');
        $this->db->from('movie');
        $this->db->join('director_movie', 'movie.movieid = director_movie.movieid','inner');
        $this->db->join('director', 'director_movie.directorid = director.directorid', 'inner');
        $this->db->Where('movie.movieid', $search_term);
        // Execute the query.
        $query = $this->db->get();
        return $query->result_array();
    }
    public function get_rating($search_term='default'){
        $this->db->select('Round(AVG(w. rating), 1)');
        $this->db->from('watches w, movie m');
        $this->db->Where('m.name',$search_term);
        $this->db->Where('w.movieid = m.movieid');
        
        // Execute the query.
        $query = $this->db->get();
        return $query->result_array();
    }
    // MOVIE DETAIL PAGE SPECIFIC :::::A:::::

    public function get_actor_name($firstname='default',$lastname='default'){
        $this->db->select('lname, fname');
        $this->db->from('actor');
        $this->db->Where('fname',$firstname);
        $this->db->Where('lname',$lastname);

        // Execute the query.
        $query = $this->db->get();
        return $query->result_array(); 
    }

    public function get_actor_birthdate($firstname='default',$lastname='default'){
        $this->db->select('datebirth');
        $this->db->from('actor');
        $this->db->Where('fname',$firstname);
        $this->db->Where('lname',$lastname);

        // Execute the query.
        $query = $this->db->get();
        return $query->result_array(); 
    }

    public function get_actor_roles($lastname='default'){
        $this->db->select('r.rolename, m.name');
        $this->db->from('actor a, role r, movie m');
        $this->db->Where('r.actorid = a.actorid');
        $this->db->Where('a.lname',$lastname);
        $this->db->Where('r.movieid = m.movieid');
        // Execute the query.
        $query = $this->db->get();
        return $query->result_array();
    }

    public function get_movie_id($search_term='default'){
        $this->db->select('movieid');
        $this->db->from('movie');
        $this->db->Where('name', $search_term);

        // Execute the query.
        $query = $this->db->get();
        return $query->result_array();
    }

    public function get_user_id($search_term='default'){
        $this->db->select('userid');
        $this->db->from('useraccount');
        $this->db->Where('username', $search_term);

        // Execute the query.
        $query = $this->db->get();
        return $query->result_array();
    }
    public function get_comments($search_term='default'){
        $this->db->select('a.comment, u.username');
        $this->db->from('user_movie a, movie m, useraccount u');
        $this->db->Where('a.movieid = m.movieid');
        $this->db->Where('a.userid = u.userid');
        $this->db->Where('m.name', $search_term);

        // Execute the query.
        $query = $this->db->get();
        return $query->result_array();
    }
    public function set_comments($movieid, $userid, $comment){
        $data = array('movieid' => $movieid,
                      'userid'  => $userid,
                      'comment' => $comment);
        $this->db->insert('user_movie',$data);
        return;
        }
}