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
    public function get_extra_info($id='default'){
        $sql = 'SELECT t.Description, languages, subtitles, mt.country, s.name  FROM MovieTopics mt, Topics t, Sponsors Sp, Studio s
                WHERE mt.MovieID = (Select MovieID
                                FROM Movie
                                Where name = ?)
                    AND (mt.TopicID = t.TopicID) AND Sp.movieID =  (Select MovieID
                                                FROM Movie
                                                Where name = ?)
                                                AND s.StudioID = Sp.StudioID';

                                                
        $query=$this->db->query($sql, array($id, $id));
        return $query->result_array();

        // $this->db->select('t.description, languages, subtitles, mt.country, s.name');
        // $this->db->from('movietopics mt, topics t, sponsors sp, studio s');
        // $this->db->Where('mt.MovieID = (Select MovieID
        //         FROM Movie
        //         Where name = '$search_term')');
        // $this->db->Where('mt.TopicID = t.TopicID');        
        // $this->db->Where(' Sp.movieID =  (Select MovieID
        //                         FROM Movie
        //                         Where name = '$search_term')');
        // $this->db->Where('s.StudioID = Sp.StudioID');

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

    public function get_profile($username){
        $this->db->select('u.username, u.fname, u.lname, u.email, u.city, u.province, u.country, p.agerange, p.yearborn, p.gender, p.occupation, p.device');
        $this->db->from('useraccount u, profile p');
        $this->db->Where('u.username',$username);
        $this->db->Where('p.userid = u.userid');

        // Execute the query.
        $query = $this->db->get();
        return $query->result_array();
    }
    public function get_roles_and_names($search_term="default"){
        $this->db->select('a.lname, a.fname, r.rolename');
        $this->db->from('actor a, movie m, actor_movie am, role r');
        $this->db->Where('m.name',$search_term);
        $this->db->Where('a.actorid = am.actorid');
        $this->db->Where('am.movieid = m.movieid');
        $this->db->Where('r.actorid = a.actorid');
        $this->db->Where('r.movieid = m.movieid');

         // Execute the query.
        $query = $this->db->get();
        return $query->result_array(); 
    }

    public function get_trailer($search_term="default"){
        $this->db->select('links');
        $this->db->from('movie');
        $this->db->Where('name',$search_term);
         // Execute the query.
        $query = $this->db->get();
        return $query->result_array(); 
    }

    public function check_watched($username, $search_term="default"){
        $this->db->select('w.userid');
        $this->db->from('watches w, useraccount u, movie m');
        $this->db->Where('u.username', $username);
        $this->db->Where('u.userid = w.userid');
        $this->db->Where('m.name', $search_term);
        $this->db->Where(' m.movieid = w.movieid');
        // Execute the query.
        $query = $this->db->get();
        return $query->result_array();
    }
    public function update_rating(){

    }
    public function set_rating($userid, $movieid="default", $rating){
        $query = array();
        $sql   = 'SELECT count(*) FROM watches WHERE userid = ? AND movieid = ?';
        $query = $this->db->query($sql, array($userid,$movieid));
        $data = $query->result_array();
        // foreach ($empty->result_array() as $emptytemp){
        //     $empty = $emptytemp['count'];
        if ($data[0]['count'] == 0){
            $data = array('movieid' => $movieid,
                          'userid'  => $userid,
                          'time'    => date("m/d/y"),
                          'repeats' => 1,
                          'rating'   => $rating);
            $this->db->insert('watches', $data);

        }else {
            $sql = 'UPDATE Watches
                    SET rating = ?
                    WHERE UserID = ? AND movieid = ?';
            $this->db->query($sql, array($rating, $userid, $movieid));
        } 

        return;
    }
    

//         INSERT INTO Watches (MovieID, UserID, time, Repeats, rating) 
// SELECT m.MovieID, u.UserID, Current_date, 1, 8 FROM Movie m, UserAccount u WHERE m.name = 'Se7en' and u.username = 'kiwikid';
}
